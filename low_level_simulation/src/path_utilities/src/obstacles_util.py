#!/usr/bin/env python
#this specify that the script is written in python. Every ROS node in
#python should start with this line (or else it won't work properly.)

#############
### USAGE ###
#############

"""
1.

# Create an obstacles model generator specifying the following fields:
# (name of the simulation, obstacles length, robot radius, initial x value, initial y value)
my_obstacles_model_generator = ObstaclesModelGenerator("my simulation", 0.5, 0.5, 0.0, 0.0)
# Append point goals to build a new segment, especifying the name of the segment and the density
# of obstacles:
# (name of segment, goal x value, goal y value, density of obstacles)
my_obstacles_model_generator.append_point("1", 10.0, 10.0, 0.3)
my_obstacles_model_generator.append_point("2", 20.0, 20.0, 0.5)
my_obstacles_model_generator.append_point("3", 30.0, 30.0, 0.6)
# Spawn obstacles in gazebo:
my_obstacles_model_generator.spawn_obstacles()

2.

# Using global density and max obstacles shiftment for all segments. The last thow
# fields corresponds to the density and max obstacles shiftment
my_obstacles_model_generator = ObstaclesModelGenerator("my simulation", 0.5, 0.5, 0.0, 0.0, 0.3, 0.5)
# Show when we add a point, we don't need to especified the density or the
# max obstacles shiftment  individually.
my_obstacles_model_generator.append_point("1", 0.0, 5.0)
my_obstacles_model_generator.append_point("2", 10.0, 0.0)
my_obstacles_model_generator.append_point("3", 14.0, 20.0)
my_obstacles_model_generator.spawn_obstacles()

"""

####################
### DEPENDENCIES ###
####################

# Maths dependencies.
from sympy import Point, Segment
from pyproj import Geod
from math import ceil, sqrt

# Format dependencies.
import json

# ROS dependencies.
#imports the rospy module necessary for all ROS nodes in python.
import rospy
from gazebo_msgs.srv import SpawnModel, DeleteModel
# Avoid conflicts with SymPy Point by renaming ROS Point to RosPoint
from geometry_msgs.msg import Pose, Quaternion, Point as RosPoint
from random import uniform, sample

import time

#################
### CONSTANTS ###
#################

"""
Geodetic parametes for specify the ellipsoid.
More info: https://jswhit.github.io/pyproj/pyproj.Geod-class.html
"""
GEOD_ELLPS = "+ellps=WGS84"

# Geodetic instance
GEOD = Geod(GEOD_ELLPS)

"""
Maximum distance which will apply when displacing the obstacle
to give some randomness to the simulation.
"""
DFLT_MAX_OBSTACLE_SHIFTMENT = 0.5

"""
Default density of obstacles for each path section.
"""
DFLT_DENSITY = 0.35

"""
Gazebo spawn and delete models services.
"""
rospy.loginfo("waiting for gazebo services")
print("waiting for gazebo services")

rospy.wait_for_service("gazebo/spawn_sdf_model")
SPAWN_MODEL = rospy.ServiceProxy("gazebo/spawn_sdf_model", SpawnModel)

rospy.wait_for_service("gazebo/delete_model")
DELETE_MODEL = rospy.ServiceProxy("gazebo/delete_model", DeleteModel)

rospy.loginfo("Connection with gazebo services established")
print("Connection with gazebo services established")

###############
### CLASSES ###
###############

class ObstacleModel():
	"""
	Obstacle represents some properties of our simulation obstacles, such as
	the point where is located, an identifier and its length.
	"""
	global SPAWN_MODEL, DELETE_MODEL

	def __init__(self, obstacle_id, x, y, length):
		"""
		Default constructor.
		"""
		self.obstacle_id = obstacle_id
		self.x = x
		self.y = y
		self.length = length

	def spawn_obstacle(self):
		orientation = Quaternion(0, 0, 0, 0)
		pose = Pose(RosPoint(x=self.x, y=self.y, z=0), orientation)
		SPAWN_MODEL(self.obstacle_id, self.__get_obstacle_xml(self.obstacle_id, self.x, self.y, \
    		self.length), "", pose, "")

	def delete_obstacle(self):
		DELETE_MODEL(self.obstacle_id)

	def __get_obstacle_xml(self, obstacle_id, x, y, length):
		box = "<?xml version='1.0'?>" + \
			  '<sdf version="1.5">' + \
              "<model name=" + obstacle_id + ">" + \
              "<pose>" + str(x) + " " +  str(y) + " 0 0 0 0 </pose>" + \
              "<static>true</static>" + \
              '<link name="link">' + \
              "<inertial>" + \
              "<mass>1.0</mass>"+ \
              "<inertia>" + \
          	  "<ixx>0.083</ixx> " + \
          	  "<ixy>0.0</ixy>" + \
              "<ixz>0.0</ixz>" + \
              "<iyy>0.083</iyy>" + \
              "<iyz>0.0</iyz>" + \
              "<izz>0.083</izz>" + \
              "</inertia>" + \
              "</inertial>" + \
              '<collision name="collision">' + \
              "<geometry>" + \
              "<box>" + \
              "<size>" + str(length) + " " + str(length) + " 4 </size>" + \
              "</box>" + \
              "</geometry>" + \
              "</collision>" + \
			  '<visual name="visual">' + \
              "<geometry>" + \
              "<box>" + \
              "<size> " + str(length) + " " + str(length) + " 4 </size>" + \
              "</box>" + \
              "</geometry>" + \
			  "</visual>" + \
              "</link>" + \
              "</model>" + \
              "</sdf>"
		return box

	def to_json(self):
		""" 
		Get this object in json format.
		"""
		return json.dumps(self, default=lambda o:o.__dict__, sort_keys=True, indent=4)

