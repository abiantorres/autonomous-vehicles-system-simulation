#!/usr/bin/env python

import rosbag, rospy, actionlib, time
from gazebo_msgs.msg import ModelState
from std_msgs.msg import Empty
from std_srvs.srv import Empty
from gazebo_msgs.srv import SetModelState
from geometry_msgs.msg import PoseArray
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from actionlib_msgs.msg import *
from obstacles_util import ObstaclesModelGenerator
from results_util import SimulationResults
from db_client import DBClient
# Path information messages
from costum_msgs.msg import SimulationMsg

class SimulationExecutor():

    def __init__(self):
        self.db_client = DBClient()
        # Get some parameters
        self.plan_file = rospy.get_param('~plan_file')
        self.n_iterations = int(rospy.get_param('~n_iterations'))
        self.distance_between_obstacles = \
            float(rospy.get_param('~distance_between_obstacles'))
        self.robot_radius = float(rospy.get_param('~robot_radius'))
        self.obstacle_length = float(rospy.get_param('~obstacle_length'))
        self.max_obstacle_shiftment = \
            float(rospy.get_param('~max_obstacle_shiftment'))
        self.timeout_factor = int(rospy.get_param('~timeout_factor'))
        self.max_robot_speed = float(rospy.get_param('~max_robot_speed'))
        self.simulation_data_pub = \
            rospy.Publisher('/simulation_data', SimulationMsg, queue_size=1)
        self.poseArray_publisher = rospy.Publisher('/waypoints', PoseArray, queue_size=1)
        self.frame_id = rospy.get_param('~goal_frame_id','map')
        # List of 2D points that describe de trajectory of the robot
        self.points_2d = []
        # Initial robot state
        self.initial_state = ModelState()
        # Trayectory goals
        self.waypoints = []
        # Get plan
        self.get_plan_from_file()
        # Build an obstacles model generator
        self.obstacles_model_generator = \
            ObstaclesModelGenerator("MySimulation", self.obstacle_length,\
            self.robot_radius, self.points_2d[0][0], self.points_2d[0][1],\
            self.distance_between_obstacles, self.max_obstacle_shiftment)
        i = 0
        # Append a segment
        for point in self.points_2d:
            if(i != 0):
                self.obstacles_model_generator.append_point(\
                    str(i), point[0], point[1])
            i += 1
        self.n_segments = len(self.waypoints)
        # Buil a results listener
        self.simulation_results_listener = \
            SimulationResults(self.n_segments, self.n_iterations)
        # Set some metadata for each segment
        for i in range(0, self.n_segments):
            if(i != 0):
                self.simulation_results_listener.set_segment_metadata(i, \
                    self.points_2d[i - 1][0], self.points_2d[i - 1][1], \
                    self.points_2d[i][0], self.points_2d[i][1], self.distance_between_obstacles, \
                    self.obstacles_model_generator.segments[i].get_segment_timeout(\
                    self.max_robot_speed, self.timeout_factor))
            else:
                self.simulation_results_listener.set_segment_metadata(i, \
                    self.points_2d[0][0], self.points_2d[0][1], \
                    self.points_2d[1][0], self.points_2d[1][1], self.distance_between_obstacles, \
                    self.obstacles_model_generator.segments[0].get_segment_timeout(\
                    self.max_robot_speed, self.timeout_factor))

    def reset_gazebo_world(self):
        # reset the gazebo world to the initial state
        rospy.wait_for_service('/gazebo/reset_world')
        reset_world = rospy.ServiceProxy('/gazebo/reset_world', Empty)
        try:
          res = reset_world()
        except rospy.ServiceException as exc:
          rospy.loginfo("Service did not process request: " + str(exc))

    def set_vehicle_model_state(self):
        # Se the initial robot model state
        rospy.wait_for_service('gazebo/set_model_state')
        set_model_state = rospy.ServiceProxy('gazebo/set_model_state', SetModelState)
        try:
            set_model_state(self.initial_state)
        except rospy.ServiceException as exc:
            rospy.loginfo("Service did not process request: " + str(exc))

    def get_plan_from_file(self):
        """
        Function with allows us to get a path pre-configured from file and
        load it to be used in the simulation.
        """
        self.waypoints = []
        self.points_2d = []
        # Read the ros bag file from ~/.ros/
        bag = rosbag.Bag(self.plan_file)
        # Get the robot initial state
        for topic, msg, t in bag.read_messages(topics=['initial_model_state']):
            self.initial_state = msg
            self.points_2d.append((round(float(msg.pose.position.x),2),\
                round(float(msg.pose.position.y),2)))
        # Get the trayectory goals
        for topic, msg, t in bag.read_messages(topics=['path_goals_bag']):
            self.waypoints.append(msg)
            self.points_2d.append((round(float(msg.pose.pose.position.x), 2),\
                round(float(msg.pose.pose.position.y),2)))
        bag.close()

    def convert_PoseWithCovArray_to_PoseArray(self):
        """Used to publish waypoints as pose array so that you can see them in rviz, etc."""
        poses = PoseArray()
        poses.header.frame_id = 'map'
        poses.poses = [pose.pose.pose for pose in self.waypoints]
        return poses

    def start(self):
        """ Low level information publisher. High level should be
        subscribed to the simulation_data topic.
        """
        # Get a move_base action client
        client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
        client.wait_for_server()
        # Start publishing goals
        for i in range(0, self.n_iterations):
            self.poseArray_publisher.publish(self.convert_PoseWithCovArray_to_PoseArray())
            # Initialize the simulation for each iteration
            self.reset_gazebo_world()
            self.set_vehicle_model_state()
            self.obstacles_model_generator.spawn_obstacles()
            for j in range(0, self.n_segments):
                # Build goal
                goal = MoveBaseGoal()
                goal.target_pose.header.frame_id = self.frame_id
                goal.target_pose.header.stamp = rospy.Time.now()
                goal.target_pose.pose.position = self.waypoints[j].pose.pose.position
                goal.target_pose.pose.orientation = self.waypoints[j].pose.pose.orientation
                self.simulation_results_listener.start(j, i)
                # send the goal
                client.send_goal(goal)
                finished_within_time = client.wait_for_result(\
                    rospy.Duration(self.simulation_results_listener.segments_metadata[j].segment_simulation_timeout))
                # Check simulation state
                if not finished_within_time:
                    client.cancel_goal()
                    self.simulation_results_listener.stop(j, i, True)
                    break
                else:
                    state = client.get_state()
                    if state == GoalStatus.SUCCEEDED:
                        self.simulation_results_listener.stop(j, i, False)
                    else:
                        self.simulation_results_listener.stop(j, i, True)
                        break
                time.sleep(3)
        msg = self.simulation_results_listener.get_msg(\
            self.plan_file, self.timeout_factor)
        self.simulation_data_pub.publish(msg)
        self.db_client.insert_simulation_results(msg)
