// for the lines
Rotater[] rotaters;

// for the ball
PVector velocityBall;
PVector gravity;
PVector position;
PVector accelerationBall;
PVector wind;
float drag = 0.99;
float mass = 50;
float hDampening;

void setup() {
  size(640, 360);
  // drops a new ball using PVectors
  noFill();
  position = new PVector(width/2, 0);
  velocityBall = new PVector(0, 0);
  accelerationBall = new PVector(0, 0);
  gravity = new PVector(0, 0.5*mass);
  wind = new PVector(0, 0);
  hDampening=map(mass, 15, 80, .98, .96);
  // creates 200 lines randomly placed
  rotaters = new Rotater[200];
  for (int i=0; i< rotaters.length; i++) {
    float x = random(width);
    float y = random(height);
    float lineDistance = random(20, 50);
    //initiate with i for index
    rotaters[i]= new Rotater(x, y, i, lineDistance);
  }
}

void draw() {
  background(255);
  // calls the functions that make the lines react to the mouse and the ball
  stroke(18, 18, 139, 75);
  for (Rotater r : rotaters) {
    r.rotate();
    r.distance(rotaters);
    r.moveToMouse(rotaters);
    r.checkBall();
  }
  // reduces the speed of the ball if no keys are pressed
  if (!keyPressed) {
    wind.x=0;
    velocityBall.x*=hDampening;
  }
  // otherwise makes the ball move by calling applyForce using the force PVector
  applyForce(wind);
  applyForce(gravity);
  // adds acceleration to the ball's motion
  velocityBall.add(accelerationBall);
  velocityBall.mult(drag);
  position.add(velocityBall);
  accelerationBall.mult(0);
  // draws the ball
  ellipse(position.x, position.y, mass, mass);
  if (position.y > height-mass/2) {
    velocityBall.y *= -0.9;  // A little dampening when hitting the bottom
    position.y = height-mass/2;
  }
}

void applyForce(PVector force) {
  // Newton's 2nd law: F = M * A
  // or A = F / M
  PVector f = PVector.div(force, mass);
  accelerationBall.add(f);
}

// accelerates the ball using the PVector wind when a key is pressed
void keyPressed() {
  if (keyCode==LEFT) {
    wind.x=-1;
  }
  if (keyCode==RIGHT) {
    wind.x=1;
  }
  if (key==' ') {
    mass=random(15, 80);
    position.y=-mass;
    velocityBall.mult(0);
  }
}

// this class contains all the information for the randomly drawn lines
class Rotater {
  float centerX, centerY, x, y, angle, radius, speed, lineDistance, acceleration, direction;
  // index makes sure that the line isn't refering to itself when doing the function
  int index;
  // constructor
  Rotater(float _x, float _y, int i, float ld) {
    centerX= _x;
    centerY=_y;
    x=y=angle=0;
    radius=random(30, 75);
    speed = 0;
    index = i;
    lineDistance = ld;
    acceleration=0;
    //each rotater has a direction, make a coin flip initially to determine dir.
    direction=-1;
    float coinflip = random(1);
    if (coinflip>.5)
      direction=1;
  }

  void rotate() {
    x = cos(angle)*radius+centerX;
    y = sin(angle)*radius+centerY;
    speed+=acceleration;
    angle+=speed*direction;
    speed*=.98;
    acceleration=0;
  }

  void distance(Rotater[] rotaters) {
    //check the mouse, if close enough add some acceleration
    checkMouse();
    //check distance with all rotaters, if close enough draw line
    for (Rotater r : rotaters) {
      if (r.index != index) {
        if (dist(x, y, r.x, r.y)<lineDistance) {
          line(x, y, r.x, r.y);
        }
      }
    }
  }

  //if mouse is close enough give some acceleration
  void checkMouse() {
    if (dist(position.x, position.y, x, y)<100) {
      acceleration=.002;
    }
  }

  // if the ball is close enough, give some acceleration
  void checkBall() {
    if (dist(mouseX, mouseY, x, y)<100 && mouseX!=pmouseX && mouseY!=pmouseY) {
      acceleration=.002;
    }
  }

  void moveToMouse(Rotater[] rotaters) {
    // makes the rotaters condense around the mouse if it is close enough
    checkMouse();
    for (Rotater r : rotaters) {
      if (dist(r.x, r.y, mouseX, mouseY)<lineDistance) {
        line(r.x, r.y, mouseX, mouseY);
      }
      // draws red lines connecting to the rotaters that are close to the ball
      if (dist(r.x, r.y, position.x, position.y)<lineDistance) {
        pushStyle();
        strokeWeight(0.2);
        stroke(255, 0, 0, 75);
        line(r.x, r.y, position.x, position.y);
        popStyle();
      }
    }
  }
}
