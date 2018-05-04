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

# Path information messages
from costum_msgs.msg import RouteTimes, GoalInfo, PathInfo

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal, MoveBaseActionFeedback
from geometry_msgs.msg import PoseWithCovarianceStamped, PoseArray, Pose, Quaternion, Point
from std_msgs.msg import Empty
from std_srvs.srv import Empty
from gazebo_msgs.srv import SetModelState, SpawnModel, GetWorldProperties, GetModelState
from gazebo_msgs.msg import ModelState
from nav_msgs.msg import Odometry, MapMetaData, OccupancyGrid
import rosbag
import rospkg,tf

# Initilize a rospack client
rospack = rospkg.RosPack()
gazebo_simulation_pkg_path = str(rospack.get_path('gazebo_simulation'))

# Path planning goals
waypoints = []

# Local statistics by path section (Each array position corresponds to a section)
time_average_by_section = [] # time by section
failures_by_section = [] # failures by section
traveled_distance_average_by_section = [] # distance traveled by section
velocity_average_by_section = [] # velocity by section
linear_velocity_average_by_section = [] # linear velocity average by section
maximum_linear_velocity_by_section = [] # maximun linear velocity by section

# Global statistics
global_time_average = 0.0
global_failures = 0.0
global_traveled_distance_average = 0.0
global_velocity_average = 0.0 # Counting stops (distance / time)
global_linear_velocity_average = 0.0

# Auxiliar variables to compute the traveled distance and velocity
current_traveled_distance = 0.0
current_linear_velocity_average = 0.0

# Last vehicle position (x, y) and velocities
last_x_position = 0.0
last_y_position = 0.0

last_linear_velocity = 0.0

# current maximun velocity (temporal for each section)
max_linear_velocity = -1.0


# Boolean variables to avoid unnecessary calculations
compute_distance = False
compute_linear_velocity = False

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

map_metadata = {}
# Avoid unnecessaries operations in map metadata callback
get_map_metadata = False  

occupancy_grid = OccupancyGrid()
# Avoid unnecessaries operations in occupancy grid callback
get_occupancy_grid = True

odom_pub = rospy.Publisher("odom", Odometry, queue_size=50)

points_2d = []

# Compute the euclidean distance
def callback_move_base(data):
    global last_x_position, last_y_position, current_traveled_distance, compute_distance
    if(compute_distance):
        current_traveled_distance += sqrt(pow(data.feedback.base_position.pose.position.x - last_x_position, 2) + pow(data.feedback.base_position.pose.position.y - last_y_position, 2))
    last_x_position = data.feedback.base_position.pose.position.x
    last_y_position = data.feedback.base_position.pose.position.y
    
rospy.Subscriber("move_base/feedback", MoveBaseActionFeedback, callback_move_base)


def callback_odom(msg):
    global current_linear_velocity_average, last_linear_velocity, max_linear_velocity, compute_linear_velocity
    if(compute_linear_velocity): # avoid unnecessary calculations
        current_linear_velocity = sqrt(pow(msg.twist.twist.linear.x, 2) + pow(msg.twist.twist.linear.y, 2) + pow(msg.twist.twist.linear.z, 2))
        if(current_linear_velocity > 0.00001): # If the robot is not stopped
            # Update the linear velocity average
            current_linear_velocity_average = (current_linear_velocity + last_linear_velocity) / 2
            # Update the maximun linear velocity value
            if(max_linear_velocity < current_linear_velocity):
                max_linear_velocity = current_linear_velocity
            # Current linear velocity is now the last linear velocity
            last_linear_velocity = current_linear_velocity_average
  
rospy.Subscriber('odom', Odometry, callback_odom)

def callback_map_metadata(msg):
    global map_metadata, get_map_metadata
    if(get_map_metadata):
        map_metadata = {"resolution": msg.resolution, "width": msg.width, "height": msg.height, "origin": msg.origin}

rospy.Subscriber('map_metadata', MapMetaData, callback_map_metadata)


