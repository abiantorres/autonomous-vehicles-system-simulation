#!/bin/bash
roscore &
sleep 5
./sh/gazebo.sh $4 &
sleep 5
./sh/move_base_navigation.sh $5 &
sleep 5
./sh/rviz_navigation.sh &
sleep 5
./sh/load_path.sh $1 $2 $3 $6
