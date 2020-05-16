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

