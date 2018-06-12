#!/usr/bin/env python

import rosbag, rospy, actionlib, time, sys, csv, rospkg, re, os
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
import Tkinter
import tkMessageBox

class SimulationExecutor():

    def __init__(self):
        self.rospack = rospkg.RosPack()
        self.navigation_pkg_path = str(self.rospack.get_path('navigation'))
        self.csv_path = re.sub("navigation","", self.navigation_pkg_path)
        self.csv_path = re.sub("/src/","/csv/",self.csv_path)

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
                    self.points_2d[i][0], self.points_2d[i][1], \
                    self.points_2d[i+1][0], self.points_2d[i+1][1], self.distance_between_obstacles, \
                    self.obstacles_model_generator.segments[i].get_segment_timeout(\
                    self.max_robot_speed, self.timeout_factor))
            else:
                self.simulation_results_listener.set_segment_metadata(0, \
                    self.points_2d[0][0], self.points_2d[0][1], \
                    self.points_2d[1][0], self.points_2d[1][1], self.distance_between_obstacles, \
                    self.obstacles_model_generator.segments[0].get_segment_timeout(\
                    self.max_robot_speed, self.timeout_factor))
            i += 1

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

    def msg_to_csv(self, msg):
        with open(self.csv_path + msg.metadata.simulation_hash + "_" + msg.metadata.date + ".csv", 'wb') as csvfile:
            fieldnames_global_segments_results = ['segment_index', 'n_failures', \
                        'time_mean', 'time_stdev', \
                        'time_max', 'time_min', \
                        'distance_mean', 'distance_stdev', \
                        'distance_max', 'distance_min', \
                        'speed_mean', 'speed_stdev', \
                        'speed_max', 'speed_min']
            fieldnames_global_simulation_results = ['n_failures', \
                        'time_mean', 'time_stdev', \
                        'time_max', 'time_min', \
                        'distance_mean', 'distance_stdev', \
                        'distance_max', 'distance_min', \
                        'speed_mean', 'speed_stdev', \
                        'speed_max', 'speed_min']
            fieldnames_segments_metadata = ['segment_index', 'initial_point', \
                        'end_point', 'distance_between_obstacles', \
                        'segment_simulation_timeout']
            fieldnames_simulation_metadata = ['simulation_hash', 'robot_file', \
                        'world_file', 'plan_file', \
                        'map_file', 'date', \
                        'n_segments', 'n_iterations', \
                        'timeout_factor', 'useful_simulation', \
                        'local_planner', 'global_planner']
            # Simulation metadata
            writer = csv.DictWriter(csvfile, fieldnames=['Simulation metadata'], delimiter=';', quotechar='"')
            writer.writeheader()
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames_simulation_metadata, delimiter=';', quotechar='"')
            writer.writeheader()
            writer.writerow({'simulation_hash':msg.metadata.simulation_hash, 'robot_file':msg.metadata.robot_file, \
                        'world_file':msg.metadata.world_file, 'plan_file':msg.metadata.plan_file, 'map_file':msg.metadata.map_file, \
                        'date':msg.metadata.date, 'n_segments':msg.metadata.n_segments, \
                        'n_iterations':msg.metadata.n_iterations, 'timeout_factor':msg.metadata.timeout_factor, \
                        'useful_simulation':msg.metadata.useful_simulation, 'useful_simulation':msg.metadata.useful_simulation, \
                        'local_planner':msg.metadata.local_planner, 'global_planner':msg.metadata.global_planner})
            # Segments metadata
            writer = csv.DictWriter(csvfile, fieldnames=['Segments metadata'], delimiter=';', quotechar='"')
            writer.writeheader()
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames_segments_metadata, delimiter=';', quotechar='"')
            writer.writeheader()
            for i in msg.metadata.segments_metadata.segments_metadata:
                writer.writerow({'segment_index':i.segment_index, 'initial_point':i.initial_point, \
                            'end_point':i.end_point, 'distance_between_obstacles':i.distance_between_obstacles, \
                            'segment_simulation_timeout':i.segment_simulation_timeout})
            # Global Simulation Results
            writer = csv.DictWriter(csvfile, fieldnames=['Global simulation results'], delimiter=';', quotechar='"')
            writer.writeheader()
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames_global_simulation_results, delimiter=';', quotechar='"')
            writer.writeheader()
            writer.writerow({'n_failures':msg.global_simulation_results.n_failures, \
                        'time_mean':msg.global_simulation_results.time_mean, 'time_stdev':msg.global_simulation_results.time_stdev, \
                        'time_max':msg.global_simulation_results.time_max, 'time_min':msg.global_simulation_results.time_min, \
                        'distance_mean':msg.global_simulation_results.distance_mean, 'distance_stdev':msg.global_simulation_results.distance_stdev, \
                        'distance_max':msg.global_simulation_results.distance_max, 'distance_min':msg.global_simulation_results.distance_min, \
                        'speed_mean':msg.global_simulation_results.speed_mean, 'speed_stdev':msg.global_simulation_results.speed_stdev, \
                        'speed_max':msg.global_simulation_results.speed_max, 'speed_min':msg.global_simulation_results.speed_min})
            # Global Segments Results
            writer = csv.DictWriter(csvfile, fieldnames=['Global segments results'], delimiter=';', quotechar='"')
            writer.writeheader()
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames_global_segments_results, delimiter=';', quotechar='"')
            writer.writeheader()
            for i in msg.global_segments_results:
                writer.writerow({'segment_index':i.segment_index, 'n_failures':i.n_failures, \
                            'time_mean':i.time_mean, 'time_stdev':i.time_stdev, \
                            'time_max':i.time_max, 'time_min':i.time_min, \
                            'distance_mean':i.distance_mean, 'distance_stdev':i.distance_stdev, \
                            'distance_max':i.distance_max, 'distance_min':i.distance_min, \
                            'speed_mean':i.speed_mean, 'speed_stdev':i.speed_stdev, \
                            'speed_max':i.speed_max, 'speed_min':i.speed_min})
        tkMessageBox.showinfo('Results', "A CSV file has been generated behind the path "+self.csv_path + msg.metadata.simulation_hash + "_" + msg.metadata.date + ".csv")

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
            time.sleep(3)
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
        self.msg_to_csv(msg)
        self.db_client.insert_simulation_results(msg)
