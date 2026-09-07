import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
for pin in [5, 6, 12, 19, 26, 13, 23, 24]:
    GPIO.setup(pin, GPIO.OUT if pin != 24 else GPIO.IN)

def rotate_scan():
    GPIO.output(5, GPIO.HIGH)   # left motor forward
    GPIO.output(6, GPIO.LOW)
    GPIO.output(19, GPIO.LOW)   # right motor reverse (in place rotation)
    GPIO.output(26, GPIO.HIGH)
    pwm_a = GPIO.PWM(12, 1000)
    pwm_b = GPIO.PWM(13, 1000)
    pwm_a.start(40)
    pwm_b.start(40)
    time.sleep(0.5)
    pwm_a.stop()
    pwm_b.stop()
