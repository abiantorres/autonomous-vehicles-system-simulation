#! /usr/bin/env morseexec

""" Basic MORSE simulation scene for <nav_tutorial> environment

Feel free to edit this template as you like!
"""

from morse.builder import *

# A PR2 robot to the scene
robot = BasePR2()
robot.add_interface('ros') # Publicamos el árbol completo
robot.translate(x=2.5, y=3.2, z=0.0)

# An odometry sensor to get odometry information
odometry = Odometry()
robot.append(odometry)
odometry.add_interface('ros', topic="/odom")

# Añadir el sensor láser Hokuyo
scan = Hokuyo()
scan.translate(x=0.275, z=0.252)
robot.append(scan)
scan.properties(Visible_arc = False)
scan.properties(laser_range = 30.0)
scan.properties(resolution = 1.0)
scan.properties(scan_window = 180.0)
scan.create_laser_arc()
scan.add_interface('ros', topic='/base_scan')

# Añadimos un actuador que permita modificar la posición del robot.
motion = MotionXYW()
motion.properties(ControlType = 'Position')
robot.append(motion)
motion.add_interface('ros', topic='/cmd_vel')

# Keyboard control
keyboard = Keyboard()
robot.append(keyboard)

# Set the environment
env = Environment('tum_kitchen/tum_kitchen')
env.set_camera_rotation([1.0470, 0, 0.7854])
