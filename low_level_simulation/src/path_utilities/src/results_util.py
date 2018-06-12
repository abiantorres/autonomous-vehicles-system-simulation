#!/usr/bin/env python

from costum_msgs.msg import IndividualSegmentResultsMsg, IndividualIterationResultsMsg, \
    GlobalSegmentResultsMsg, GlobalSimulationResultsMsg, SimulationMetadataMsg, SimulationMsg, \
    SegmentMetadataMsg, SegmentsMetadataMsg
import rospy, hashlib, json, yaml
from move_base_msgs.msg import MoveBaseActionFeedback
from geometry_msgs.msg import Point as PointMsg
from statistics import stdev, mean
from datetime import datetime
from math import pow, sqrt

last_vehicle_coordinates = [0.0, 0.0]
current_traveled_distance = 0.0
start_time = 0.0
compute_distance = False

def callback(data):
    global last_vehicle_coordinates, current_traveled_distance, compute_distance
    if(compute_distance):
        current_traveled_distance += sqrt(pow(data.feedback.base_position.pose.position.x \
        - last_vehicle_coordinates[0], 2) + pow(data.feedback.base_position.pose.position.y \
        - last_vehicle_coordinates[1], 2))
    last_vehicle_coordinates[0] = data.feedback.base_position.pose.position.x
    last_vehicle_coordinates[1] = data.feedback.base_position.pose.position.y

rospy.Subscriber("move_base/feedback", MoveBaseActionFeedback, callback)

class SegmentMetadata:

    def __init__(self, segment_index = None, initial_point = None, \
        end_point = None, distance_between_obstacles = None, \
        segment_simulation_timeout = None):
        self.segment_index = segment_index
        self.initial_point = initial_point
        self.end_point = end_point
        self.distance_between_obstacles = distance_between_obstacles
        self.segment_simulation_timeout = segment_simulation_timeout

    def get_msg(self):
        msg = SegmentMetadataMsg()
        msg.segment_index = self.segment_index
        msg.initial_point = self.initial_point
        msg.end_point = self.end_point
        msg.distance_between_obstacles = self.distance_between_obstacles
        msg.segment_simulation_timeout = self.segment_simulation_timeout
        return msg

class SegmentResults:

    def __init__(self, segment_index):
        self.segment_index = segment_index
        self.time = 0.0
        self.distance = 0.0
        self.speed = 0.0
        self.failure = False

    def start(self):
        global current_traveled_distance, compute_distance, start_time
        current_traveled_distance = 0.0
        start_time = rospy.get_time()
        compute_distance = True

    def stop(self, failure):
        global current_traveled_distance, compute_distance, start_time
        compute_distance = False
        self.time = rospy.get_time() - start_time
        self.distance = current_traveled_distance
        self.speed = self.distance / self.time
        self.failure = failure

    def get_msg(self):
        msg = IndividualSegmentResultsMsg()
        msg.segment_index = self.segment_index
        msg.time = self.time
        msg.distance = self.distance
        msg.speed = self.speed
        msg.failure = self.failure
        return msg

class IterationResults:
    def __init__(self, n_segments, iteration_index):
        self.iteration_index = iteration_index
        self.n_segments = n_segments
        self.segments_results = []
        self.failure = False
        self.failure_segment_index = -1
        self.time = 0.0
        self.distance = 0.0
        self.speed = 0.0
        for i in range(0, n_segments):
            self.segments_results.append(SegmentResults(i))

    def start(self, segment_index):
        self.segments_results[segment_index].start()

    def stop(self, segment_index, failure):
        self.segments_results[segment_index].stop(failure)
        self.time += self.segments_results[segment_index].time
        self.distance += self.segments_results[segment_index].distance
        if(failure):
            self.failure = True
            self.failure_segment_index = segment_index

    def get_msg(self):
        self.speed = self.distance / self.time
        msg = IndividualIterationResultsMsg()
        msg.iteration_index = self.iteration_index
        msg.failure = self.failure
        msg.failure_segment_index = self.failure_segment_index
        msg.speed = self.speed
        msg.time = self.time
        msg.distance = self.distance
        segments_results_msg = []
        for i in range(0, self.n_segments):
            segments_results_msg.append(self.segments_results[i].get_msg())
        msg.segments_results = segments_results_msg
        return msg

