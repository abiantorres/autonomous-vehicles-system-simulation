#!/bin/bash
roslaunch path_utilities load_path.launch plan_file:=$1 n_iterations:=$2 distance_between_obstacles:=$3 timeout_factor:=$4
