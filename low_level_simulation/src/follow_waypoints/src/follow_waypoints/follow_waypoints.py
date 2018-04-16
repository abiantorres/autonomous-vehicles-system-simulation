#!/usr/bin/env python

import threading
import rospy
import actionlib
import numpy as np
import os

# Path information messages
#from costum_msgs.msg import PathInfo, GoalInfo
from costum_msgs.msg import RouteTimes

from smach import State,StateMachine
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import PoseWithCovarianceStamped, PoseArray, Pose
from std_msgs.msg import Empty
from nav_msgs.msg import Odometry
import rosbag

waypoints = []
results = []
initial_vehicle_pose = Odometry()

##############
#Get Odometry#
##############

def callback(msg):
    """ 
    Funtions to get the initial vehicle pose and keep it in the
    global variable "initial_vehicle_pose", so it could be
    used later, when we want to save it in a file vehicle initial pose.
    """
    global initial_vehicle_pose
    initial_vehicle_pose = msg

# Get subscribe to the odometry topic
odom_sub = rospy.Subscriber('/odom', Odometry, callback)
odom_pub = rospy.Publisher("/odom", Odometry, queue_size=50)

#####################################
#Load and write path goals from file#
#####################################

def write_route_configuration_from_file(file_name):
    """
    Function with allows us to save a pre-configured path from file and
    keep it to be used in the simulation.
    """
    global waypoints, initial_vehicle_pose
    bag = rosbag.Bag(file_name, 'w')
    try:
        bag.write('initial_pose_file', initial_vehicle_pose) 
        for waypoint in waypoints:
           bag.write('waypoints_file', waypoint) 
    finally:
        bag.close()


def read_route_configuration_from_file(file_name):
    """
    Function with allows us to get a path pre-configured from file and
    load it to be used in the simulation.
    """
    global waypoints
    waypoints = []
    bag = rosbag.Bag(file_name)
    for topic, msg, t in bag.read_messages(topics=['initial_pose_file']):
        rospy.loginfo("INITIAL   " + str(msg))
        odom_pub.publish(msg)
    for topic, msg, t in bag.read_messages(topics=['waypoints_file']):
        rospy.loginfo("WAYPOINT   " + str(msg))
        waypoints.append(msg)
    bag.close()

################
#States Machine#
################

class FollowPath(State):
    def __init__(self):
        State.__init__(self, outcomes=['success'], input_keys=['waypoints'])
        self.frame_id = rospy.get_param('~goal_frame_id','map')
        # Get a move_base action client
        self.client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
        rospy.loginfo('Connecting to move_base...')
        self.client.wait_for_server()
        rospy.loginfo('Connected to move_base.')

    def execute(self, userdata):
        global waypoints, results
        results = [] # make sure we have an empty array of times
        # Execute waypoints each in sequence
        for waypoint in waypoints:
            # Break if preempted
            if waypoints == []:
                rospy.loginfo('The waypoint queue has been reset.')
                break
            # Otherwise publish next waypoint as goal
            goal = MoveBaseGoal()
            goal.target_pose.header.frame_id = self.frame_id
            goal.target_pose.pose.position = waypoint.pose.pose.position
            goal.target_pose.pose.orientation = waypoint.pose.pose.orientation
            rospy.loginfo('Executing move_base goal to position (x,y): %s, %s' %
                    (waypoint.pose.pose.position.x, waypoint.pose.pose.position.y))
            rospy.loginfo("To cancel the goal: 'rostopic pub -1 /move_base/cancel actionlib_msgs/GoalID -- {}'")
            self.client.send_goal(goal)
            # set start time for the current goal
            start_time = rospy.get_time()
            self.client.wait_for_result()
            results.append(rospy.get_time() - start_time)
        return 'success'

def convert_PoseWithCovArray_to_PoseArray(waypoints):
    """Used to publish waypoints as pose array so that you can see them in rviz, etc."""
    poses = PoseArray()
    poses.header.frame_id = 'map'
    poses.poses = [pose.pose.pose for pose in waypoints]
    return poses

