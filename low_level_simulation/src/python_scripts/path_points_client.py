#! /usr/bin/env python

import rospy
import actionlib
from actionlib_msgs.msg import GoalStatusArray
"""
GoalStatusArray message format:

header:
  seq: 0
  stamp:
    secs: 0
    nsecs: 0
  frame_id: ''
status_list:
- goal_id:
    stamp:
      secs: 0 <-- We need to known at what time occurred the event.
      nsecs: 0
    id: ''
  status: 0 <-- We need to known the status.
  text: ''"
"""
#from nav_msgs.msg import Odometry

class TrayectoryPoint():
	def __init__(self, start_sec, end_sec):
		self.start_sec = start_sec
		self.end_sec = end_sec
		self.elapsed_time = self.end_sec - self.start_sec


start_sec = 0
started = False
goals = []

"""
def callback_ddometry(msg):
	print(msg)
"""

def callback_goal_status(msg, started):
	if msg != None:
		if msg.status_list[0].status and started == False:
			started = True
			start_sec = msg.status_list[0].goal_id.stamp.secs
		else:
			started = False
			goals.append(TrayectoryPoint(msg.status_list[0].goal_id.stamp.secs - start_sec))
			print (goals)



rospy.init_node("time_points_client")

#odom_sub = rospy.Subscriber('/odom', Odometry, callback_odom)
goal_status_sub = rospy.Subscriber('/move_base/status', GoalStatusArray, callback_goal_status, started)

rospy.spin()