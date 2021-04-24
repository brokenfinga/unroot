#! /usr/bin/env python3
import rospy 
from std_msgs.msg import String 

rospy.init_node('tutorial')

publisher = rospy.Publisher('/say_hello', String, queue_size=1)
rate = rospy.Rate(3)  # 3hz

while not rospy.is_shutdown():
    publisher.publish('Hey! Welcome to Robot Ignite Academy.')
    rate.sleep()
