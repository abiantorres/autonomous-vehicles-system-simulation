#!/bin/bash
./sh/gazebo.sh $1 &
sleep 5
./sh/rviz_mapping.sh &
sleep 5
./sh/gmapping_slam.sh &
sleep 5
xterm -e ./sh/teleop.sh &
