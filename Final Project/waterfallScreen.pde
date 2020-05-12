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
