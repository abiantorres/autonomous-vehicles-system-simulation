#!/bin/bash

# connect from java to ws://localhost:9090
# info: https://wiki.eecs.berkeley.edu/accessors/ROS/ConnectingROSToAnExternalProgram?from=Main.ConnectingROSToAnExternalProgram

roslaunch rosbridge_server rosbridge_websocket.launch 