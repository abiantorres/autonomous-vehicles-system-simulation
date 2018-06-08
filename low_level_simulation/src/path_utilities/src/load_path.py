#!/usr/bin/env python

import threading
import rospy
import actionlib
from actionlib_msgs.msg import *
import roslib
import numpy as np
import os
from math import pow, sqrt, ceil
from datetime import datetime
import time
from random import randint
from statistics import stdev

# Path information messages
from costum_msgs.msg import RouteTimes, GoalInfo, PathInfo, SimulationMsg

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal, MoveBaseActionFeedback
from geometry_msgs.msg import PoseWithCovarianceStamped, PoseArray, Pose, Quaternion, Point
from std_msgs.msg import Empty
from std_srvs.srv import Empty
from gazebo_msgs.srv import SetModelState, SpawnModel, GetWorldProperties, GetModelState
from gazebo_msgs.msg import ModelState
from nav_msgs.msg import Odometry, MapMetaData, OccupancyGrid
import rosbag
import rospkg,tf

from obstacles_util import ObstaclesModelGenerator
from results_util import SimulationResults

# Initilize a rospack client
rospack = rospkg.RosPack()
gazebo_simulation_pkg_path = str(rospack.get_path('gazebo_simulation'))

# Path planning goals
waypoints = []

# Initial vehicle model state
initial_state = ModelState()

# Simulation parameters

# Wait time between simualtions to to apply relocation (in seconds)
time_to_relocation = 5
# Timeout for each simulation (in seconds)
# Default: 2 minutes and 30 seconds
simulation_timeout = 150

# Number of simulations
simulations = 1

# Path planning input file
file_name = ""

# Map metadata variables:

points_2d = []


def reset_gazebo_world():
    rospy.wait_for_service('/gazebo/reset_world')
    reset_world = rospy.ServiceProxy('/gazebo/reset_world', Empty)
    try:
      res = reset_world()
    except rospy.ServiceException as exc:
      rospy.loginfo("Service did not process request: " + str(exc))

def clear_gazebo_world():
    rospy.wait_for_service('/gazebo/clear_world')
    clear_world = rospy.ServiceProxy('/gazebo/clear_world', Empty)
    try:
      res = clear_world()
    except rospy.ServiceException as exc:
      rospy.loginfo("Service did not process request: " + str(exc))

def clear_costmaps():
    rospy.wait_for_service('/move_base/clear_costmaps')
    clear_costmaps = rospy.ServiceProxy('/move_base/clear_costmaps', Empty)
    try:
      res = clear_costmaps()
    except rospy.ServiceException as exc:
      rospy.loginfo("Service did not process request: " + str(exc))

def set_vehicle_model_state():
    global initial_state, odom_pub
    rospy.wait_for_service('gazebo/set_model_state')
    set_model_state = rospy.ServiceProxy('gazebo/set_model_state', SetModelState)
    try:
        res = set_model_state(initial_state)
    except rospy.ServiceException as exc:
        rospy.loginfo("Service did not process request: " + str(exc))

def get_all_world_models():
    rospy.wait_for_service("gazebo/get_world_properties")
    world_properties = rospy.ServiceProxy("gazebo/get_world_properties", GetWorldProperties)
    return world_properties().model_names

def get_model_position(model):
    rospy.wait_for_service("gazebo/get_model_state")
    model_state = rospy.ServiceProxy("gazebo/get_model_state", GetModelState)
    return model_state(model, "").pose.position

def get_model_state(model):
    rospy.wait_for_service("gazebo/get_model_state")
    model_state = rospy.ServiceProxy("gazebo/get_model_state", GetModelState)
    return model_state(model, "")

def get_world_occupied_positions():
    positions = []
    world_models = get_all_world_models()
    for model in world_models:
        positions.append(get_model_position(model))
    return positions

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
    global waypoints, file_name, initial_state, points_2d
    waypoints = []
    file_name = rospy.get_param('~input_file')
    bag = rosbag.Bag(file_name)
    points_2d = []

    for topic, msg, t in bag.read_messages(topics=['initial_model_state']):
        initial_state = msg
        points_2d.append((round(float(msg.pose.position.x),2), round(float(msg.pose.position.y),2)))

    for topic, msg, t in bag.read_messages(topics=['path_goals_bag']):
        waypoints.append(msg)
        points_2d.append((round(float(msg.pose.pose.position.x), 2), round(float(msg.pose.pose.position.y),2)))

    bag.close()

