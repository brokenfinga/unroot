#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
import serial


# Set the GPIO modes


_FREQUENCY = 20

QIK_MOTOR_M0_FORWARD        =0x88
QIK_MOTOR_M0_FORWARD_8_BIT  =0x89
QIK_MOTOR_M0_REVERSE        =0x8A
QIK_MOTOR_M0_REVERSE_8_BIT  =0x8B
QIK_MOTOR_M1_FORWARD        =0x8C
QIK_MOTOR_M1_FORWARD_8_BIT  =0x8D
QIK_MOTOR_M1_REVERSE        =0x8E
QIK_MOTOR_M1_REVERSE_8_BIT  =0x8F

def _clip(value, minimum, maximum):
    """Ensure value is between minimum and maximum."""

    if value < minimum:
        return minimum
    elif value > maximum:
        return maximum
    return value

class Qik:
    def __init__(self):
        self.s = serial.Serial("/dev/ttyUSB0", 9600, timeout=0.5)
        self.s.write(0xAA)

    def setM0Speed(self, speed):
        cmd=[0,0]
        reverse = 0
        if (speed < 0):
            speed = -speed # make speed a positive quantity
            reverse = 1 # preserve the direction
        if (speed > 255):
            speed = 255
            
        if (speed > 127):
        #8-bit mode: actual speed is (speed + 128)
            if(reverse):
                cmd[0] = QIK_MOTOR_M0_REVERSE_8_BIT
            else:
                cmd[0] = QIK_MOTOR_M0_FORWARD_8_BIT
            cmd[1] = speed - 128
        else:
            if(reverse):
                cmd[0] = QIK_MOTOR_M0_REVERSE
            else:
                cmd[0] = QIK_MOTOR_M0_FORWARD
            cmd[1] = speed
        self.s.write(cmd)
        #print("motor0: "+str(cmd[0])+" speed0: "+str(cmd[1]))



    def setM1Speed(self, speed):
        cmd=[0,0]
        reverse = 0
        if (speed < 0):
            speed = -speed # make speed a positive quantity
            reverse = 1 # preserve the direction
        if (speed > 255):
            speed = 255

        if (speed > 127):
        #8-bit mode: actual speed is (speed + 128)
            if(reverse):
                cmd[0] = QIK_MOTOR_M1_REVERSE_8_BIT
            else:
                cmd[0] = QIK_MOTOR_M1_FORWARD_8_BIT
            cmd[1] = speed - 128
        else:
            if(reverse):
                cmd[0] = QIK_MOTOR_M1_REVERSE
            else:
                cmd[0] = QIK_MOTOR_M1_FORWARD
            cmd[1] = speed

        self.s.write(cmd)
        #print("motor1: "+str(cmd[0])+" speed1: "+str(cmd[1]))


    def setSpeed(self, m0speed, m1Speed):
        self.setM0Speed(m0Speed)
        self.setM1Speed(m1Speed)

    def setM0Brake(self):
        self.s.write(QIK_2S12V10_MOTOR_M0_BRAKE)

    def setM1Brake(self):
        self.s.write(QIK_2S12V10_MOTOR_M1_BRAKE)


class Motor:
    def __init__(self, mot_number):
        self.mot_num = mot_number
        self.mot_pkg = Qik()
        self.prev_speed =0
        #GPIO.setup(forward_pin, GPIO.OUT)
        #GPIO.setup(backward_pin, GPIO.OUT)
    
    def move(self, speed_percent):
        #speed = _clip(abs(speed_percent), 0, 100)
        speed = speed_percent
        if(self.mot_num == 0):
            self.mot_pkg.setM0Speed(int(speed))
        else:
            self.mot_pkg.setM1Speed(int(speed))
        if (speed != self.prev_speed):
            rospy.loginfo("motor"+ str(self.mot_num) + ": " +str(speed))
            self.prev_speed = speed
        # Positive speeds move wheels forward, negative speeds
        # move wheels backward

class Driver:
    def __init__(self):
        rospy.init_node('driver')

        self._last_received = rospy.get_time()
        self._timeout = rospy.get_param('~timeout', 0.5)
        self._rate = rospy.get_param('~rate', 10)
        self._max_speed = rospy.get_param('~max_speed', 0.5)
        self._wheel_base = rospy.get_param('~wheel_base', 0.091)

        # Assign pins to motors. These may be distributed
        # differently depending on how you've built your robot
        self._left_motor = Motor(0)
        self._right_motor = Motor(1)
        self._left_speed_percent = 0
        self._right_speed_percent = 0

        # Setup subscriber for velocity twist message
        rospy.Subscriber('cmd_vel', Twist, self.velocity_received_callback)

    def velocity_received_callback(self, message):
        """Handle new velocity command message."""

        self._last_received = rospy.get_time()

        # Extract linear and angular velocities from the message
        linear = message.linear.x
        angular = message.angular.z

        # Calculate wheel speeds in m/s
        left_speed = linear - angular*self._wheel_base/2
        right_speed = linear + angular*self._wheel_base/2

        # Ideally we'd now use the desired wheel speeds along
        # with data from wheel speed sensors to come up with the
        # power we need to apply to the wheels, but we don't have
        # wheel speed sensors. Instead, we'll simply convert m/s
        # into percent of maximum wheel speed, which gives us a
        # duty cycle that we can apply to each motor.
        self._left_speed_percent = (
            100 * left_speed/self._max_speed)
        self._right_speed_percent = (
            100 * right_speed/self._max_speed)

    def run(self):
        """The control loop of the driver."""

        rate = rospy.Rate(self._rate)

        while not rospy.is_shutdown():
            # If we haven't received new commands for a while, we
            # may have lost contact with the commander-- stop
            # moving
            delay = rospy.get_time() - self._last_received
            if delay < self._timeout:
                self._left_motor.move(self._left_speed_percent)
                self._right_motor.move(self._right_speed_percent)
            else:
                self._left_motor.move(0)
                self._right_motor.move(0)
            rate.sleep()


def main():
    driver = Driver()

    # Run driver. This will block
    driver.run()


if __name__ == '__main__':
    main()
