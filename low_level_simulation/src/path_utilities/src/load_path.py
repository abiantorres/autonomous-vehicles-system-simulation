#!/usr/bin/env python

import threading
import rospy
import actionlib
from actionlib_msgs.msg import *
import roslib
import numpy as np
import os
from math import pow, sqrt

# Path information messages
from costum_msgs.msg import RouteTimes

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal, MoveBaseActionFeedback
from geometry_msgs.msg import PoseWithCovarianceStamped, PoseArray, Pose
from std_msgs.msg import Empty
from std_srvs.srv import Empty
from gazebo_msgs.srv import SetModelState
from gazebo_msgs.msg import ModelState
from nav_msgs.msg import Odometry
import rosbag

# Path planning goals
waypoints = []
# Statistics per path section (Each array position corresponds to a section)
time_average_by_section = []
failures_by_section = []
distance_travelled_by_section = []
# Initial vehicle model state
initial_state = ModelState()
# Path planning input file 
file_name = ""


# Auxiliar variables to compute the traveled distance
current_traveled_distance = 0.0
# Last vehicle position (x, y)
last_x_position = 0.0
last_y_position = 0.0
compute_distance = False

# Compute the euclidean distance
def callback(data):
    global last_x_position, last_y_position, current_traveled_distance, compute_distance
    if(compute_distance):
        current_traveled_distance += sqrt(pow(data.feedback.base_position.pose.position.x - last_x_position, 2) + pow(data.feedback.base_position.pose.position.y - last_y_position, 2))
    last_x_position = data.feedback.base_position.pose.position.x
    last_y_position = data.feedback.base_position.pose.position.y
    
rospy.Subscriber("move_base/feedback", MoveBaseActionFeedback, callback)

def reset_gazebo_world():
    rospy.wait_for_service('gazebo/reset_world')
    reset_world = rospy.ServiceProxy('gazebo/reset_world', Empty)
    try:
      res = reset_world()
    except rospy.ServiceException as exc:
      rospy.loginfo("Service did not process request: " + str(exc))

def set_vehicle_model_state():
    global initial_state
    rospy.wait_for_service('gazebo/set_model_state')
    set_model_state = rospy.ServiceProxy('gazebo/set_model_state', SetModelState)
    try:
      res = set_model_state(initial_state)
    except rospy.ServiceException as exc:
      rospy.loginfo("Service did not process request: " + str(exc))

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
    global waypoints, file_name, initial_state
    waypoints = []
    file_name = rospy.get_param('~input_file')
    bag = rosbag.Bag(file_name)

    for topic, msg, t in bag.read_messages(topics=['path_goals_bag']):
        waypoints.append(msg)

    for topic, msg, t in bag.read_messages(topics=['initial_model_state']):
        initial_state = msg

    bag.close()

def run(n_simulations):
    """ Low level information publisher. High level should be
    subscribed to the path_plan_info topic.
    """
    global waypoints, time_average_by_section, failures_by_section, distance_travelled_by_section,last_x_position, last_y_position, current_traveled_distance, compute_distance
    
    # configure needed topics and move_base client
    path_plan_info_pub = rospy.Publisher('/path_plan_info', RouteTimes, queue_size=1)
    poseArray_publisher = rospy.Publisher('/waypoints', PoseArray, queue_size=1)
    frame_id = rospy.get_param('~goal_frame_id','map')
    # Get a move_base action client
    client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
    rospy.loginfo('Connecting to move_base...')
    client.wait_for_server()
    rospy.loginfo('Connected to move_base.')

    # read path plan from file
    read_route_configuration_from_file()

    # Make sure we have an empty array of average times.
    # The lenght of the array is equal to the number of end points (path sections)
    time_average_by_section = [0] * len(waypoints) 
    # Make sure we have an empty array of aborts.
    # The lenght of the array is equal to the number of end points (path sections)
    failures_by_section = [0] * len(waypoints)
    # Make sure we have an empty array of distances.
    # The lenght of the array is equal to the number of end points (path sections)
    distance_travelled_by_section = [0] * len(waypoints)
    
    # Run the n simulations
    for x in range(0, n_simulations):
        # Re-set the initial robot pose
        #reset_gazebo_world()
        # Set the initial vehicle model state
        set_vehicle_model_state()
        # Print in Rviz the visual end point icons
        poseArray_publisher.publish(convert_PoseWithCovArray_to_PoseArray(waypoints))
        # Execute waypoints each in seqsuence
        rospy.loginfo("waypoints: " + str(waypoints))
        i = 0 # variable to index the results times


        # Send to path planner each of the move base goals
        for waypoint in waypoints:
            
            # Build goal
            goal = MoveBaseGoal()
            goal.target_pose.header.frame_id = frame_id
            goal.target_pose.header.stamp = rospy.Time.now()
            goal.target_pose.pose.position = waypoint.pose.pose.position
            goal.target_pose.pose.orientation = waypoint.pose.pose.orientation
            rospy.loginfo('Executing move_base goal to position (x,y): %s, %s' %
                (waypoint.pose.pose.position.x, waypoint.pose.pose.position.y))
            rospy.loginfo("To cancel the goal: 'rostopic pub -1 /move_base/cancel actionlib_msgs/GoalID -- {}'")
            

            current_traveled_distance = 0.0
            compute_distance = True

            # Send goal to path planner
            client.send_goal(goal)

            # Set the start time for the current plan
            start_time = rospy.get_time()

            # Keep waiting for results 2 minutes and 30 seconds
            finished_within_time = client.wait_for_result(rospy.Duration(150)) # Wait only
            compute_distance = False
            # Check for success or failure
            if not finished_within_time:
                client.cancel_goal()
                rospy.loginfo("Timed out achieving goal")
                # Increase the failures count for the current section
                failures_by_section[i] += 1
            else:
                state = client.get_state()
                if state == GoalStatus.SUCCEEDED:
                    rospy.loginfo("Goal succeeded!")
                    rospy.loginfo("State:" + str(state))
                    # Computes travel time for last plan
                    time_average_by_section[i] += (rospy.get_time() - start_time)
                else:
                    rospy.loginfo("Goal failed with error code: " + str(state))
                    # Increase the failures count for the current section
                    failures_by_section[i] += 1
            rospy.loginfo("DISTANCE " + str(current_traveled_distance))
            i += 1 

        rospy.loginfo("###### Simulation " + str(x+1) + " finished ######")

    # Compute average times for each section
    for i in range(0, len(waypoints)):
        time_average_by_section[i] /= n_simulations
    #route_times = RouteTimes()
    #route_times.times = results
    #rospy.loginfo(route_times)
    #path_plan_info_pub.publish(route_times)

if __name__ == '__main__':
    global file_name
    rospy.init_node('load_path')
    # get input file name
    file_name = rospy.get_param('~input_file')
    run(2)