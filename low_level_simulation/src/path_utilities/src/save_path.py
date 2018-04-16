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

def write_route_configuration_from_file():
    """
    Function with allows us to save a pre-configured path from file and
    keep it to be used in the simulation.
    """
    global waypoints, file_name
    #goals = []
    #rospy.loginfo(waypoints)
    #for waypoint in waypoints:
        #goals.append([waypoint.pose.pose.position.x, waypoint.pose.pose.position.y, waypoint.pose.pose.position.z, waypoint.pose.pose.orientation.x, waypoint.pose.pose.orientation.y, waypoint.pose.pose.orientation.z])
    #np_goals = np.array(goals, np.float32)
    #np.savetxt(file_name, np_goals)

    bag = rosbag.Bag(file_name, 'w')
    try:
        for waypoint in waypoints:
            bag.write('path_goals_bag', waypoint)
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

    def execute(self, userdata):
        global waypoints, file_name
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
            #rospy.loginfo(pose)
            # publish waypoint queue as pose array so that you can see them in rviz, etc.
            self.poseArray_publisher.publish(convert_PoseWithCovArray_to_PoseArray(waypoints))
        # Path is ready! return success and move on to the next state (FOLLOW_PATH)
        return 'success'

class SavePath(State):
    def __init__(self):
        State.__init__(self, outcomes=['success'], input_keys=['waypoints'], output_keys=['waypoints'])
        self.poseArray_publisher = rospy.Publisher('/waypoints', PoseArray, queue_size=1)
    def execute(self, userdata):
        write_route_configuration_from_file()
        rospy.sleep(3)  # Wait 3 seconds because `rostopic echo` latches
                            # for three seconds and wait_for_message() in a
                            # loop will see it again.
        self.initialize_path_queue()
        rospy.loginfo('############################')
        rospy.loginfo('##### TRAYECTORY SAVED #####')
        rospy.loginfo('############################')

        return 'success'
    def initialize_path_queue(self):
        global waypoints
        waypoints = [] # the waypoint queue
        # publish empty waypoint queue as pose array so that you can see them the change in rviz, etc.
        self.poseArray_publisher.publish(convert_PoseWithCovArray_to_PoseArray(waypoints))

def main():
    global file_name, waypoints
    sm = StateMachine(outcomes=['success'])
    with sm:
        StateMachine.add('GET_PATH', GetPath(),
                           transitions={'success':'SAVE_PATH'},
                           remapping={'waypoints':'waypoints'})
        StateMachine.add('SAVE_PATH', SavePath(),
                           transitions={'success':'GET_PATH'},
                           remapping={'waypoints':'waypoints'})
    outcome = sm.execute()

if __name__ == '__main__':
    rospy.init_node('save_path')
    file_name = rospy.get_param('~output_file')
    main()