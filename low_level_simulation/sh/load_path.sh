#!/bin/bash                                                                                                                                                                                 
if [ $# -eq 1 ]; then
	echo "OK"
	roslaunch path_utilities load_path.launch input_file:=$1
	exit 1
else
    echo "file name parameter is needed"
    exit 0
fi