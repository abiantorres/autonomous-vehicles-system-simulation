#!/bin/bash
./sh/gazebo.sh $1 &
sleep 5
./sh/move_base_navigation.sh $2 &
sleep 5
./sh/rviz_mapping.sh &
sleep 5
./sh/create_path.sh $3
