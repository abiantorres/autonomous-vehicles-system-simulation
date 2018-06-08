#!/usr/bin/env python

import rospy
from simulation_util import SimulationExecutor

if __name__ == '__main__':
    rospy.init_node('load_path')
    simulation_executor = SimulationExecutor()
    simulation_executor.start()