class SimulationResults:

    def __init__(self, n_segments, n_iterations):
        self.n_segments = n_segments
        self.n_iterations = n_iterations
        self.n_failures = 0
        self.useful_simulation = True
        self.iterations_results = []
        self.segments_metadata = []
        for i in range(0, self.n_iterations):
            self.iterations_results.append(IterationResults(n_segments, i))
        for i in range(0, self.n_segments):
            self.segments_metadata.append(SegmentMetadata(segment_index = i))

    def get_global_simulation_failures_count(self):
        count = 0
        for i in range(0, self.n_iterations):
            if(self.iterations_results[i].failure):
                count += 1
        return count

    def get_global_segment_failures_count(self, segment_index):
        count = 0
        for i in range(0, self.n_iterations):
            if(self.iterations_results[i].failure and \
            self.iterations_results[i].failure_segment_index == segment_index):
                count += 1
        return count

    def get_point_msg(self, x, y):
        msg = PointMsg()
        msg.x = x
        msg.y = y
        return msg

    def set_segment_metadata(self, segment_index, x1, y1, x2, y2,\
        distance_between_obstacles, segment_simulation_timeout):
        self.segments_metadata[segment_index].initial_point = self.get_point_msg(x1, y1)
        self.segments_metadata[segment_index].end_point = self.get_point_msg(x2, y2)
        self.segments_metadata[segment_index].distance_between_obstacles =\
            distance_between_obstacles
        self.segments_metadata[segment_index].segment_simulation_timeout =\
            segment_simulation_timeout

    def get_individual_iterations_results_msgs_list(self):
        individual_iterations_results = []
        for i in range(0, self.n_iterations):
            individual_iterations_results.append(self.iterations_results[i].get_msg())
        return individual_iterations_results

    def get_global_segment_results_lists(self, segment_index):
        individual_times_results = []
        individual_speeds_results = []
        individual_distances_results = []
        for i in range(0, self.n_iterations):
            if(self.iterations_results[i].failure):
                individual_times_results.append(\
                    self.iterations_results[i].segments_results[segment_index].time)
                individual_speeds_results.append(\
                    self.iterations_results[i].segments_results[segment_index].speed)
                individual_distances_results.append(\
                    self.iterations_results[i].segments_results[segment_index].distance)
        return individual_times_results, individual_speeds_results,\
            individual_distances_results

    def get_global_simulation_results_lists(self):
        individual_times_results = []
        individual_speeds_results = []
        individual_distances_results = []
        for i in range(0, self.n_iterations):
            if(not self.iterations_results[i].failure):
                individual_times_results.append(\
                    self.iterations_results[i].time)
                individual_speeds_results.append(\
                    self.iterations_results[i].speed)
                individual_distances_results.append(\
                    self.iterations_results[i].distance)
        return individual_times_results, individual_speeds_results,\
            individual_distances_results

    def get_global_segment_results_msg(self, segment_index):
        msg = GlobalSegmentResultsMsg()
        msg.segment_index = segment_index
        msg.n_failures = self.get_global_segment_failures_count(segment_index)
        if((self.n_iterations - msg.n_failures) >= 2):
            individual_times_results, individual_speeds_results,\
                individual_distances_results = self.get_global_segment_results_lists(segment_index)
            msg.time_mean = mean(individual_times_results)
            msg.time_stdev = stdev(individual_times_results)
            msg.time_max = max(individual_times_results)
            msg.time_min = min(individual_times_results)
            msg.distance_mean = mean(individual_distances_results)
            msg.distance_stdev = stdev(individual_distances_results)
            msg.distance_max = max(individual_distances_results)
            msg.distance_min = min(individual_distances_results)
            msg.speed_mean = mean(individual_speeds_results)
            msg.speed_stdev = stdev(individual_speeds_results)
            msg.speed_max = max(individual_speeds_results)
            msg.speed_min = min(individual_speeds_results)
        return msg

    def get_global_segment_results_msgs_list(self):
        global_segments_results_msgs_list = []
        for i in range(0, self.n_segments):
            global_segments_results_msgs_list.append(self.get_global_segment_results_msg(i))
        return global_segments_results_msgs_list


    def get_global_simulation_results_msg(self):
        msg = GlobalSimulationResultsMsg()
        self.n_failures = msg.n_failures
        self.useful_simulation = not (self.n_failures >= 2)
        msg.n_failures = self.get_global_simulation_failures_count()
        if(self.useful_simulation):
            individual_times_results, individual_speeds_results,\
                individual_distances_results = self.get_global_simulation_results_lists()
            msg.time_mean = mean(individual_times_results)
            msg.time_stdev = stdev(individual_times_results)
            msg.time_max = max(individual_times_results)
            msg.time_min = min(individual_times_results)
            msg.distance_mean = mean(individual_distances_results)
            msg.distance_stdev = stdev(individual_distances_results)
            msg.distance_max = max(individual_distances_results)
            msg.distance_min = min(individual_distances_results)
            msg.speed_mean = mean(individual_speeds_results)
            msg.speed_stdev = stdev(individual_speeds_results)
            msg.speed_max = max(individual_speeds_results)
            msg.speed_min = min(individual_speeds_results)
        return msg

    def get_segments_metadata_msg(self):
        msg = SegmentsMetadataMsg()
        tmp = []
        for i in range(0, self.n_segments):
            tmp.append(self.segments_metadata[i].get_msg())
        msg.segments_metadata = tmp
        return msg

    def get_simulation_metadata_msg(self, plan_file, timeout_factor):
        msg = SimulationMetadataMsg()
        msg.simulation_hash = self.get_simulation_hash()
        msg.robot_file = str(rospy.get_param('robot_file'))
        msg.world_file = str(rospy.get_param('world_file'))
        msg.plan_file = str(rospy.get_param('plan_file'))
        msg.map_file = str(rospy.get_param('map_file'))
        msg.date = datetime.now().strftime("%I:%M%p on %B %d, %Y")
        msg.n_segments = self.n_segments
        msg.timeout_factor = timeout_factor
        msg.n_iterations = self.n_iterations
        msg.useful_simulation = self.useful_simulation
        msg.local_planner = str(rospy.get_param('move_base/base_local_planner'))
        msg.segments_metadata = self.get_segments_metadata_msg()
        if eval(str(rospy.get_param('move_base/GlobalPlanner/use_dijkstra'))):
            msg.global_planner = "Dijkstra"
        else:
            msg.global_planner = "A*"
        return msg

    def get_simulation_hash(self):
        prehash = ""
        prehash += str(rospy.get_param('robot_file'))
        prehash += str(rospy.get_param('world_file'))
        prehash += str(rospy.get_param('map_file'))
        prehash += str(rospy.get_param('plan_file'))
        for i in range(0, self.n_segments):
            prehash += str(self.segments_metadata[i].initial_point.x)
            prehash += str(self.segments_metadata[i].initial_point.y)
            prehash += str(self.segments_metadata[i].end_point.x)
            prehash += str(self.segments_metadata[i].end_point.y)
        return hashlib.md5(prehash.encode()).hexdigest()


    def get_msg(self, plan_file, timeout_factor):
        msg = SimulationMsg()
        msg.global_simulation_results = self.get_global_simulation_results_msg()
        msg.metadata = self.get_simulation_metadata_msg(plan_file, timeout_factor)
        msg.global_segments_results = self.get_global_segment_results_msgs_list()
        msg.individual_iterations_results = self.get_individual_iterations_results_msgs_list()
        return msg

    def start(self, segment_index, iteration_index):
        self.iterations_results[iteration_index].start(segment_index)

    def stop(self, segment_index, iteration_index, failure):
        self.iterations_results[iteration_index].stop(segment_index, failure)
