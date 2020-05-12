// FINAL PROJECT TAB

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

// STARTING SCREEN

PImage sriLankaMap;
PImage quizClipArt;
PImage sriLankanFlag;
PFont timesFont;
float r;

void startingScreen() {
  background(255);
  r = 7.5;
  // set up for starting screen
  // draws a line between the map and the text
  stroke(0);
  line((width/2) - 1, 0, (width/2) - 1, height);
  sriLankaMap = loadImage("sriLankaMap.jpg");
  quizClipArt = loadImage("quizClipArt.jpg");
  sriLankanFlag = loadImage("sriLankanFlag.jpg");
  // drawing starting screen
  image(sriLankaMap, width/2, 0, width/2, height);
  println( "x: " + mouseX + " y: " + mouseY);
  image(quizClipArt, 290, 430, 75, 50);
  image(sriLankanFlag, 110, 20, 150, 85);
  textAlign(CENTER);
  timesFont = loadFont("Times-Roman-48.vlw");
  textFont(timesFont, 22);
  fill(40);
  text("\nWelcome to Sri Lanka,"+
    "\nThe pearl of the Indian Ocean!"+
    "\nSri Lanka is an island of great beauty,"+
    "\nNot just natural, but local and traditional"+
    "\nas well. Explore the gems of the island  "+
    "\nfrom your very home with the virtual "+
    "\ntour of Sri Lanka. Don't forget to "+
    "\ninteract with each site and take the quiz "+
    "\nat the end of your tour!", 185, 140);

  // drawing the circle markers

  // elephant orphanage
  fill(16, 48, 176);
  ellipse(500, 310, 15, 15);

  //waterfall
  fill(16, 48, 176);
  ellipse(535, 340, 15, 15);

  //beach
  fill(16, 48, 176);
  ellipse(520, 455, 15, 15);

  //train
  fill(16, 48, 176);
  ellipse(555, 140, 15, 15);

  if ((dist(mouseX, mouseY, 500, 310) < r) && mousePressed) {
    waterfallScreen();
    noLoop();
  }

  if ((dist(mouseX, mouseY, 535, 340) < r) && mousePressed) {
    waterfallScreen();
    noLoop();
  }

  if ((dist(mouseX, mouseY, 520, 455) < r) && mousePressed) {
    beachScreen();
    noLoop();
  }

  if ((dist(mouseX, mouseY, 555, 140) < r) && (mouseClicked = true)) {
    trainScreen();
    //noLoop();
  }
}

// HOME ICON TAB

class HomeIcon {
  float homeWidth = 10;
  float homeHeight = 10;
  float homePositionX = 50;
  float homePositionY = 25;
  PFont boldHome;

  HomeIcon(float _homePositionX, float _homePositionY, float _homeWidth, float _homeHeight) {
    homeWidth = _homeWidth;
    homeHeight = _homeHeight;
    homePositionX = _homePositionX;
    homePositionY = _homePositionY;

  }

  void homeIconClicked() {
    if ((homeWidth + homePositionX) > mouseX
      && mouseX > (homePositionX) 
      &&(homeHeight + homePositionY) > mouseY
      && mouseY > (homePositionY)
      && (mouseClicked = true)) {
      background(255);
      startingScreen();
    }
  }

  void displayHomeIcon() {
    pushMatrix();
    fill(0);
    rect(homePositionX, homePositionY, homeWidth, homeHeight);
    boldHome = loadFont("Beirut-48.vlw");
    textFont(boldHome, 14);
    fill(255);
    text("HOME", 35, 30);
    popMatrix();
  }
}

HomeIcon homeIcon = new HomeIcon(10, 10, 50, 25);

// BEACH SCREEN TAB

PImage hiriketiya;
import processing.sound.*;
SoundFile wavesSound;
SoundFile villageSound;

void beachScreen() {
  background(255);
  hiriketiya = loadImage("hiriketiyaBeach.jpg");
  image(hiriketiya, 0, 0, width, height);

  //waves noise marker and noise
  fill(16, 48, 176);
  ellipse(240, 255, 15, 15);
  wavesSound = new SoundFile(this, "wavesSound.mp3");
  if ((dist(mouseX, mouseY, 240, 255) < r) && mousePressed) {
    wavesSound.play();
  }

  // village noise marker and noise
  fill(16, 48, 176);
  ellipse(475, 410, 15, 15);
  villageSound = new SoundFile(this, "villageSound.mp3");
  if ((dist(mouseX, mouseY, 475, 410) < r) && mousePressed) {
    villageSound.play();
  }


  // display the home icon and return to home screen when it's clicked
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}

// ELEPHANT ORPHANAGE SCREEN

PImage pinnawala;
//import processing.sound.*;
SoundFile elephantSound;
SoundFile treesSound;
PFont titleFont;

