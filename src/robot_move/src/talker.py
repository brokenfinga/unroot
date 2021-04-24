#!/usr/bin/env python3

import rospy
from std_msgs.msg import Float64

def publishMethod():
    pub = rospy.Publisher('robot_move', Float64, queue_size=10) # defining the publisher by topic, message type
    rospy.init_node('publish_node', anonymous=True) # defining the ros node - publish node 
    rate = rospy.Rate(2) # 10hz # fequency at which the publishing occurs
    while not rospy.is_shutdown():
        publishString = 0xf7 # varibale 
        rospy.loginfo("Data is being sent")  # to print on the terminal 
        pub.publish(publishString) # publishing 
        rate.sleep()

if __name__ == '__main__':
    try:
        publishMethod()
    except rospy.ROSInterruptException: 
        pass
