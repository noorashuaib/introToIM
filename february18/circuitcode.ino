int pressurePin = A0;
int blueLed = 12;
int yellowLed = 11;
int force;
const int buttonPin = 7;
int buttonState = 0;

void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(blueLed, OUTPUT);
  pinMode(yellowLed, OUTPUT);
  Serial.begin(9600);
}

void loop() {

  force = analogRead(pressurePin);
  Serial.print("force value = ");
  Serial.println(force);

  buttonState = digitalRead(buttonPin);

  if (buttonState == LOW) {
    if (force < 400) {
      digitalWrite(blueLed, LOW);
      digitalWrite(yellowLed, LOW);
    }
    if ((force > 400) && (force <= 800)) {
      digitalWrite(blueLed, HIGH);
      digitalWrite(yellowLed, LOW);
    }

    if (force > 800) {
      digitalWrite(blueLed, LOW);
      digitalWrite(yellowLed, HIGH);
    }
  }

  else {
    if (force < 400) {
      digitalWrite(blueLed, LOW);
      digitalWrite(yellowLed, LOW);
    }
    if ((force > 400) && (force <= 800)) {
      digitalWrite(blueLed, LOW);
      digitalWrite(yellowLed, HIGH);
    }

    if (force > 800) {
      digitalWrite(blueLed, HIGH);
      digitalWrite(yellowLed, LOW);
    }
  }
  delay(100);
}
