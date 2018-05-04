#!/usr/bin/env python

import rospy
from math import pow, sqrt, ceil
from random import randint
from nav_msgs.msg import OccupancyGrid
from gazebo_msgs.srv import DeleteModel

class Point:
    """ Point class represents and manipulates x,y coords. """
    def __init__(self, x = 0, y = 0):
        """ Create a new point at the origin """
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
occupancy_grid_flag = False

def callback_occupancy_grid(msg):
    """
    # This represents a 2-D grid map, in which each cell represents the probability of
    # occupancy.
    Header header 
    #MetaData for the map
    MapMetaData info
    # The map data, in row-major order, starting with (0,0).  Occupancy
    # probabilities are in the range [0,100].  Unknown is -1.
    int8[] data
    """
    global occupancy_grid, occupancy_grid_flag
    if(occupancy_grid_flag):
        occupancy_grid = msg

rospy.Subscriber('map', OccupancyGrid, callback_occupancy_grid)

def polygon_centroid(points):
	centroid = Point()
	n_points = len(points)
	point = Point()
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
				points.append(Point(x, y))
				points.append(Point(x, y_sym))
				points.append(Point(x_sym, y))
				points.append(Point(x_sym, y_sym))
	return points

def get_row_major_order_index(i, j, height):
	return i*height + j

def get_obstacles_points(points, free_thresh = 0.196, density = 0.25):
	"""
	- number of obstacles = ceil(number of points * density)
	- density should be between [0, 1]
	"""
	# occupancy grid map
	global occupancy_grid, occupancy_grid_flag 
	occupancy_grid_flag = True
	# get the number of obstacles
	n_obstacles = ceil(len(points)*density)
	# get an integer value in the scale [0,100]
	free_thresh = int(free_thresh*100)
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
	rospy.loginfo(data)
	interest_zone_points = list(filter(lambda point: data[get_row_major_order_index(point.x, point.y, height)] > 0 and data[get_row_major_order_index(point.x, point.y, height)] < free_thresh , interest_zone_points))
	obstacles_points = []
	for i in range(0, n_obstacles):
		index = get_row_major_order_index(randint(0, width) , randint(0, height), height)
		obstacles_points.append(interest_zone_points[index])
		interest_zone_points = list(filter(lambda point: data[get_row_major_order_index(point.x, point.y, height)] > 0 and data[get_row_major_order_index(point.x, point.y, height)] < free_thresh , interest_zone_points))
	occupancy_grid_flag = False
	return obstacles_points

def spawn_gazebo_obstacles(points):
    rospy.wait_for_service("gazebo/spawn_sdf_model")
    spawn_model = rospy.ServiceProxy("gazebo/spawn_sdf_model", SpawnModel)
    with open(gazebo_simulation_pkg_path + "/worlds/obstacle01.sdf", "r") as f:
        obstacle_xml = f.read()
    for i in range(0, len(points)):
	    orient = Quaternion(0, 0, 0, 0)
	    item_pose = Pose(Point(x=points[i].x, y=points[i].y, z=0), orient)
	    spawn_model("obstacle_" + i, obstacle_xml, "", item_pose, "world")

def generate_obstacles(points, free_thresh = 0.196, density = 0.25):
	spawn_gazebo_obstacles(get_obstacles_points(points, free_thresh, density))

def delete_obstacles():
    rospy.wait_for_service("gazebo/delete_model")
    delete_model = rospy.ServiceProxy("gazebo/delete_model", DeleteModel)
    for i in range(0, len(points)):
    	delete_model("obstacle_" + i, "")