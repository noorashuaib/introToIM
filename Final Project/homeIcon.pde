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