class ObstaclesSegmentModel():
	"""
	Obstacles Segment represents a set of methods which will build an obstacles 
	segment randomly according to the density specified by the user.
	"""
	global DFLT_DENSITY, DFLT_MAX_OBSTACLE_SHIFTMENT, GEOD
	
	def __init__(self, segment_id, x1, y1, x2, y2, obstacle_length, robot_radius, \
		density = DFLT_DENSITY, max_obstacle_shiftment = DFLT_MAX_OBSTACLE_SHIFTMENT):
		"""
		Default constructor.
		"""
		self.build(segment_id, x1, y1, x2, y2, obstacle_length, robot_radius, density = density, \
			max_obstacle_shiftment = max_obstacle_shiftment)


	def get_segment(self, x1, y1, x2, y2):
		"""
		Build a segment for get some maths computations such as the length.
		"""
		return Segment(Point(x1, y1), Point(x2, y2))

	def get_n_obstacles(self, segment_length, obstacle_length, density):
		"""
		Get the number of obstacles from the following formula:
		D: Sensity
		L1: Length of the segment
		L2: Length of the generic obstacle for the simulation
		N: Number of obstacles

		N = (D * L1) / L2
		"""
		return int(ceil(((density * segment_length) / obstacle_length)))

	def get_obstacles_points(self, x1, y1, x2, y2, n_points, max_obstacle_shiftment):
		"""
		The following function will return a set of points equally spaced
		in the which ones we will set the obstacles.

		Geod.npts() official description: 

		Given a single initial point and terminus point (specified by python
		floats lon1,lat1 and lon2,lat2), returns a list of longitude/latitude
		pairs describing npts equally spaced intermediate points along the 
		geodesic between the initial and terminus points.
		"""
		points = GEOD.npts(x1, y1, x2, y2, n_points)
		signs = [-1.0, 1.0]
		for i in range(0, len(points)):
			# get some random movement for each obstacle
			x_randomness = uniform(0.0, max_obstacle_shiftment)
			y_randomness = uniform(0.0, max_obstacle_shiftment)
			if(x_randomness > 0.0):
				x_randomness *= sample(signs, k = 1)[0]
			if(y_randomness > 0.0):
				y_randomness *= sample(signs, k = 1)[0]
			points[i] = (round(points[i][0] + x_randomness, 2), round(points[i][1] + y_randomness, 2))
		return points

	def build(self, segment_id, x1, y1, x2, y2, obstacle_length, robot_radius, \
		density = DFLT_DENSITY, max_obstacle_shiftment = DFLT_MAX_OBSTACLE_SHIFTMENT):
		"""
		Build a segment instance from scratch.
		""" 
		# Set an identifier to this segment
		self.segment_id = segment_id
		# Build a line object to compute some maths
		self.segment = self.get_segment(round(x1, 2),round(y1, 2), round(x2, 2), round(y2, 2))
		# Set the density of this segment
		self.density = round(density, 2)
		# Set the generic length for the simulation
		self.obstacle_length = round(obstacle_length, 2)
		# Set a shiftment limit to give some randomness to the obstacles position
		self.max_obstacle_shiftment = round(max_obstacle_shiftment, 2)
		# Set the robot radius to avoid problems when we spawn the obstacles
		self.robot_radius = round(robot_radius, 2)
		# Compute the number of obstacles allowed according to the density and the
		# length of the segment
		n_obstacles = self.get_n_obstacles(eval(str(self.segment.length)), self.obstacle_length, \
			self.density)
		# Generate n uniformly distanted points, also giving some randomness to the
		# position of each obstacle
		obstacles_points = self.get_obstacles_points(x1, y1, x2, y2, n_obstacles, \
			max_obstacle_shiftment)
		# Build a list of Obstacles with the correspond properties.
		self.obstacles = []
		# A counter to be concatenated in the identifier to give
		# a unique model name to this obstacle.
		i = 1
		for point in obstacles_points:
			# Avoid set an obstacle above the robot or above the goal.
			if not ((i == 1 and eval(str(self.segment.p1.distance(point))) < self.robot_radius) \
				or ((i == len(obstacles_points) and eval(str(self.segment.p2.distance(point))) < \
					self.robot_radius))):
				# Id of the obstacle.
				obstacle_id = "sg_" + str(self.segment_id) + "_obs_" + str(i)
				self.obstacles.append(ObstacleModel(obstacle_id, point[0], point[1], \
					self.obstacle_length))
			i += 1

	def spawn_segment_obstacles(self):
		for obstacle in self.obstacles:
			obstacle.spawn_obstacle()

	def delete_segment_obstacles(self):
		for obstacle in self.obstacles:
			obstacle.delete_obstacle()
			time.sleep(0.2)

	def clear(self):
		"""
		Clear this segment.
		"""
		# Avoid unnecessary tasks.
		if not self.is_empty():
			self.segment_id = None
			self.segment = None
			self.density = None
			self.obstacle_length = None
			self.obstacles = None

	def is_empty(self):
		"""
		Check if there are no obstacles for this segment
		"""
		return self.obstacles == [] or self.obstacles == None

	def to_json(self):
		""" 
		Get this object in json format.
		"""
		return json.dumps(self, default=lambda o:o.__dict__, sort_keys=True, indent=4)

