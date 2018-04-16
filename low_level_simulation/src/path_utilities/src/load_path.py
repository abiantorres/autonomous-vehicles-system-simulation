#!/usr/bin/env python

import threading
import rospy
import actionlib
import numpy as np
import os

# Path information messages
from costum_msgs.msg import RouteTimes

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import PoseWithCovarianceStamped, PoseArray, Pose
from std_msgs.msg import Empty
from nav_msgs.msg import Odometry
import rosbag

waypoints = []
results = []

def convert_PoseWithCovArray_to_PoseArray(waypoints):
    """Used to publish waypoints as pose array so that you can see them in rviz, etc."""
    poses = PoseArray()
    poses.header.frame_id = 'map'
    poses.poses = [pose.pose.pose for pose in waypoints]
    return poses

def read_route_configuration_from_file():
    """
    Function with allows us to get a path pre-configured from file and
    load it to be used in the simulation.
    """
    global waypoints
    waypoints = []
    file_name = rospy.get_param('~input_file')
    bag = rosbag.Bag(file_name)
    for topic, msg, t in bag.read_messages(topics=['waypoints_file']):
        rospy.loginfo("WAYPOINT   " + str(msg))
        waypoints.append(msg)
    bag.close()

def run():
    """ Low level information publisher. High level should be
    subscribed to this topic.
    """
    global waypoints, results
    path_plan_info_pub = rospy.Publisher('/path_plan_info', RouteTimes, queue_size=1)
    poseArray_publisher = rospy.Publisher('/waypoints', PoseArray, queue_size=1)
    frame_id = rospy.get_param('~goal_frame_id','map')
    # Get a move_base action client
    client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
    rospy.loginfo('Connecting to move_base...')
    client.wait_for_server()
    rospy.loginfo('Connected to move_base.')
    read_route_configuration_from_file()
    poseArray_publisher.publish(convert_PoseWithCovArray_to_PoseArray(waypoints))
    results = [] # make sure we have an empty array of times
    # Execute waypoints each in seqsuence
    for waypoint in waypoints:
        # Break if preempted
        if waypoints == []:
            rospy.loginfo('The waypoint queue has been reset.')
            break
        # Otherwise publish next waypoint as goal
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = frame_id
        goal.target_pose.pose.position = waypoint.pose.pose.position
        goal.target_pose.pose.orientation = waypoint.pose.pose.orientation
        rospy.loginfo('Executing move_base goal to position (x,y): %s, %s' %
            (waypoint.pose.pose.position.x, waypoint.pose.pose.position.y))
        rospy.loginfo("To cancel the goal: 'rostopic pub -1 /move_base/cancel actionlib_msgs/GoalID -- {}'")
        client.send_goal(goal)
        # set start time for the current goal
        start_time = rospy.get_time()
        client.wait_for_result()
        results.append(rospy.get_time() - start_time)

    rospy.loginfo('###############################')
    rospy.loginfo('##### REACHED FINISH GATE #####')
    rospy.loginfo('###############################')
    route_times = RouteTimes()
    route_times.times = results
    rospy.loginfo(route_times)
    path_plan_info_pub.publish(route_times)

if __name__ == '__main__':
    rospy.init_node('load_path')
    run()

