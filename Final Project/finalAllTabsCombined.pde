/************************************    Exploring Sri Lanka     **********************************/
/*                                      Author: Noora Shuaib                                      */
/*                             Introduction to Interactive Media Final                            */
/*                                       Date: 16/05/2020                                         */

// FINAL TAB (the main tab)


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


// STARTING SCREEN TAB


// screenState 0

void startingScreen() {
  background(255);

  // drawing a line between the map and the text
  stroke(0);
  line((width/2) - 1, 0, (width/2) - 1, height);

  // drawing starting screen with the map, text, and icons
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
}


// HOME ICON TAB


// creating an object called homeIcon that contains the dimensions and text for the home icon

class HomeIcon {
  // the dimesnions of the icon
  float homeWidth = 10;
  float homeHeight = 10;
  float homePositionX = 50;
  float homePositionY = 25;

  // home icon constructor
  HomeIcon(float _homePositionX, float _homePositionY, float _homeWidth, float _homeHeight) {
    homeWidth = _homeWidth;
    homeHeight = _homeHeight;
    homePositionX = _homePositionX;
    homePositionY = _homePositionY;
  }

  void homeIconClicked() {
    // goes back to the home screen if the icon is clicked 
    // also resets the number of clicks to zero in case the quiz is taken again
    if ((homeWidth + homePositionX) > mouseX
      && mouseX > (homePositionX) 
      &&(homeHeight + homePositionY) > mouseY
      && mouseY > (homePositionY)
      && (clicked == true)) {
      noOfClicks = 0;
      screenState = 0;
    }
  }

  // function to display the home icon
  void displayHomeIcon() {
    pushMatrix();
    fill(0);
    rect(homePositionX, homePositionY, homeWidth, homeHeight);
    textFont(boldHome, 14);
    fill(255);
    text("HOME", (homePositionX + 25), (homePositionY + 20)); //35, 30
    popMatrix();
  }
}

// creates a homeIcon
HomeIcon homeIcon = new HomeIcon(10, 10, 50, 25);


// ELEPHANT ORPHANAGE SCREEN TAB


// screen state 1

void elephantOrphanageScreen() {
  background(255);
  image(pinnawala, 0, 0, width, height); // displays the Elephant Orphanage image

  // setting up and displaying the title font
  textFont(titleFont, 12);
  textAlign(CENTER);
  fill(40);
  smooth();
  text("PINNAWALA ELEPHANT ORPHANAGE", 360, 30);

  // adding the description marker and displaying the description when the cursor is over it
  fill(214, 169, 56);
  ellipse(485, 25, 15, 15);
  if ((dist(mouseX, mouseY, 485, 25) < r)) {
    pushStyle();
    textAlign(LEFT);
    fill(255);
    rect(370, 32, 359, 152);
    fill(0);
    smooth();
    text("\nThe Pinnawala Elephant Orphanage cares for the largest" + 
      "\nherd of captive elephants in the world, offering care and" +
      "\nprotection to elephants orphaned in Sri Lankan jungle. " +
      "\nThe orphanage was established in 1975, and has never" +
      "\nturned its back on an orphaned elephant, undoing the" +
      "\nthe reduction in the elephant population in Sri Lanka" +
      "\nduring colonialism. Now, elephants enjoy a carefully" +
      "\ncurated natural habitat, where they are bathed twice daily" +
      "\nand ensured hearty meals. Pinnawala reminds its visitors" +
      "\nof the bond between people and beloved wildlife.", 374, 35);
    popStyle();
  }

  // adding the elephant sound marker and sound effect
  fill(16, 48, 176);
  ellipse(465, 265, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 465, 265) < r) && clicked == true) {
    if (!elephantSound.isPlaying()) {
      elephantSound.play();
    }
  }

  // adding the trees sound marker and sound effect
  fill(16, 48, 176);
  ellipse(360, 140, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 360, 140) < r) && clicked == true) {
    if (!treesSound.isPlaying()) {
      treesSound.play();
    }
  }

  // display the home icon and return to home screen when it's clicked
  // the icon object and its functions are set up in the homeIcon tab
  homeIcon.homeIconClicked();
  homeIcon.displayHomeIcon();
}


// BEACH SCREEN TAB


// screen state 2

