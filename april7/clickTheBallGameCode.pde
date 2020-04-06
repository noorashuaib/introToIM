// speed of the white circles
float XSPEED = 0.5;
int YSPEED = 1;
// size of the coloured ball
int mainBallSize = 15;
// size of the other circles
int ballSize = 15;
// speed of the coloured ball that the player has to click
float xSpeedMainBall = 0.5;
int ySpeedMainBall = 1;
//the coordinates of the coloured ball 
float mainBallx, mainBally;
// the coordinates of the other circles
float ballx, bally;
// radius of the other white circles
float r = ballSize/2;
// radius of the main ball
float mainr;
// prevBallSize remembers the size of the coloured ball, so that it can become smaller each time you click it
int prevBallSize;
// gameScreen is used to show different screens at the start, and if you win or lose
int gameScreen = 0;

// this code is for the randomly moving white circles
class MovingBalls {
  float x, y, xSpeed, ySpeed;
  MovingBalls(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    ballx = 10;
    bally = 50;
    xSpeed = XSPEED;
    ySpeed = YSPEED;
  }

  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  void checkCollisions() {
    if ( (x<r) || (x>width-r)) {
      xSpeed = -xSpeed;
    }
    if ( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed;
    }
  }

  void drawManyBalls() {
    fill(255);
    ellipse(x, y, ballSize, ballSize);
  }
} 

MovingBalls[] manyBallsArray = new MovingBalls[20];

void setup() {
  background(0);
  size(500, 500);
  smooth();
  // next bit of code for randomly moving circles
  for (int i=0; i < manyBallsArray.length; i++) {
    manyBallsArray[i] = new MovingBalls(random(ballSize, width-ballSize), 
      random(ballSize, height-ballSize));
  }
  // starts the main ball at these coordinates
  mainBallx = 50;
  mainBally = 50;
}

void draw() {
  // these are the different game screens depending on when you start the game, and if 
  // you win or lose
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  } else if (gameScreen ==3) {
    gameWonScreen();
  }
}

// this is the starting screen with instructions
void initScreen() {
  background(0);
  textAlign(CENTER);
  text("Click on the coloured ball 3 times to win. Click anywhere to start. Good luck!", height/2, width/2);
}

// if you click the red ball 3 times, this screen shows and you win
void gameWonScreen() {
  background(0);
  textAlign(CENTER);
  text("CONGRATULATIONS, YOU WIN!", height/2, width/2);
}

// if you click anywhere but the red ball during the game, this screen shows and you lose
void gameOverScreen() {
  background(0);
  textAlign(CENTER);
  text("GAME OVER", height/2, width/2);
}

// this starts the game when you first click
void mousePressed() {
  if (gameScreen==0) {
    startGame();
  }
}

void startGame() {
  gameScreen=1;
}

// this has the functions of the game itself such as actually drawing the balls, moving
// them and adding the clicking function of the game
void gameScreen() {
  background(0);
  addOtherBalls();
  drawTheMainBall();
  moveMainBall();
  clickTheBall();
}

// for the creation and movement of the many white circles
void addOtherBalls() {

  for (int i=0; i < manyBallsArray.length; i++) {

    manyBallsArray[i].update();
    manyBallsArray[i].checkCollisions();
    manyBallsArray[i].drawManyBalls();
  }
}

// for the movement of the main ball
void moveMainBall() {

  mainBallx = mainBallx + xSpeedMainBall;
  mainBally = mainBally + ySpeedMainBall;

  int mainr = mainBallSize/2;
  if ( (mainBallx<mainr) || (mainBallx>width-mainr)) {
    xSpeedMainBall = -xSpeedMainBall;
  }
  if ( (mainBally<mainr) || (mainBally>height-mainr)) {
    ySpeedMainBall = -ySpeedMainBall;
  }
}

// to make the main ball
void drawTheMainBall() {
  fill(237, 29, 14);
  ellipse(15, 15, mainBallSize, mainBallSize);
} 

/* this is the main functionality of the game. When you click on the red ball, it 
 decreases in size each time to make the game harder. Once you click on the red ball 3 
 times, you win. If you click anywhere outside of the red ball, you lose. My problem 
 with the code here is that for some reason, when this part of the code runs, the 
 main ball (the red ball) doesn't show up. When I exclude this function, the ball
 shows up, so I'm guessing there's a problem with this part of the code. 
 But this part of the code is essential because I need to figure out how to get the 
 main ball to get smaller each time it's clicked. I also wanted to know how to make 
 the 'gameOverScreen' show up if you click anywhere outsidethe red ball. So where 
 would I have to add the else statement to do that? */
void clickTheBall() {
  mainBallSize = prevBallSize;
  if (((mouseX > (mainBallx - mainr)) && (mouseX < mainBallx)) || ((mouseX < (mainBallx + mainr)) && (mouseX > mainBallx))) {
    if (((mouseY > (mainBally - mainr)) && (mouseY < mainBally)) || ((mouseY < (mainBally + mainr)) && (mouseY > mainBally))) {
      if (mousePressed == true) {
        mainBallSize = prevBallSize - 2;
      }
      if (mainBallSize <= 9) {
        gameWonScreen();
      }
    }
  }
}

// ATTEMPT 2

