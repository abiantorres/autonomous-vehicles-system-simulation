#!/usr/bin/env python
import roslib
roslib.load_manifest('path_utilities')

import threading
import rospy
import rosbag
import actionlib
import numpy as np
import os

from smach import State,StateMachine
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import PoseWithCovarianceStamped, PoseArray, Pose
from std_msgs.msg import Empty
from nav_msgs.msg import Odometry

waypoints = []
file_name = ""

def write_route_configuration_from_file(file_name):
    """
    Function with allows us to save a pre-configured path from file and
    keep it to be used in the simulation.
    """
    global waypoints
    bag = rosbag.Bag(file_name, 'w')
    try:
        for waypoint in waypoints:
           bag.write('waypoints_file', waypoint) 
    finally:
        bag.close()

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
        global waypoints, file_name
        self.initialize_path_queue()
        self.path_ready = False
        # Start thread to listen for when the path is ready (this function will end then)
        def wait_for_path_ready():
            """thread worker function"""
            data = rospy.wait_for_message('/path_ready', Empty)
            rospy.loginfo('Recieved path READY message')
            self.path_ready = True
        ready_thread = threading.Thread(target=wait_for_path_ready)
        ready_thread.start()

        topic = "/initialpose"
        rospy.loginfo("Waiting to recieve waypoints via Pose msg on topic %s" % topic)
        rospy.loginfo("To start following waypoints: 'rostopic pub /path_ready std_msgs/Empty -1'")
        # Wait for published waypoints
        while not self.path_ready:
            try:
                pose = rospy.wait_for_message(topic, PoseWithCovarianceStamped, timeout=1)
                pass
            except rospy.ROSException as e:
                if 'timeout exceeded' in e.message:
                    continue  # no new waypoint within timeout, looping...
                else:
                    raise e
            rospy.loginfo("Recieved new waypoint")
            waypoints.append(pose)
            rospy.loginfo(pose)
            # publish waypoint queue as pose array so that you can see them in rviz, etc.
            self.poseArray_publisher.publish(convert_PoseWithCovArray_to_PoseArray(waypoints))
        # Path is ready! return success and move on to the next state (FOLLOW_PATH)
        rospy.loginfo(waypoints)
        write_route_configuration_from_file(file_name)
        return 'success'

class SavePath(State):

    def __init__(self):
        State.__init__(self, outcomes=['success'])

    def execute(self, userdata):
        rospy.loginfo('############################')
        rospy.loginfo('##### TRAYECTORY SAVED #####')
        rospy.loginfo('############################')
        return 'success'

def main():
    global file_name
    rospy.init_node('save_path')
    file_name = rospy.get_param('~output_file')
    sm = StateMachine(outcomes=['success'])
    with sm:
        StateMachine.add('GET_PATH', GetPath(),
                           transitions={'success':'SAVE_PATH'},
                           remapping={'waypoints':'waypoints'})
        StateMachine.add('SAVE_PATH', SavePath(),
                           transitions={'success':'GET_PATH'})
    outcome = sm.execute()

if __name__ == '__main__':
    main()