"""

class Point2d:
    # Point class represents and manipulates x,y coords. 
    def __init__(self, x = 0, y = 0):
        # Create a new point at the origin 
        self.x = x
        self.y = y
        if(x != 0 or y != 0):
            self.ceil_point()
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y  
    def ceil_point(self):
        self.x = int(ceil(self.x))
        self.y = int(ceil(self.y))

# Occupancy grid variables

occupancy_grid = OccupancyGrid()
occupancy_grid_flag = True

def callback_occupancy_grid(msg):
    # This represents a 2-D grid map, in which each cell represents the probability of
    # occupancy.
    # Header header 
    # MetaData for the map
    # MapMetaData info
    # The map data, in row-major order, starting with (0,0).  Occupancy
    # probabilities are in the range [0,100].  Unknown is -1.
    # int8[] data
    
    global occupancy_grid, occupancy_grid_flag
    if(occupancy_grid_flag):
        occupancy_grid = msg

rospy.Subscriber('map', OccupancyGrid, callback_occupancy_grid)

def polygon_centroid(points):
    centroid = Point2d()
    n_points = len(points)
    point = Point2d()
    for i in range(0, n_points):
        point = points[i]
        centroid.x += point.x
        centroid.y += point.y
    centroid.x /= n_points
    centroid.y /= n_points
    centroid.ceil_point()
    return centroid

def max_distance(points, centroid):
    n_points = len(points)
    distances = [0]*n_points
    for i in range(0, n_points):
        distances[i] = int(ceil(sqrt(pow(points[i].x - centroid.x, 2) + pow(points[i].y - centroid.y, 2))))
    return max(distances)

def get_interest_zone_points(centroid, radius):
    points = []
    for x in range(centroid.x - radius, centroid.x):
        for y in range(centroid.y - radius, centroid.y):
        # we don't have to take the square root, it's slow
            if (pow(x - centroid.x, 2) + pow(y - centroid.y, 2) <= pow(radius, 2)): 
            # (x, y), (x, y_sym), (x_sym , y), (x_sym, y_sym) are in the circle
                x_sym = centroid.x - (x - centroid.x)
                y_sym = centroid.y - (y - centroid.y)
                points.append(Point2d(x, y))
                points.append(Point2d(x, y_sym))
                points.append(Point2d(x_sym, y))
                points.append(Point2d(x_sym, y_sym))
    return points

def get_row_major_order_index(i, j, height):
    return i*height + j

def get_obstacles_points(points, free_thresh = 0.196, density = 0.25):
    
    # number of obstacles = ceil(number of points * density)
    # density should be between [0, 1]
    
    # occupancy grid map
    global occupancy_grid, occupancy_grid_flag 
    occupancy_grid_flag = True
    # get the number of obstacles
    n_obstacles = int(ceil(len(points)*density))
    # get an integer value in the scale [0,100]
    free_thresh = int(ceil(free_thresh*100))
    # get map width and height 
    height = occupancy_grid.info.height
    width = occupancy_grid.info.width
    data = occupancy_grid.data
    # get polygon centroid formed by goal points
    centroid = polygon_centroid(points)

    # get all point in the interest point (circle formed by the polygon centroid and
    # the maximun distance of a goal point to the centroid)
    interest_zone_points = get_interest_zone_points(centroid, max_distance(points, centroid))

    # generate n random obstacles
    #interest_zone_points = list(filter(lambda point: data[get_row_major_order_index(point.x, point.y, height)] > 0 and data[get_row_major_order_index(point.x, point.y, height)] < free_thresh , interest_zone_points))

    obstacles_points = []
    for i in range(0, n_obstacles):
        index = randint(0, len(interest_zone_points))
        obstacles_points.append(interest_zone_points[index])
        #interest_zone_points = list(filter(lambda point: data[get_row_major_order_index(point.x, point.y, height)] > 0 and data[get_row_major_order_index(point.x, point.y, height)] < free_thresh , interest_zone_points))
    occupancy_grid_flag = False
    return obstacles_points

def spawn_gazebo_obstacles(points):
    rospy.wait_for_service("gazebo/spawn_sdf_model")
    spawn_model = rospy.ServiceProxy("gazebo/spawn_sdf_model", SpawnModel)
    with open(gazebo_simulation_pkg_path + "/worlds/obstacle01.sdf", "r") as f:
        obstacle_xml = f.read()
    orient = Quaternion(0, 0, 0, 0)
    for i in range(0, len(points)):
        item_pose = Pose(Point(x=points[i].x, y=points[i].y, z=0), orient)
        spawn_model("obstacle_" + str(i), obstacle_xml, "", item_pose, "world")

def generate_obstacles(points, free_thresh = 0.196, density = 0.25):
    spawn_gazebo_obstacles(get_obstacles_points(points, free_thresh, density))

def delete_obstacles():
    rospy.wait_for_service("gazebo/delete_model")
    delete_model = rospy.ServiceProxy("gazebo/delete_model", DeleteModel)
    for i in range(0, len(points)):
        delete_model("obstacle_" + i, "")




"""






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

    # next, we'll publish the odometry message over ROS
    odom = Odometry()
    odom.header.stamp = rospy.Time.now()
    odom.header.frame_id = "odom"
    # set the position
    odom.pose.pose = initial_state.pose
    # set the velocity
    odom.child_frame_id = "base_link"
    odom.twist.twist = initial_state.twist
    # publish the message
    odom_pub.publish(odom)