// speed of the white balls
float XSPEED = 0.5;
int YSPEED = 1;
// size of the white balls
int ballSize = 15;
// the coordinates of the white balls
float ballx, bally;
// radius of the other white balls
float r = ballSize/2;
// size of the main ball that the player has to click
int mainBallSize = 15;
// initial speed of the main ball
float MAININITIALXSPEED = 0.5;
int MAININITIALYSPEED = 1;
//the coordinates of the main ball 
float mainBallx, mainBally, mainBallxSpeed, mainBallySpeed;
// radius of the main ball
float mainr;
// prevBallSize remembers the size of the main ball, so that it can become smaller each time you click it
int prevBallSize;
// gameScreen is used to show different screens at the start, and if you win or lose
int gameScreen = 0;

// for the movement of the main ball
void moveMainBall() {
  // to move the main ball
  mainBallx += mainBallxSpeed;
  mainBally += mainBallySpeed;

  int mainr = mainBallSize/2;
  if ( (mainBallx<mainr) || (mainBallx>width-mainr)) {
    mainBallxSpeed = -mainBallxSpeed;
  }
  if ( (mainBally<mainr) || (mainBally>height-mainr)) {
    mainBallySpeed = -mainBallySpeed;
  }
  fill(237, 29, 14);
  ellipse(mainBallx, mainBally, mainBallSize, mainBallSize);
}

// to make the main ball
void drawTheMainBall() {
  float mainBallx = 20;
  float mainBally = 20;
  fill(237, 29, 14);
  ellipse(mainBallx, mainBally, mainBallSize, mainBallSize);
  moveMainBall();
} 


// this code is for the randomly moving white circles
class MovingBalls {
  float x, y, xSpeed, ySpeed;
  MovingBalls(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    ballx = 10;
    bally = 50;
    xSpeed = XSPEED;
    ySpeed = YSPEED;
  }

  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  void checkCollisions() {
    if ( (x<r) || (x>width-r)) {
      xSpeed = -xSpeed;
    }
    if ( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed;
    }
  }

  void drawManyBalls() {
    fill(255);
    ellipse(x, y, ballSize, ballSize);
  }
} 

MovingBalls[] manyBallsArray = new MovingBalls[20];

void setup() {
  background(0);
  size(500, 500);
  smooth();
  // for the main ball
  mainBallx = 10;
  mainBally = 50;
  mainBallxSpeed = MAININITIALXSPEED;
  mainBallySpeed = MAININITIALYSPEED;
  // next bit of code for randomly moving circles
  for (int i=0; i < manyBallsArray.length; i++) {
    manyBallsArray[i] = new MovingBalls(random(ballSize, width-ballSize), 
      random(ballSize, height-ballSize));
  }
}

void draw() {
  // these are the different game screens depending on when you start the game, and if 
  // you win or lose
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  } else if (gameScreen ==3) {
    gameWonScreen();
  }
}


// this is the starting screen with instructions
void initScreen() {
  background(0);
  textAlign(CENTER);
  text("Click on the coloured ball 3 times to win. Click anywhere to start. Good luck!", height/2, width/2);
}

// if you click the red ball 3 times, this screen shows and you win
void gameWonScreen() {
  background(0);
  textAlign(CENTER);
  text("CONGRATULATIONS, YOU WIN!", height/2, width/2);
}

// if you click anywhere but the red ball during the game, this screen shows and you lose
void gameOverScreen() {
  background(0);
  textAlign(CENTER);
  text("GAME OVER", height/2, width/2);
}

// this starts the game when you first click
void mousePressed() {
  if (gameScreen==0) {
    startGame();
  }
}

void startGame() {
  gameScreen=1;
}

// this has the functions of the game itself such as actually drawing the balls, moving
// them and adding the clicking function of the game
void gameScreen() {
  background(0);
  // starts the main ball at these coordinates
  addOtherBalls();
  moveMainBall();
  clickTheBall();
}

// for the creation and movement of the many white circles
void addOtherBalls() {

  for (int i=0; i < manyBallsArray.length; i++) {

    manyBallsArray[i].update();
    manyBallsArray[i].checkCollisions();
    manyBallsArray[i].drawManyBalls();
  }
}


/* this is the main functionality of the game. When you click on the red ball, it 
 decreases in size each time to make the game harder. Once you click on the red ball 3 
 times, you win. If you click anywhere outside of the red ball, you lose. My problem 
 with the code here is that for some reason, when this part of the code runs, the 
 main ball (the red ball) doesn't show up. When I exclude this function, the ball
 shows up, so I'm guessing there's a problem with this part of the code. 
 But this part of the code is essential because I need to figure out how to get the 
 main ball to get smaller each time it's clicked. I also wanted to know how to make 
 the 'gameOverScreen' show up if you click anywhere outsidethe red ball. So where 
 would I have to add the else statement to do that? */
void clickTheBall() {
  if (mousePressed == true) {
    if (((mouseX > (mainBallx - mainr)) && (mouseX < mainBallx)) || ((mouseX < (mainBallx + mainr)) && (mouseX > mainBallx))) {
      if (((mouseY > (mainBally - mainr)) && (mouseY < mainBally)) || ((mouseY < (mainBally + mainr)) && (mouseY > mainBally))) {
        mainBallSize = prevBallSize;
        mainBallSize = prevBallSize - 2;
      }
      if (mainBallSize <= 9) {
        gameWonScreen();
      }
    }
  }
}