def run(n_simulations, density):
    """ Low level information publisher. High level should be
    subscribed to the path_plan_info topic.
    """
    global waypoints, points_2d

    # configure needed topics and move_base client
    simulation_data_pub = rospy.Publisher('/simulation_data', SimulationMsg, queue_size=1)
    poseArray_publisher = rospy.Publisher('/waypoints', PoseArray, queue_size=1)
    frame_id = rospy.get_param('~goal_frame_id','map')
    # Get a move_base action client
    client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
    rospy.loginfo('Connecting to move_base...')
    client.wait_for_server()
    rospy.loginfo('Connected to move_base.')

    # read path plan from file
    read_route_configuration_from_file()

    # Build an obstacles model generator
    obstacles_model_generator = ObstaclesModelGenerator("my simulation", 0.1, 0.5, \
        points_2d[0][0], points_2d[0][1], density, 0.1)

    i = 0
    for point in points_2d:
        if(i != 0):
            obstacles_model_generator.append_point(str(i), point[0], point[1])
        i += 1

    obstacles_model_generator.spawn_obstacles()
    simulator = SimulationResults(len(waypoints), n_simulations)
    for i in range(0, len(waypoints)):
        if(i != 0):
            simulator.set_segment_metadata(i, points_2d[i - 1][0], points_2d[i - 1][1], \
                points_2d[i][0], points_2d[i][1], density, \
                obstacles_model_generator.segments[i].get_segment_timeout(1, 12))
        else:
            simulator.set_segment_metadata(i, points_2d[0][0], points_2d[0][1], \
                points_2d[1][0], points_2d[1][1], density, \
                obstacles_model_generator.segments[i].get_segment_timeout(1, 12))

    rospy.loginfo(simulator.get_segments_metadata_msg())
    # Run the n simulations
    for x in range(0, n_simulations):
        # Print in Rviz the visual end point icons
        poseArray_publisher.publish(convert_PoseWithCovArray_to_PoseArray(waypoints))
        # Execute waypoints each in seqsuence
        rospy.loginfo("waypoints: " + str(waypoints))
        i = 0 # variable to index the results times

        # Send to path planner each of the move base goals
        for waypoint in waypoints:

            segment_simulation_timeout = obstacles_model_generator.segments[i].get_segment_timeout(1, 12)
            rospy.loginfo(segment_simulation_timeout)

            # Build goal
            goal = MoveBaseGoal()
            goal.target_pose.header.frame_id = frame_id
            goal.target_pose.header.stamp = rospy.Time.now()
            goal.target_pose.pose.position = waypoint.pose.pose.position
            goal.target_pose.pose.orientation = waypoint.pose.pose.orientation
            rospy.loginfo('Executing move_base goal to position (x,y): %s, %s' %
                (waypoint.pose.pose.position.x, waypoint.pose.pose.position.y))
            rospy.loginfo("To cancel the goal: 'rostopic pub -1 /move_base/cancel actionlib_msgs/GoalID -- {}'")

            simulator.start(i, x)#, points_2d[i][0], points_2d[i][1],\
                #points_2d[i + 1][0], points_2d[i + 1][1])
            # Send goal to path planner

            client.send_goal(goal)
            # Keep waiting for results
            finished_within_time = client.wait_for_result(rospy.Duration(segment_simulation_timeout))

            # Check for success or failure
            if not finished_within_time:
                client.cancel_goal()
                rospy.loginfo("Timed out achieving goal")
                # Increase the failures count for the current section
                simulator.stop(i, x, True)
                break
            else:
                state = client.get_state()
                if state == GoalStatus.SUCCEEDED:
                    rospy.loginfo("Goal succeeded!")
                    rospy.loginfo("State:" + str(state))
                    simulator.stop(i, x, False)
                else:
                    rospy.loginfo("Goal failed with error code: " + str(state))
                    # Increase the failures count for the current section
                    simulator.stop(i, x, True)
                    break
            i += 1

        # Reset gazebo word to avoid posible modifications in the last simulation
        reset_gazebo_world()

        #obstacles_model_generator.delete_obstacles()

        # Set the initial vehicle model state
        set_vehicle_model_state()

    simulation_data_pub.publish(simulator.get_msg("", 1))
    rospy.loginfo(simulator.get_msg("", 1))

if __name__ == '__main__':
    global file_name, simulations
    rospy.init_node('load_path')
    # get input file name
    file_name = rospy.get_param('~input_file')
    simulations = int(rospy.get_param('~simulations'))
    density = float(rospy.get_param('~density'))
    run(simulations, density)
