#!/bin/bash                                                                                                                                                                                 
if [ $# -eq 2 ]; then
	echo "OK"
	roslaunch path_utilities load_path.launch input_file:=$1 simulations:=$2
	exit 1
else
    echo "file name and simulation parameters are needed"
    exit 0
fi