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
