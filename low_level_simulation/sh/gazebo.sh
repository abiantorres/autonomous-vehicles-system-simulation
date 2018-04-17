#!/bin/bash

sudo killall gzserver
sudo killall gzclient
sudo killall rviz
sudo killall roscore
sudo killall rosmaster

roslaunch gazebo_simulation world.launch
rosservice call gazebo/pause_physics