void elephantOrphanageScreen() {
  background(255);
  pinnawala = loadImage("pinnawalaElephantOrphanage.jpg");
  image(pinnawala, 0, 0, width, height);

  // text at the top of the screen
  titleFont = loadFont(".SFNSText-Bold-48.vlw");
  textFont(titleFont, 12);
  textAlign(CENTER);
  fill(40);
  smooth();
  text("PINNAWALA ELEPHANT ORPHANAGE", 360, 30);

  //elephant noise marker and noise
  fill(16, 48, 176);
  ellipse(465, 265, 15, 15);
  elephantSound = new SoundFile(this, "elephantSound.mp3");
  if ((dist(mouseX, mouseY, 465, 265) < r) && mousePressed) {
    elephantSound.play();
  }

  // trees noise marker and noise
  fill(16, 48, 176);
  ellipse(360, 140, 15, 15);
  treesSound = new SoundFile(this, "natureNoise.mp3");
  if ((dist(mouseX, mouseY, 465, 265) < r) && mousePressed) {
    treesSound.play();
  }


  // display the home icon and return to home screen when it's clicked
  homeIcon.homeIconClicked();
  homeIcon.displayHomeIcon();
}

// TRAIN SCREEN TAB

PImage kandyTrain;
import processing.sound.*;
SoundFile trainSound;
SoundFile mountainSound;

void trainScreen() {
  background(255);
  kandyTrain = loadImage("train.jpg");
  image(kandyTrain, 0, 0, width, height);

  //train noise marker and noise
  fill(16, 48, 176);
  ellipse(360, 310, 15, 15);
  trainSound = new SoundFile(this, "trainSound.wav");
  if ((dist(mouseX, mouseY, 360, 310) < r) && (mouseClicked = true)) {
    trainSound.play();
  }

  // mountain noise marker and noise
  fill(16, 48, 176);
  ellipse(300, 55, 15, 15);
  mountainSound = new SoundFile(this, "mountainSound.mp3");
  if ((dist(mouseX, mouseY, 300, 55) < r) && (mouseClicked = true)) {
    mountainSound.play();
  }


  // display the home icon and return to home screen when it's clicked
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}

// WATERFALL SCREEN TAB

PImage rambodaFalls;
import processing.sound.*;
SoundFile waterfallSound;
SoundFile morningSound;

void waterfallScreen() {
  background(255);
  rambodaFalls = loadImage("rambodaFalls.jpg");
  image(rambodaFalls, 0, 0, width, height);

  //waterfall noise marker and noise
  fill(16, 48, 176);
  ellipse(385, 450, 15, 15);
  waterfallSound = new SoundFile(this, "waterfallSound.wav");
  if ((dist(mouseX, mouseY, 385, 450) < r) && mousePressed) {
    waterfallSound.play();
  }

  // morning noise marker and noise
  fill(16, 48, 176);
  ellipse(665, 35, 15, 15);
  morningSound = new SoundFile(this, "morningSound.wav");
  if ((dist(mouseX, mouseY, 665, 35) < r) && mousePressed) {
    morningSound.play();
  }


  // display the home icon and return to home screen when it's clicked
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}

// QUIZ SCREEN TAB (Commented Out)

//class Button {
//  float x, y, w, h; // dimenstions of answer buttons
//  String t;
//  color boxColour, hoveredColour, boxTextColour;
//  int v; // 
//  Button(int value) {
//    v = value;
//    x = width/2;
//    y = height/2;
//    w = 100;
//    h = 30;
//    boxColour = color(128); //the boxes
//    hoveredColour = color(196); // box colour when hovered over
//    boxTextColour = color(0); // box text colours
//    t = "";
//  }
//  void draw() {
//    noStroke();
//    fill(boxColour);
//    if ( over() ) {
//      fill(hoveredColour);
//    }
//    pushMatrix();
//    translate(x, y);
//    rect(0, 0, w, h);
//    fill(boxTextColour);
//    textAlign(CENTER);
//    text( t, w/2, h/2 + 4); 
//    popMatrix();
//  }
//  boolean over() {
//    return( x < mouseX && mouseX < x + w && y < mouseY && mouseY < y + h );
//  }
//  void mousePressed() {
//    if ( over() ) {
//      copeWithAnswer( v );
//    }
//  }
//  void setText(String newText) {
//    t = newText;
//  }
//}

//Button[] buttons;

//void mousePressed(){
//    for( int i = 0; i < buttons.length; i++){
//    buttons[i].mousePressed();
//  }
//}

//String[][] questions = {
//  { "Volleyball", "Cricket", "Tennis", "Football", "What is the national sport of Sri Lanka?", "0" }, 
//  { "71", "35", "103", "60", "How many waterfalls are in Sri Lanka?", "3" }, 
//};
//int current_question = 0;

//void copeWithAnswer(int givenAnswer) {
//  if ( int(questions[current_question][5]) == givenAnswer ) {
//    println( "RIGHT!" );
//  } else {
//    println( "WRONG!" );
//  }
//  current_question++;
//  current_question%=questions.length;
//  prime_buttons();
//}

//void prime_buttons() {
//  for ( int i = 0; i < buttons.length; i++) {
//    buttons[i].setText(questions[current_question][i]);
//  }
//}


