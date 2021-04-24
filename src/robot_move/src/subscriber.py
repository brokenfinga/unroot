#!/usr/bin/env python3
import rospy
import serial
from std_msgs.msg import String
import time

def subscriberCallBack(data):
    rospy.loginfo(rospy.get_caller_id() + " I recieved --  %s", data.data)  # prints on terminal
#    s = serial.Serial("/dev/ttyUSB0", 9600, timeout=0.5)
    rr = [0x8a, data.data, 0x8E, data.data]
  #  s.write(rr)

def listener():
    rospy.init_node('subscriberNode', anonymous=True)
    rospy.Subscriber("robot_move", String, subscriberCallBack)
    rospy.spin()  # the python file does not exit


if __name__ == '__main__':
    listener()
