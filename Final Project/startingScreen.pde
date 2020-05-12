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
