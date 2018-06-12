#!/bin/bash
./sh/gazebo.sh $1 &
sleep 2
./sh/rviz_mapping.sh &
sleep 2
./sh/gmapping_slam.sh &
sleep 2
xterm -e ./sh/teleop.sh &
