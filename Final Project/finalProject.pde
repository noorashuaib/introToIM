/*********************************************    Exploring Sri Lanka     ***************************************************/
/*                                                Author: Noora Shuaib                                                      */
/*                                       Introduction to Interactive Media Final                                            */
/*                                                  Date: 16/05/2020                                                        */


int screenState = 0;            // creates screen states in order to navigate between screens when mouse is clicked
boolean clicked = false;        // creates a boolean variable to identify when the mouse is clicked
float r = 7.5;                  // radius of the markers

// initializing the fonts
PFont descriptionFont;          // initializes the font for the site descriptions
PFont titleFont;                // initializes the font for the names of the sites
PFont scoreFont;                // initializes the font for the score card
PFont boldHome;                 // initializes the font for the home icon
PFont timesFont;                // initializes the font for the start screen description

// initializing the images 
PImage pinnawala;               // the picture of the elephant orphanage
PImage hiriketiya;              // the picture of the beach
PImage kandyTrain;              // the picture of the Kandy train
PImage rambodaFalls;            // the picture of the waterfall
PImage sriLankaMap;             // the picture of the map in the home screen
PImage quizClipArt;             // the picture of the quiz icon
PImage sriLankanFlag;           // the picture of the Sri Lankan flag

// initializing the sound library and effects
import processing.sound.*;      // initializes the soundFile library
SoundFile wavesSound;        
SoundFile resortSound;
SoundFile elephantSound;
SoundFile treesSound;
SoundFile trainSound;
SoundFile mountainSound;
SoundFile waterfallSound;
SoundFile morningSound;


void setup() {
  background(255);
  size(740, 480);

  // loading the fonts
  titleFont = loadFont(".SFNSText-Bold-48.vlw");
  descriptionFont = loadFont("AvenirNextCondensed-UltraLight-48.vlw");
  scoreFont = loadFont("HelveticaNeue-CondensedBlack-48.vlw");
  boldHome = loadFont("Beirut-48.vlw");

  // loading the sound effects for the sites
  elephantSound = new SoundFile(this, "elephantSound.wav");
  treesSound = new SoundFile(this, "treesSound.wav");
  wavesSound = new SoundFile(this, "wavesSound.wav");
  resortSound = new SoundFile(this, "resortSound.wav");
  trainSound = new SoundFile(this, "trainSound.wav");
  mountainSound = new SoundFile(this, "morningSound.wav");
  waterfallSound = new SoundFile(this, "waterfallSound.wav");
  morningSound = new SoundFile(this, "bulbulSound.wav");

  // loading the images for each site, and the images for the icons and map
  hiriketiya = loadImage("hiriketiyaBeach.jpg");
  pinnawala = loadImage("pinnawalaElephantOrphanage.jpg");
  kandyTrain = loadImage("train.jpg");
  rambodaFalls = loadImage("rambodaFalls.jpg");
  sriLankaMap = loadImage("sriLankaMap.jpg");
  quizClipArt = loadImage("quizClipArt.jpg");
  sriLankanFlag = loadImage("sriLankanFlag.jpg");

  // telling the array how many quiz buttons it needs to accommodate
  buttons = new Button[4];
  for ( int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(i);
    buttons[i].x = 135 + 120 * i ;  // sets the location of the buttons
  } 
  // setting the text in the buttons for each question, this function is created in quizScreen
  prime_buttons();
}

void draw() {

  // printing the location of the mouse to debug if necessary
  println( "x: " + mouseX + " y: " + mouseY);

  // assigning a screenState to each screen of the program
  if (screenState == 0) {
    startingScreen();
  }
  if (screenState == 1) {
    elephantOrphanageScreen();
  }
  if (screenState == 2) {
    beachScreen();
  }
  if (screenState == 3) {
    trainScreen();
  } 
  if (screenState == 4) {
    waterfallScreen();
  }
  if (screenState == 5) {
    quizScreen();
  }
  if (screenState == 6) {
    scoreCard();
  }

  // changing the screenState if the marker for the screen is clicked on
  if (screenState == 0 && (dist(mouseX, mouseY, 500, 310) < r) && clicked == true) {
    screenState = 1;
  }

  if (screenState == 0 && (dist(mouseX, mouseY, 520, 455) < r) && clicked == true) {
    screenState = 2;
  }

  if (screenState == 0 && (dist(mouseX, mouseY, 555, 140) < r) && (clicked == true)) {
    screenState = 3;
  }

  if (screenState == 0 && (dist(mouseX, mouseY, 535, 340) < r) && (clicked == true)) {
    screenState = 4;
  }

  // changing the screenState if the quiz icon is clicked on
  if (screenState == 0
    && (quizWidth + quizPositionX) > mouseX
    && mouseX > quizPositionX
    && (quizHeight + quizPositionY) > mouseY
    && mouseY > quizPositionY
    && clicked == true) {
    screenState = 5;
  }

  // for the quiz
  if (screenState == 5) {

    // to set up and display the quiz score at the top of the screen
    textFont(titleFont, 12);
    fill(40);
    smooth();
    text("Score: " + quizScore, 700, 30);

    // to setup and display the questions and draw the buttons
    fill(0);
    pushStyle();
    textSize(24);
    text( questions[current_question][4], width/2, 200);
    popStyle();
    for ( int i = 0; i < buttons.length; i++) {
      buttons[i].draw();
    }
  }

  // to change the screen to the score card once all 5 questions are answered
  if (noOfClicks == 5) {
    screenState = 6;
  }
}

// to change the input of the mouseClicked function into a variable
void mouseClicked() {
  clicked = true;
}

