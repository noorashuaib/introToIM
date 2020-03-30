// integers explained later
int previous = 100;
float x;
float y;
float prevSquareSize;
float squareSize;


void setup() {
  size(500, 500);
  background(255);
  // I am using println to make it easier to see the coordinates and determine the size of my squares
  println("here is my mouseX: " + mouseX + " here is my mouseY: " + mouseY);
  /* I am using this next bit of code (the references include the website that helped me write it) which creates a grid of squares. I used the variable previous to create
   the grid since it makes shortens the code as I don't have to type the coordinates for each grid box. */
  for (int x = 0; x < width; x+=100) {
    for (int y = 0; y < height; y+=100) { 
      stroke(0);
      rect(x, y, previous+100, previous-1);
    }
  }
}

void miniSquarePattern() {
  // the squareSize will be used to determine the size of the biggest square in each grid box
  squareSize = random(10, 90);
  x += 10;
  y += 10;
  prevSquareSize = squareSize;
  square(x, y, squareSize);
  // this next bit of code makes sure that the next square is smaller than the first, but not so small that the square size becomes a negative integer
  squareSize = prevSquareSize - 20;
  println("squareSize: " + squareSize );
  if (squareSize < 10) {
    noLoop();
  }
}

/* I faced a few problems with putting a second loop in the first function because I needed to keep squareSize = random(10, 90); in the pattern but I didn't want to 
 include it in the subsequent loops, and my code wasn't working when I repeated the part of the code after x += 10 in miniSquarePattern, so I just made another function,
 but I need to figure out why it didn't work when I put it in my first loop. */

void miniSquarePatternTwo() {
  x += 10;
  y += 10;
  prevSquareSize = squareSize;
  square(x, y, squareSize);
  squareSize = prevSquareSize - 20;
  println("squareSize: " + squareSize );
  if (squareSize < 10) {
    noLoop();
  }
}

/* this function compiles all the square pattern functions that need to be in each grid box to give each one a random number and placement of mini squares */
void perGridBox() {
  x = 0;
  y = 0;
  miniSquarePattern();
  miniSquarePatternTwo();
  miniSquarePatternTwo();
}

void draw() {
  /* I slowed the frame rate to see what was happening clearly. So this is basically translating the code for the grid boxes to each grid box. I'd like to find an easier,
   more concise way to do this. */

  frameRate(3);

  perGridBox();

  pushMatrix();
  translate(100, 0);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(200, 0);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(300, 0);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(400, 0);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(500, 0);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(0, 100);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(0, 200);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(0, 300);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(0, 400);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(0, 500);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(100, 100);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(100, 200);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(100, 300);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(100, 400);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(100, 500);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(200, 100);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(200, 200);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(200, 300);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(200, 400);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(200, 500);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(300, 100);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(300, 200);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(300, 300);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(300, 400);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(300, 500);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(400, 100);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(400, 200);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(400, 300);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(400, 400);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(400, 500);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(500, 100);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(500, 200);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(500, 300);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(500, 400);
  perGridBox();
  popMatrix();

  pushMatrix();
  translate(500, 500);
  perGridBox();
  popMatrix();

  // and that's it for my code!
}


/* 
 Here are a few of my many attempts to figure out the right code to create a random pattern 
 of smaller squares 
 
 References:
 http://www.benhalsall.com/processing-basic-grid-of-random-squares-test-artresearch-artandresearch-animatedgif/
 https://forum.processing.org/two/discussion/9565/how-can-you-make-a-draw-loop-a-specific-amount-of-times
 
 void squarePattern() {
 squareX = random(50);
 squareY = random(50);
 squareSize = random(50);
 square(squareX, squareY, squareSize);
 }
 
 void draw() {
 frameRate(10);
 println("Frame Count: " + frameCount);
 squarePatternThree();
 if (frameCount % 10 == 2) {
 noLoop();
 }
 }
 
 howMany = 0;
 howMany++;
 if (howMany>3) { 
 noLoop();
 }
 */


/* 
 void bigSquarePatternXaxis() {
 translate(100, 0);
 howMany = 0;
 miniSquarePattern();
 if (x > 500) {
 noLoop();
 }
 }
 
 void bigSquarePatternYaxis() {
 translate(0, 100);
 }
 */

/* void squarePatternTwo() {
 pushMatrix();
 scale(0.9);
 // strokeWeight(1);
 squareX = random(50);
 squareY = random(50);
 squareSize = random(50);
 square(squareX, squareY, squareSize);
 squareBX = random(squareX);
 squareBY = random(squareY);
 squareSizeB = random(squareSize);
 square(squareBX, squareBY, squareSize);
 popMatrix();
 }
 */