void beachScreen() {
  background(255);
  image(hiriketiya, 0, 0, width, height); // displays the beach image

  // setting up and displaying the title font
  textFont(titleFont, 12);
  textAlign(CENTER);
  fill(255);
  smooth();
  text("HIRIKETIYA BEACH", 360, 30);

  // adding the description marker and displaying the description when the cursor is over it
  fill(214, 169, 56);
  ellipse(450, 25, 15, 15);
  if ((dist(mouseX, mouseY, 450, 25) < r)) {
    pushStyle();
    textAlign(LEFT);
    fill(255);
    rect(345, 32, 340, 152);
    fill(0);
    smooth();
    text("\nHiriketiya beach is where the jungle meets the sea!" + 
      "\nThe beach is a famous tourist hotspot for surfers" +
      "\nand volleyball players alike. Did you know that" +
      "\nvolleyball is the national sport of Sri Lanka? The" +
      "\nbeach is surrounded by little huts serving traditional" +
      "\nSri Lankan food (especially seafood) cooked fresh and" +
      "\nready after a day of swimming and surfing. With its" +
      "\ncalming atmosphere, the beach is the perfect place to" +
      "\nrelax or get work done, and simply bask in the beauty" +
      "\nof one of the island's most loved beaches.", 350, 35);
    popStyle();
  }

  // adding the waves noise marker and sound effect
  fill(16, 48, 176);
  ellipse(240, 255, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 240, 255) < r) && clicked == true) {
    if (!wavesSound.isPlaying()) {
      wavesSound.play();
    }
  }

  // adding the resort noise marker and sound effect
  fill(16, 48, 176);
  ellipse(475, 410, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 475, 410) < r) && clicked == true) {
    if (!resortSound.isPlaying()) {
      resortSound.play();
    }
  }

  // display the home icon and return to home screen when it's clicked
  // the icon object and its functions are set up in the homeIcon tab
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}


// TRAIN SCREEN TAB


// screen state 3

void trainScreen() {
  background(255);
  image(kandyTrain, 0, 0, width, height); // displays the train image

  // setting up and displaying the title font
  textFont(titleFont, 12);
  textAlign(CENTER);
  fill(40);
  smooth();
  text("KANDY TO ELLA TRAIN", 360, 30);

  // adding the description marker and displaying the description when the cursor is over it
  fill(214, 169, 56);
  ellipse(450, 25, 15, 15);
  if ((dist(mouseX, mouseY, 450, 25) < r)) {
    pushStyle();
    textAlign(LEFT);
    fill(255);
    rect(345, 32, 347, 153);
    fill(0);
    smooth();
    text("\nThe train that runs from Kandy to Ella is unique in" + 
      "\nmany ways; from the unparalleled scenery that it runs" +
      "\npast to the feet that dangle from the windows as" +
      "\ntravellers sit on the windows to drink in the beauty" +
      "\nof Sri Lanka. Seven hours is a long train ride," +
      "\nbut the Sri Lankan street food (listen for the calls" +
      "\nof ‘Wade! Wade!’ and the tinkle of a cart) and scenery" +
      "\nrushing past make the hours turn into minutes. With" +
      "\nabundant Instagram-able moments on the train, you are" +
      "\nbound to leave the train with lifelong memories.", 350, 35);
    popStyle();
  }

  // adding the train sound marker and sound effect
  fill(16, 48, 176);
  ellipse(360, 310, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 360, 310) < r) && (clicked == true)) {
    if (!trainSound.isPlaying()) {
      trainSound.play();
    }
  }

  // adding the mountain sound marker and sound effect
  fill(16, 48, 176);
  ellipse(300, 55, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 300, 55) < r) && (clicked == true)) {
    if (!mountainSound.isPlaying()) {
      mountainSound.play();
    }
  }

  // display the home icon and return to home screen when it's clicked
  // the icon object and its functions are set up in the homeIcon tab
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}


// WATERFALL SCREEN TAB


// screen state 4

void waterfallScreen() {
  background(255);
  image(rambodaFalls, 0, 0, width, height); // displays the waterfall image

  // setting up and displaying the title font
  textFont(titleFont, 12);
  textAlign(CENTER);
  fill(40);
  smooth();
  text("RAMBODA FALLS", 360, 25);

  // adding the description marker and displaying the description when the cursor is over it
  fill(214, 169, 56);
  ellipse(450, 20, 15, 15);
  if ((dist(mouseX, mouseY, 450, 20) < r)) {
    pushStyle();
    textAlign(LEFT);
    fill(255);
    rect(300, 30, 353, 153);
    fill(0);
    smooth();
    text("\nRamboda Falls is one of Sri Lanka’s many picturesque" + 
      "\nwaterfalls nestled in the greenery of the Kandy District." +
      "\nThe waterfall is the 11th highest waterfall in Sri Lanka." +
      "\nThe rhythmic crashing of its waters is entwined with the" +
      "\nsoothing chirping of the birds that live within its green" +
      "\nsurroundings, creating a natural meditative atmosphere" +
      "\nfor the traveller to reflect on the balance of nature " +
      "\nwhile exploring the many gems of the Pearl of the" +
      "\nIndian Ocean.", 305, 38);
    popStyle();
  }

  // adding the waterfall sound marker and sound effect
  fill(16, 48, 176);
  ellipse(385, 450, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 385, 450) < r) && clicked == true) {
    if (!waterfallSound.isPlaying()) {
      waterfallSound.play();
    }
  }

  // adding the morning sounds marker and sound effect
  fill(16, 48, 176);
  ellipse(665, 35, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 665, 35) < r) && clicked == true) {
    if (!morningSound.isPlaying()) {
      morningSound.play();
    }
  }

  // display the home icon and return to home screen when it's clicked
  // the icon object and its functions are set up in the homeIcon tab
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}


