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
