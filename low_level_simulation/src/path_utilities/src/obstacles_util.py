#!/usr/bin/env python

from sympy import Point, Segment
from pyproj import Geod
from math import ceil, sqrt
import json

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
MAX_RAND_DISPLACE_OFFSET = 2.0

"""
Default density of obstacles for each path section.
"""
DFLT_DENSITY = 0.35

###############
### CLASSES ###
###############

class ObstacleModel():
	"""
	Obstacle represents some properties of our simulation obstacles, such as
	the point where is located, an identifier and its length.
	"""
	def __init__(self, obstacle_id, x, y, length):
		"""
		Default constructor.
		"""
		self.obstacle_id = obstacle_id
		self.x = x
		self.y = y
		self.length = length

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
	global DFLT_DENSITY, GEOD
	
	def __init__(self, segment_id, x1, y1, x2, y2, obstacle_length, robot_radius, \
		density = DFLT_DENSITY):
		"""
		Default constructor.
		"""
		self.build(segment_id, x1, y1, x2, y2, obstacle_length, robot_radius, density = density)


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

	def get_obstacles_points(self, x1, y1, x2, y2, n_points):
		"""
		The following function will return a set of points equally spaced
		in the which ones we will set the obstacles.

		Geod.npts() official description: 

		Given a single initial point and terminus point (specified by python
		floats lon1,lat1 and lon2,lat2), returns a list of longitude/latitude
		pairs describing npts equally spaced intermediate points along the 
		geodesic between the initial and terminus points.
		"""
		return GEOD.npts(x1, y1, x2, y2, n_points)

	def build(self, segment_id, x1, y1, x2, y2, obstacle_length, robot_radius, \
		density = DFLT_DENSITY):
		"""
		Build a segment instance from scratch.
		""" 
		# Set an identifier to this segment
		self.segment_id = segment_id
		# Build a line object to compute some maths
		self.segment = self.get_segment(x1, y1, x2, y2)
		# Set the density of this segment
		self.density = density
		# Set the generic length for the simulation
		self.obstacle_length = obstacle_length
		# Set the robot radius to avoid problems when we spawn the obstacles
		self.robot_radius = robot_radius
		# Compute the number of obstacles allowed according to the density and the
		# length of the segment.
		n_obstacles = self.get_n_obstacles(eval(str(self.segment.length)), self.obstacle_length, \
			self.density)
		# Generate n uniformly distanted points.
		obstacles_points = self.get_obstacles_points(x1, y1, x2, y2, n_obstacles)
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
	global DFLT_DENSITY

	def __init__(self, model_identifier, obstacle_length, robot_radius, segments = []):
		"""
		Default constructor.
		"""
		self.model_identifier = model_identifier
		self.segments = segments
		self.obstacle_length = obstacle_length
		self.robot_radius = robot_radius 

	def concatenate_segment(self, segment_id, x1, y1, x2, y2, density = DFLT_DENSITY):
		"""
		Concatenate a new segment to the path.
		"""
		self.segments.append(ObstaclesSegmentModel(segment_id, x1, y1, x2, y2, \
			self.obstacle_length, self.robot_radius, density = density))

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
