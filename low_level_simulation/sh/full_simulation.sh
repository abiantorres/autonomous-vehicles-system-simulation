#!/bin/bash
./sh/gazebo.sh $4 &
sleep 2
./sh/move_base_navigation.sh $5 &
sleep 2
./sh/rviz_navigation.sh &
sleep 2
./sh/load_path.sh $1 $2 $3 $6