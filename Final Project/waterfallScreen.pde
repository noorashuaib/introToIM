// screen state 4

void waterfallScreen() {
  background(255);
  image(rambodaFalls, 0, 0, width, height); // displays the waterfall image

  // setting up and displaying the title font
  textFont(titleFont, 12);
  textAlign(CENTER);
  fill(40);
  smooth();
  text("RAMBODA FALLS", 360, 25);

  // adding the description marker and displaying the description when the cursor is over it
  fill(214, 169, 56);
  ellipse(450, 20, 15, 15);
  if ((dist(mouseX, mouseY, 450, 20) < r)) {
    pushStyle();
    textAlign(LEFT);
    fill(255);
    rect(300, 30, 353, 153);
    fill(0);
    smooth();
    text("\nRamboda Falls is one of Sri Lanka’s many picturesque" + 
      "\nwaterfalls nestled in the greenery of the Kandy District." +
      "\nThe waterfall is the 11th highest waterfall in Sri Lanka." +
      "\nThe rhythmic crashing of its waters is entwined with the" +
      "\nsoothing chirping of the birds that live within its green" +
      "\nsurroundings, creating a natural meditative atmosphere" +
      "\nfor the traveller to reflect on the balance of nature " +
      "\nwhile exploring the many gems of the Pearl of the" +
      "\nIndian Ocean.", 305, 38);
    popStyle();
  }

  // adding the waterfall sound marker and sound effect
  fill(16, 48, 176);
  ellipse(385, 450, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 385, 450) < r) && clicked == true) {
    if (!waterfallSound.isPlaying()) {
      waterfallSound.play();
    }
  }

  // adding the morning sounds marker and sound effect
  fill(16, 48, 176);
  ellipse(665, 35, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 665, 35) < r) && clicked == true) {
    if (!morningSound.isPlaying()) {
      morningSound.play();
    }
  }

  // display the home icon and return to home screen when it's clicked
  // the icon object and its functions are set up in the homeIcon tab
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}
