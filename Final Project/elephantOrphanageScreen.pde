PImage pinnawala;
//import processing.sound.*;
SoundFile elephantSound;
SoundFile treesSound;
PFont titleFont;

//elephantSound.mp3

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
