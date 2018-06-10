#!/bin/bash
if [ $# -eq 1 ]; then
  roslaunch navigation amcl.launch map_file:=$1
else
  roslaunch navigation amcl.launch
fi
