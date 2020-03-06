#include <Servo.h>

Servo servoPaper;
Servo servoRed;
Servo servoBlue;
Servo servoGreen;

/* integers for the buttons */
const int redButton = 7;
const int blueButton = 6;
const int greenButton = 5;
const int redState = 0;
const int blueState = 0;
const int greenState = 0;
const int pos = 0;
/* integers for the potentiometer */
const int potentiometer = 0;
const int val;
const int smallDelay = 15;

void setup() {
  /* servoPaper refers to the servo attached to the canvas, the other
    coloured servos connect to the servos controlling the different
    markers */
  pinMode(redButton, INPUT);
  pinMode(blueButton, INPUT);
  pinMode(greenButton, INPUT);
  servoPaper.attach(9);
  servoRed.attach(12);
  servoBlue.attach(11);
  servoGreen.attach(10);
}

void loop() {

  /* the digitalReads make the markers only move when you press a
    button */
  redState = digitalRead(redButton);
  blueState = digitalRead(blueButton);
  greenState = digitalRead(greenButton);

  /* first, the servo connected to the canvas (paper) is controlled using the potentiometer */

  val = analogRead(potentiometer);
  val = map(val, 0, 1023, 0, 180);
  servoPaper.write(val);
  delay(smallDelay);

  /* These commands are for the servos controlled with push buttons. The if statement within the for loop makes the servo only move when the button is pressed.*/

  for (pos = 0; pos <= 180; pos += 1) {
    if (redState == HIGH) {
      servoRed.write(pos);
      delay(smallDelay);
    }
    else {
      servoRed.write(0);
    }
    if (blueState == HIGH) {
      servoBlue.write(pos);
      delay(smallDelay);
    }
    else {
      servoBlue.write(0);
    }
    if (greenState == HIGH) {
      servoGreen.write(pos);
      delay(smallDelay);
    }
    else {
      servoGreen.write(0);
    }
  }
}
