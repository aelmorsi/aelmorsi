#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>

Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver(0x40);

#define SERVOMIN  102   // pulse length for 0 degrees, tune per servo
#define SERVOMAX  512   // pulse length for 180 degrees, tune per servo

int baseCh = 0, shoulderCh = 1, elbowCh = 2, wristRotCh = 3, wristTiltCh = 4, gripperCh = 5;

void setup() {
  pwm.begin();
  pwm.setPWMFreq(50); // standard analog servo frequency
  delay(10);
  moveTo(baseCh, 90);
  moveTo(shoulderCh, 90);
  moveTo(elbowCh, 90);
  moveTo(wristRotCh, 90);
  moveTo(wristTiltCh, 90);
  moveTo(gripperCh, 30); // gripper open
}

void moveTo(int channel, int angle) {
  int pulse = map(angle, 0, 180, SERVOMIN, SERVOMAX);
  pwm.setPWM(channel, 0, pulse);
}

void pickAndPlace() {
  moveTo(shoulderCh, 60);
  moveTo(elbowCh, 120);
  delay(800);
  moveTo(gripperCh, 80);   // close gripper
  delay(500);
  moveTo(shoulderCh, 90);
  moveTo(elbowCh, 90);
  moveTo(baseCh, 150);     // rotate to drop-off point
  delay(800);
  moveTo(gripperCh, 30);   // open gripper, release object
  delay(500);
  moveTo(baseCh, 90);      // return to start
}

void loop() {
  pickAndPlace();
  delay(3000);
}
