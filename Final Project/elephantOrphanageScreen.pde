// screen state 1

void elephantOrphanageScreen() {
  background(255);
  image(pinnawala, 0, 0, width, height); // displays the Elephant Orphanage image

  // setting up and displaying the title font
  textFont(titleFont, 12);
  textAlign(CENTER);
  fill(40);
  smooth();
  text("PINNAWALA ELEPHANT ORPHANAGE", 360, 30);

  // adding the description marker and displaying the description when the cursor is over it
  fill(214, 169, 56);
  ellipse(485, 25, 15, 15);
  if ((dist(mouseX, mouseY, 485, 25) < r)) {
    pushStyle();
    textAlign(LEFT);
    fill(255);
    rect(370, 32, 359, 152);
    fill(0);
    smooth();
    text("\nThe Pinnawala Elephant Orphanage cares for the largest" + 
      "\nherd of captive elephants in the world, offering care and" +
      "\nprotection to elephants orphaned in Sri Lankan jungle. " +
      "\nThe orphanage was established in 1975, and has never" +
      "\nturned its back on an orphaned elephant, undoing the" +
      "\nthe reduction in the elephant population in Sri Lanka" +
      "\nduring colonialism. Now, elephants enjoy a carefully" +
      "\ncurated natural habitat, where they are bathed twice daily" +
      "\nand ensured hearty meals. Pinnawala reminds its visitors" +
      "\nof the bond between people and beloved wildlife.", 374, 35);
    popStyle();
  }

  // adding the elephant sound marker and sound effect
  fill(16, 48, 176);
  ellipse(465, 265, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 465, 265) < r) && clicked == true) {
    if (!elephantSound.isPlaying()) {
      elephantSound.play();
    }
  }

  // adding the trees sound marker and sound effect
  fill(255, 255, 0);
  ellipse(360, 140, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 360, 140) < r) && clicked == true) {
    if (!treesSound.isPlaying()) {
      treesSound.play();
    }
  }

  // display the home icon and return to home screen when it's clicked
  // the icon object and its functions are set up in the homeIcon tab
  homeIcon.homeIconClicked();
  homeIcon.displayHomeIcon();
}

  // trees noise marker and noise
  fill(255, 255, 0);
  ellipse(360, 140, 15, 15);
  treesSound = new SoundFile(this, "natureNoise.mp3");
  if ((dist(mouseX, mouseY, 465, 265) < r) && mousePressed) {
    treesSound.play();
  }


  // display the home icon and return to home screen when it's clicked
  homeIcon.homeIconClicked();
  homeIcon.displayHomeIcon();
}
