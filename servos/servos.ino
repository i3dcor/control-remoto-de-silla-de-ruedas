#include <Servo.h>

Servo myservo1;  // create servo object to control a servo
Servo myservo2;
int potpin1 = A0;  // analog pin used to connect the potentiometer
int potpin2 = A1;
int val;    // variable to read the value from the analog pin

void setup() {
  myservo1.attach(9);
  myservo2.attach(8);// attaches the servo on pin 9 to the servo object
}

void loop() {
  val = analogRead(float(potpin1));            // reads the value of the potentiometer (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  myservo1.write(val);                  // sets the servo position according to the scaled value
  delay(15); // waits for the servo to get there

  val = analogRead(float(potpin2));            // reads the value of the potentiometer (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  myservo2.write(val);                  // sets the servo position according to the scaled value
  delay(15);

}