class ObstaclesModelGenerator():
	"""
	An obstacles segment model generator.
	"""
	global DFLT_DENSITY, DFLT_MAX_OBSTACLE_SHIFTMENT

	def __init__(self, simulation_id, obstacle_length, robot_radius, initial_x, initial_y, \
		density = DFLT_DENSITY, max_obstacle_shiftment = DFLT_MAX_OBSTACLE_SHIFTMENT, segments = []):
		"""
		Default constructor.
		"""
		# Set the id of the simulation
		self.simulation_id = simulation_id
		# Set the segments of the simulation
		self.segments = segments
		# Set the obstacles length for spawn position calculations
		self.obstacle_length = round(obstacle_length, 2)
		# Set the radius of robot for avoid spawn problems
		self.robot_radius = round(robot_radius, 2)
		# Set the initial x value
		self.initial_x = round(initial_x, 2)
		# Set the initial y value
		self.initial_y = round(initial_y, 2)
		# Set a shiftment limit to give some randomness to the obstacles position
		self.max_obstacle_shiftment = round(max_obstacle_shiftment, 2)
		# Set the global density (In case we want the same density for each segment)
		self.density = round(density, 2)

	def append_point(self, segment_id, x, y, density = None, max_obstacle_shiftment = None):
		"""
		Append a new point to the path, generating the segment properties automatically.
		"""
		# If the max obstacle shiftment isn't especified, we will get the global 
		# or default value, and the same with density
		if max_obstacle_shiftment == None:
			max_obstacle_shiftment = self.max_obstacle_shiftment
		if density == None:
			density = self.density
		# There are some segments yet
		if not (self.segments == [] or self.segments == None):
			self.__concatenate_segment(segment_id, self.segments[-1].segment.p2.x, \
				self.segments[-1].segment.p2.y, x, y, density, max_obstacle_shiftment)
		else: 
			# Build the first segment
			self.__concatenate_segment(segment_id, self.initial_x, self.initial_y, x, y, density, \
				max_obstacle_shiftment)

	def __concatenate_segment(self, segment_id, x1, y1, x2, y2, density = None, \
		max_obstacle_shiftment = None):
		"""
		Concatenate a new segment to the path.
		"""
		# If the max obstacle shiftment isn't especified, we will get the global 
		# or default value, and the same with density
		if max_obstacle_shiftment == None:
			max_obstacle_shiftment = self.max_obstacle_shiftment
		if density == None:
			density = self.density
		self.segments.append(ObstaclesSegmentModel(segment_id, x1, y1, x2, y2, \
			self.obstacle_length, self.robot_radius, density = density, max_obstacle_shiftment = \
			max_obstacle_shiftment))


	def get_all_obstacles(self):
		"""
		Get all obstacles instances.
		"""
		obstacles = []
		for segment in self.segments:
			for obstacle in segment.obstacles:
				obstacles.append(obstacle)
		return obstacles

	def get_all_obstacles_id(self):
		"""
		Get all obstacles ids to use them when removing or adding obstacles to the gazebo world.
		"""
		obstacles_id = []
		for segment in self.segments:
			for obstacle in segment.obstacles:
				obstacles_id.append(str(obstacle.obstacle_id))
		return obstacles_id

	def get_all_obstacles_points(self):
		"""
		Get all obstacles points to use them when removing or adding obstacles to the gazebo world.
		"""
		obstacles_points = []
		for segment in self.segments:
			for obstacle in segment.obstacles:
				obstacles_points.append((obstacle.x, obstacle.y))
		return obstacles_points

	def spawn_obstacles(self):
		for segment in self.segments:
			segment.spawn_segment_obstacles()

	"""TODO: Doens't work properly"""
	def delete_obstacles(self):
		for segment in self.segments:
			segment.delete_segment_obstacles()

	def clear(self):
		"""
		Clear all segments concatenated.
		"""
		# Avoid unnecessary tasks.
		if not self.is_empty():
			for i in range(0, len(self.segments)):
				self.segments[i].clear()

	def is_empty(self):
		"""
		Check if there is no obstacles.
		"""
		for i in range(0, len(self.segments)):
			if not self.segments[i].is_empty():
				return False
		return True

	def to_json(self):
		""" 
		Get this object in json format.
		"""
		return json.dumps(self, default=lambda o:o.__dict__, sort_keys=True, indent=4)


