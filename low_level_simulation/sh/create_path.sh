#!/bin/bash                                                                                                                                                                                 
if [ $# -eq 1 ]; then
	if [[ "$1" =~ ^([a-zA-Z0-9_]+)\.(bag)$ ]]; then
		echo "OK"
		roslaunch path_utilities save_path.launch output_file:=$1
	else
	    echo "$1: invalid parameter"
	    exit 0
	fi
else
    roslaunch path_utilities save_path.launch output_file:=path.baf
    exit 1
fi