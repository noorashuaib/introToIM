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
