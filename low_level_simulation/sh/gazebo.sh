#!/bin/bash
if [ $# -eq 1 ]; then
  roslaunch gazebo_simulation world.launch world_file:=$1
else
  roslaunch gazebo_simulation world.launch
fi