// QUIZ SCREEN TAB


// DISCLAIMER: A majority of this quiz code comes from:
// https://discourse.processing.org/t/help-with-making-a-quiz-in-processing/2333/7
// Credits for the code to TfGuy44

// dimensions of the quiz icon
float quizWidth = 75;
float quizHeight = 50;
float quizPositionX = 290;
float quizPositionY = 430;

// number of times an answer is selected
// this is used to call the score card after the questions are over
int noOfClicks = 0;

// setting the quiz score to zero at the start 
int quizScore = 0;              

//creating a class for the 4 answer buttons
class Button {
  float x, y, w, h; // dimenstions of answer buttons
  String t; // for the text in the boxes
  color boxColour, hoveredColour, boxTextColour;
  int v; 
  Button(int value) {
    v = value;
    // location and dimensions of the boxes
    x = width/2;
    y = height/2;
    w = 100;
    h = 30;
    boxColour = color(128); // colour of the boxes
    hoveredColour = color(196); // box colour when mouse hovered over
    boxTextColour = color(0); // box text colours
    t = ""; // text in the boxes, input from the string
  }

  // drawing the boxes
  void draw() {

    if (screenState == 5) {
      // sets the box colour and changes it if the mouse is over the box
      noStroke();
      fill(boxColour);
      if ( over() ) {
        fill(hoveredColour);
      }
      // draws the boxes in their respective locations by translating
      // adds the text to the boxes
      pushMatrix();
      translate(x, y);
      rect(0, 0, w, h);
      fill(boxTextColour);
      textAlign(CENTER);
      text( t, w/2, h/2 + 4); 
      popMatrix();
    }
  }

  // checking to see if the mouse is over the boxes
  boolean over() {
    return( x < mouseX && mouseX < x + w && y < mouseY && mouseY < y + h );
  }

  // if the mouse is clicked when over the boxes, it calls the function
  // that checks to see if the answer is right 
  void mousePressed() {
    if (screenState == 5) {
      if ( over() ) {
        copeWithAnswer( v );
        noOfClicks += 1; // counting the number of questions answered
      }
    }
  }

  // to change the answer options for each question
  void setText(String newText) {
    t = newText;
  }
}

void quizScreen() {
  background(255);

  // display the home icon and return to home screen when it's clicked
  homeIcon.homeIconClicked();
  homeIcon.displayHomeIcon();
}

Button[] buttons;

void mousePressed() {
  //calls the mousePressed function of the buttons class when the mouse is clicked
  if (screenState == 5) {
    for ( int i = 0; i < buttons.length; i++) {
      buttons[i].mousePressed();
    }
  }
}

// the list of questions and answers for the quiz
String[][] questions = {
  { "Volleyball", "Cricket", "Tennis", "Football", "What is the national sport of Sri Lanka?", "0" }, 
  { "Ella", "Galle", "Colombo", "Kandy District", "Where is Ramboda Falls found", "3" }, 
  { "1/2 hour", "10 hours", "7 hours", "3 hours", "How long is the train ride from Kandy to Ella?", "2" }, 
  { "5th", "11th", "15th", "3rd", "Ramboda Falls is the ______ highest waterfall in Sri Lanka", "1" }, 
  { "1967", "1975", "1988", "2000", "When was the Pinnawala Elephant Orphanage established?", "1" }, 
};
int current_question = 0;

// the function that checks if the answer is correct
void copeWithAnswer(int givenAnswer) {
  if ( int(questions[current_question][5]) == givenAnswer ) {
    quizScore += 1;
    println( "RIGHT!" );
  } else {
    println( "WRONG!" );
  }

  // changes the question
  current_question++;
  current_question%=questions.length;
  prime_buttons();
}

// sets the text for the buttons in each question using settext
void prime_buttons() {
  for ( int i = 0; i < buttons.length; i++) {
    buttons[i].setText(questions[current_question][i]);
  }
}


// SCORE CARD TAB

// screen state 6

void scoreCard() {
  background(255);
  // adds the main text saying the score
  pushStyle();
  textFont(scoreFont, 38);
  textAlign(CENTER);
  fill(40);
  smooth();
  text("\nYour final score is: " +
    "\n" + quizScore, 370, 180);
  popStyle();

  // display the home icon and return to home screen when it's clicked
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}


/************************************************** THE END. ENJOY! **********************************************************/
