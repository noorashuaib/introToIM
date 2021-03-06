#include "pitches.h"
#include <Servo.h>

Servo myservo;

const int trigPin = 9;
const int echoPin = 10;
const int speakerPin = 7;
int pos = 0;

float duration, distance;

void setup() {
  myservo.attach(5);
  pinMode(speakerPin, OUTPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);

  /* random motion for the servo motor to appear to stir the spoon */

  for (pos = 0; pos <= 180; pos += 5) {
    myservo.write(pos);
    delay(15);
  }
  for (pos = 0; pos <= 180; pos += 5) {
    myservo.write(pos);
    delay(15);
  }
  for (pos = 0; pos <= 180; pos += 5) {
    myservo.write(pos);
    delay(15);
  }
  for (pos = 0; pos <= 180; pos += 5) {
    myservo.write(pos);
    delay(15);
  }
  for (pos = 0; pos <= 180; pos += 5) {
    myservo.write(pos);
    delay(15);
  }
  for (pos = 180; pos >= 0; pos -= 1) {
    myservo.write(pos);
    delay(15);
  }
}

void loop() {

  /* using the ultrasonic detector to find the distance of the object */

  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  distance = (duration * .0343) / 2;
  Serial.print(" Distance: ");
  Serial.println(distance);
  delay(100);

  /* I then mapped the distance I was receiving from the serial
      monitor to a range of frequencies for the piezo buzzer to emit
      so that the further the object, the higher the pitch. I had to
      constrain both the distance and the pitch to avoid inaudible
      pitches and to avoid detecting distances that were too far away */

  int notePitch = map(distance, 0, 30, 120, 3000);
  notePitch = constrain(notePitch, 120, 3000);
  distance = constrain(distance, 0, 30);
  Serial.print("Pitch: ");
  Serial.println(notePitch);
  delay(100);
  tone(speakerPin, notePitch, 100);
  delay(1);

}