"""
def spawn_gazebo_obstacles():
    rospy.wait_for_service("gazebo/spawn_sdf_model")
    spawn_model = rospy.ServiceProxy("gazebo/spawn_sdf_model", SpawnModel)
    with open(gazebo_simulation_pkg_path + "/worlds/obstacle01.sdf", "r") as f:
        obstacle_xml = f.read()
    rospy.loginfo(obstacle_xml)
    orient = Quaternion(0, 0, 0, 0)
    item_pose = Pose(Point(x=1, y=3, z=0), orient)
    spawn_model("obstacle01", obstacle_xml, "", item_pose, "world")
"""

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

    for topic, msg, t in bag.read_messages(topics=['path_goals_bag']):
        waypoints.append(msg)
        points_2d.append(Point2d(msg.pose.pose.position.x, msg.pose.pose.position.y))

    for topic, msg, t in bag.read_messages(topics=['initial_model_state']):
        initial_state = msg
        points_2d.append(Point2d(msg.pose.position.x, msg.pose.position.y))
    bag.close()

def run(n_simulations):
    """ Low level information publisher. High level should be
    subscribed to the path_plan_info topic.
    """
    global waypoints, time_average_by_section, failures_by_section, traveled_distance_average_by_section, velocity_average_by_section, last_x_position, last_y_position, current_traveled_distance, compute_distance, global_time_average, global_failures, global_traveled_distance_average, global_velocity_average, maximum_linear_velocity_by_section, linear_velocity_average_by_section, global_linear_velocity_average, max_linear_velocity, current_linear_velocity, compute_linear_velocity, points_2d
    
    # configure needed topics and move_base client
    path_plan_info_pub = rospy.Publisher('/path_plan_info', PathInfo, queue_size=1)
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
    time_average_by_section = [0.0] * len(waypoints) 
    # Make sure we have an empty array of aborts.
    # The lenght of the array is equal to the number of end points (path sections)
    failures_by_section = [0.0] * len(waypoints)
    # Make sure we have an empty array of distances.
    # The lenght of the array is equal to the number of end points (path sections)
    traveled_distance_average_by_section = [0.0] * len(waypoints)
    # Make sure we have an empty array of velocities.
    # The lenght of the array is equal to the number of end points (path sections)
    velocity_average_by_section = [0.0] * len(waypoints)
    # Make sure we have an empty array of linear velocities.
    # The lenght of the array is equal to the number of end points (path sections)
    linear_velocity_average_by_section = [0.0] * len(waypoints)
       # Make sure we have an empty array of maximun linear velocities.
    # The lenght of the array is equal to the number of end points (path sections)
    maximum_linear_velocity_by_section = [0.0] * len(waypoints)
    
    # Initialize global statistics
    global_time_average = 0.0
    global_failures_average = 0.0
    global_traveled_distance_average = 0.0
    global_velocity_average = 0.0
    global_linear_velocity_average = 0.0
    max_linear_velocity = -1.0
    current_linear_velocity = 0.0

    #generate_obstacles(points_2d)
    #spawn_gazebo_obstacles()

    # Run the n simulations
    for x in range(0, n_simulations):        
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
            last_linear_velocity = 0.0
            max_linear_velocity = -1.0
            current_linear_velocity = 0.0
            
            compute_distance = True
            compute_linear_velocity = True

            # Send goal to path planner
            client.send_goal(goal)

            # Set the start time for the current plan
            start_time = rospy.get_time()

            # Keep waiting for results 
            finished_within_time = client.wait_for_result(rospy.Duration(simulation_timeout))
            
            compute_distance = False
            compute_linear_velocity = False
            
            # Check for success or failure
            if not finished_within_time:
                client.cancel_goal()
                rospy.loginfo("Timed out achieving goal")
                # Increase the failures count for the current section
                failures_by_section[i] += 1
                break
            else:
                state = client.get_state()
                if state == GoalStatus.SUCCEEDED:
                    rospy.loginfo("Goal succeeded!")
                    rospy.loginfo("State:" + str(state))
                else:
                    rospy.loginfo("Goal failed with error code: " + str(state))
                    # Increase the failures count for the current section
                    failures_by_section[i] += 1
                    break
            # Computes section statistics
            time_average_by_section[i] += (rospy.get_time() - start_time)
            traveled_distance_average_by_section[i] = current_traveled_distance
            velocity_average_by_section[i] = traveled_distance_average_by_section[i] / time_average_by_section[i]
            linear_velocity_average_by_section[i] = current_linear_velocity_average
            maximum_linear_velocity_by_section[i] = max_linear_velocity
            i += 1 
        # Reset gazebo word to avoid posible modifications in the last simulation
        #reset_gazebo_world()
        # Set the initial vehicle model state
        set_vehicle_model_state()
        # Clear costmaps to avoid problems when we "teletransport" our vehicle
        #clear_costmaps()
        # Wait for AMCL algorithm does its work (relocate robot)
        time.sleep(time_to_relocation)
        rospy.loginfo("###### Simulation " + str(x+1) + " finished ######")

    # Compute local statistics for each section
    for i in range(0, len(waypoints)):
        time_average_by_section[i] /= n_simulations
        rospy.loginfo("###### Section " + str(i+1) + " -> time  " + str(time_average_by_section[i]) + "  ######")
        traveled_distance_average_by_section[i] /= n_simulations
        rospy.loginfo("###### Section " + str(i+1) + " -> distance  " + str(traveled_distance_average_by_section[i]) + "  ######")
        velocity_average_by_section[i] /= n_simulations
        rospy.loginfo("###### Section " + str(i+1) + " -> velocity  " + str(velocity_average_by_section[i]) + "  ######")
    
    # Compute global statistics
    global_time_average = sum(time_average_by_section) 
    rospy.loginfo("###### Global -> time  " + str(time_average_by_section[i]) + "  ######")
    global_traveled_distance_average = sum(traveled_distance_average_by_section)
    rospy.loginfo("###### Global -> distance  " + str(global_traveled_distance_average) + "  ######")
    global_failures = sum(failures_by_section)
    rospy.loginfo("###### Global -> failures  " + str(global_failures) + "  ######")
    global_velocity_average = sum(velocity_average_by_section) / float(len(waypoints))
    rospy.loginfo("###### Global -> velocity  " + str(global_velocity_average) + "  ######")
    global_linear_velocity_average = sum(linear_velocity_average_by_section) / float(len(waypoints))
    rospy.loginfo("###### Global -> linear velocity  " + str(global_linear_velocity_average) + "  ######")


    # Build plan results message
    plan_results = PathInfo()
    plan_results.plan_file = file_name
    plan_results.date = time.strftime("%c")
    plan_results.simulations = n_simulations
    plan_results.global_time_average = global_time_average
    plan_results.global_distance_average = global_traveled_distance_average
    plan_results.global_velocity_average = global_velocity_average
    plan_results.global_failures = global_failures
    plan_results.global_linear_velocity_average = global_linear_velocity_average
    plan_results.global_maximum_linear_velocity = max(maximum_linear_velocity_by_section)

    sections = []

    for i in range(0, len(waypoints)):
        section = GoalInfo()
        section.id = str(i+1)
        section.time_average = time_average_by_section[i]
        section.distance_average =  traveled_distance_average_by_section[i]
        section.velocity_average = velocity_average_by_section[i]
        section.failures = failures_by_section[i]
        section.linear_velocity_average = linear_velocity_average_by_section[i]
        section.maximum_linear_velocity = maximum_linear_velocity_by_section[i]
        sections.append(section)
    
    plan_results.sections = sections
    path_plan_info_pub.publish(plan_results)
    rospy.loginfo(plan_results)

if __name__ == '__main__':
    global file_name, simulations
    rospy.init_node('load_path')
    # get input file name
    file_name = rospy.get_param('~input_file')
    simulations = int(rospy.get_param('~simulations'))
    run(simulations)