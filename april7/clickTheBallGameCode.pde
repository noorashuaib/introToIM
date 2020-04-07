// speed of the pink balls
float XSPEED = 2;
int YSPEED = 3;
// size of the pink balls
int ballSize = 25;
// the coordinates of the pink balls
float ballx, bally;
// radius of the other pink balls
float r = ballSize/2;
// size of the main ball that the player has to click
float mainBallSize;
// these are the coordinates of the main ball
float mainBallx, mainBally;
// initial speed of the main ball
int MAININITIALXSPEED = 2;
int MAININITIALYSPEED = 3;
// radius of the main ball
float mainr;
// gameScreen is used to show different screens at the start, and if you win or lose
int gameScreen = 0;
// this check if the mouse is over the red ball before you click
boolean mouseOnRedBall;
// this count the clicks to make sure the game over screen doesn't come up at the first click
int mouseClicks = 0;




// this class is for the main ball
class MainBall {
  float mainBallSize = 25; 
  float mainBallxSpeed, mainBallySpeed;
  float mainr = mainBallSize/2;
  boolean ballStatus; // this records whether or not the mouse is on the red ball


  MainBall(float mainxpos, float mainypos, boolean ballStatus_) { // creating the ball
    mainBallx = mainxpos;
    mainBally = mainypos;
    mainBallxSpeed = MAININITIALXSPEED;
    mainBallySpeed = MAININITIALYSPEED;
    ballStatus = ballStatus_;
  }

  // to move the main ball
  void updateMainBall() {
    mainBallx += mainBallxSpeed;
    mainBally += mainBallySpeed;
  }

  // to change the direction of the ball when it collides with a wall
  void collideMainBall() {
    if ( (mainBallx<mainr) || (mainBallx>width-mainr)) {
      mainBallxSpeed = -mainBallxSpeed;
    }
    if ( (mainBally<mainr) || (mainBally>height-mainr)) {
      mainBallySpeed = -mainBallySpeed;
    }
  }

  // to create the main ball
  void drawMainBall() {
    fill(237, 29, 14);
    ellipse(mainBallx, mainBally, mainBallSize, mainBallSize);
  }

  // this checks if the mouse is over the red ball, regardless of if you click or not
  boolean mouseOverRedBall(float mouseX, float mouseY) {
    if (mouseX >= (mainBallx - mainr) &&        
      mouseX <= (mainBallx + mainr) &&    
      mouseY >= (mainBally - mainr) &&        
      mouseY <= (mainBally +mainr)) {    
      return true;
    }
    return false;
  }

  // this changes the game screen when the mouse is pressed after starting the game
  // when the mouse is over the red ball and the mouse is clicked, the "you win" screen comes up
  // when the mouse isn't over the red ball and the mouse is clicked, the "game over" screen comes up
  void changeGameScreen() {
    if (mouseClicks >= 1) {
      if (ballStatus == true && (mousePressed)) {
        gameScreen = 3;
      } 
      if (ballStatus == false && mousePressed) {
        gameScreen = 2;
      }
    }
  }
}

// this counts the number of clicks
void mouseClicked() {
  mouseClicks++;
}

// creating the main ball
MainBall mainRedBall = new MainBall(25, 75, false);

// this code is for the randomly moving pink balls
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
    fill(222, 73, 117);
    ellipse(x, y, ballSize, ballSize);
  }
} 

// creating the pink balls
MovingBalls[] manyBallsArray = new MovingBalls[40];

void setup() {
  background(0); 
  size(500, 500);
  smooth();
  // next bit of code for placing the randomly moving pink balls at random coordinates
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
  } else if (gameScreen == 3) {
    gameWonScreen();
  }

  // this checks the functionality of the game, i.e. depending on if you click or not, and where the mouse is
  // what game screen shows up
  mainRedBall.changeGameScreen();

  // this stores information about whether the mouse is over the red ball or not in ballStatus
  if (mousePressed) {
    if (mainRedBall.mouseOverRedBall(mouseX, mouseY)) {
      mainRedBall.ballStatus = true;
    }
  }
}



// this is the starting screen with instructions
void initScreen() {
  background(0);
  textAlign(CENTER);
  text("Click on the red ball to win. Click anywhere to start. Good luck!", height/2, width/2);
}

// if you click the red ball, this screen shows and you win
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
  mainRedBall.updateMainBall();
  mainRedBall.collideMainBall();
  mainRedBall.drawMainBall();
}

// this function calls the functions that create and move the many pink balls
void addOtherBalls() {

  for (int i=0; i < manyBallsArray.length; i++) {

    manyBallsArray[i].update();
    manyBallsArray[i].checkCollisions();
    manyBallsArray[i].drawManyBalls();
  }
}
