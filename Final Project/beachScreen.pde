PImage hiriketiya;
import processing.sound.*;
SoundFile wavesSound;
SoundFile villageSound;

void beachScreen() {
  background(255);
  hiriketiya = loadImage("hiriketiyaBeach.jpg");
  image(hiriketiya, 0, 0, width, height);

  //waves noise marker and noise
  fill(16, 48, 176);
  ellipse(240, 255, 15, 15);
  wavesSound = new SoundFile(this, "wavesSound.mp3");
  if ((dist(mouseX, mouseY, 240, 255) < r) && mousePressed) {
    wavesSound.play();
  }

  // village noise marker and noise
  fill(16, 48, 176);
  ellipse(475, 410, 15, 15);
  villageSound = new SoundFile(this, "villageSound.mp3");
  if ((dist(mouseX, mouseY, 475, 410) < r) && mousePressed) {
    villageSound.play();
  }


  // display the home icon and return to home screen when it's clicked
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}