class GetPath(State):
    def __init__(self):
        State.__init__(self, outcomes=['success'], input_keys=['waypoints'], output_keys=['waypoints'])
        # Create publsher to publish waypoints as pose array so that you can see them in rviz, etc.
        self.poseArray_publisher = rospy.Publisher('/waypoints', PoseArray, queue_size=1)
        # Start thread to listen for reset messages to clear the waypoint queue
        def wait_for_path_reset():
            """thread worker function"""
            global waypoints
            while not rospy.is_shutdown():
                data = rospy.wait_for_message('/path_reset', Empty)
                rospy.loginfo('Recieved path RESET message')
                self.initialize_path_queue()
                rospy.sleep(3) # Wait 3 seconds because `rostopic echo` latches
                               # for three seconds and wait_for_message() in a
                               # loop will see it again.
        reset_thread = threading.Thread(target=wait_for_path_reset)
        reset_thread.start()

    def initialize_path_queue(self):
        global waypoints
        waypoints = [] # the waypoint queue
        # publish empty waypoint queue as pose array so that you can see them the change in rviz, etc.
        self.poseArray_publisher.publish(convert_PoseWithCovArray_to_PoseArray(waypoints))

    def execute(self, userdata):
        global waypoints
        self.initialize_path_queue()
        self.path_ready = False
        #load_route_configuration_from_file('~/.ros/path01.path')
        # Start thread to listen for when the path is ready (this function will end then)
        def wait_for_path_ready():
            """thread worker function"""
            data = rospy.wait_for_message('/path_ready', Empty)
            rospy.loginfo('Recieved path READY message')
            self.path_ready = True
        ready_thread = threading.Thread(target=wait_for_path_ready)
        ready_thread.start()

        """
        topic = "/initialpose"
        rospy.loginfo("Waiting to recieve waypoints via Pose msg on topic %s" % topic)
        rospy.loginfo("To start following waypoints: 'rostopic pub /path_ready std_msgs/Empty -1'")
        """
        read_route_configuration_from_file("test.bag")
        # Wait for published waypoints
        while not self.path_ready:
            try:
                #pose = rospy.wait_for_message(topic, PoseWithCovarianceStamped, timeout=1)
                pass
            except rospy.ROSException as e:
                if 'timeout exceeded' in e.message:
                    continue  # no new waypoint within timeout, looping...
                else:
                    raise e
            #rospy.loginfo("Recieved new waypoint")
            #waypoints.append(pose)
            #rospy.loginfo(pose)
            # publish waypoint queue as pose array so that you can see them in rviz, etc.
            self.poseArray_publisher.publish(convert_PoseWithCovArray_to_PoseArray(waypoints))
        # Path is ready! return success and move on to the next state (FOLLOW_PATH)
        rospy.loginfo(waypoints)

        #write_route_configuration_from_file("test.bag")"""
        return 'success'

class PathComplete(State):
    def __init__(self):
        State.__init__(self, outcomes=['success'])
        """ Low level information publisher. High level should be
        subscribed to this topic.
        """
        #self.path_plan_info_pub = rospy.Publisher('/path_plan_info', PathInfo)
        self.path_plan_info_pub = rospy.Publisher('/path_plan_info', RouteTimes)

    def execute(self, userdata):
        global results
        rospy.loginfo('###############################')
        rospy.loginfo('##### REACHED FINISH GATE #####')
        rospy.loginfo('###############################')
        # path_plan_info = PathInfo()
        route_times = RouteTimes()
        # path_plan_info.data = results
        route_times.times = results
        rospy.loginfo(route_times)
        self.path_plan_info_pub.publish(route_times)
        return 'success'

def main():
    rospy.init_node('follow_waypoints')

    sm = StateMachine(outcomes=['success'])

    with sm:
        StateMachine.add('GET_PATH', GetPath(),
                           transitions={'success':'FOLLOW_PATH'},
                           remapping={'waypoints':'waypoints'})
        StateMachine.add('FOLLOW_PATH', FollowPath(),
                           transitions={'success':'PATH_COMPLETE'},
                           remapping={'waypoints':'waypoints'})
        StateMachine.add('PATH_COMPLETE', PathComplete(),
                           transitions={'success':'GET_PATH'})

    outcome = sm.execute()
