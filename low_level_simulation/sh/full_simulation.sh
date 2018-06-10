#!/bin/bash
./../../../sh/gazebo.sh $4 &
sleep 2
./../../../sh/move_base_navigation.sh $5 &
sleep 2
./../../../sh/rviz_navigation.sh &
sleep 2
if [ $# -eq 5 ]; then
	./../../../sh/load_path.sh $1 $2 $3
	exit 1
else
    echo "file name and simulation parameters are needed"
    exit 0
fi
