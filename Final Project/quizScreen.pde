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
