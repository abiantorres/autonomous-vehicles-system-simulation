#!/bin/bash
if [ $# -eq 3 ]; then
	roslaunch path_utilities load_path.launch plan_file:=$1 n_iterations:=$2 distance_between_obstacles:=$3
	exit 1
else
    echo "file name and simulation parameters are needed"
    exit 0
fi
