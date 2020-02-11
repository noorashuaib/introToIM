const int trigPin = 9;
const int echoPin = 10;
const int blueLight = 4;
const int redLight = 6;
const int pResistor = A0;
int value;

float duration, distance;

void setup() {
  pinMode(pResistor, INPUT);
  pinMode(redLight, OUTPUT);
  pinMode(blueLight, OUTPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);

}

void loop() {
  value = analogRead(pResistor);
  Serial.print("light: ");
  Serial.print(value);

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

  if ((value < 300) && (distance <= 100)) {
    digitalWrite(blueLight, LOW);
    digitalWrite(redLight, HIGH);
  }

  else {
    digitalWrite(blueLight, HIGH);
    digitalWrite(redLight, LOW);
  }

  delay(500);

}
