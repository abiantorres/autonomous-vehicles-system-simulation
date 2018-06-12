#!/bin/bash
./sh/gazebo.sh $1 &
sleep 3
./sh/move_base_navigation.sh $2 &
sleep 3
./sh/rviz_mapping.sh &
sleep 3
./sh/create_path.sh $3
