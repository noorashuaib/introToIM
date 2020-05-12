PImage redMosque;
PImage temple;
int click = 1;
int prevClick;
int newClick;
//boolean clicked;
boolean mouseClicked;

void setup() {
  background(255);
  size(740, 480);

  // for the quiz 
  //  size(600, 400);
  //  buttons = new Button[4];
  //  for ( int i = 0; i < buttons.length; i++) {
  //    buttons[i] = new Button(i);
  //    buttons[i].x = 80 + 120 * i ;
  //  } 
  //  prime_buttons();
}

//void mouseClicked() {
//  clicked = true;
//}

//void mouseReleased() {
//  clicked = false;
//}

void draw() {
  startingScreen();
  println( "x: " + mouseX + " y: " + mouseY);

  // for the quiz
  //background(0);
  //fill(255);
  //text( questions[current_question][4], width/2, 100);
  //for ( int i = 0; i < buttons.length; i++) {
  //  buttons[i].draw();
  //}
}

void clickTheMouse() {
  click = prevClick;
  if (mousePressed) {
    click *= -1;
  }
  click = newClick;

  if (prevClick != newClick) {
    mouseClicked = true;
  }
}
