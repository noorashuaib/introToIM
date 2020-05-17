// screen state 3

void trainScreen() {
  background(255);
  image(kandyTrain, 0, 0, width, height); // displays the train image

  // setting up and displaying the title font
  textFont(titleFont, 12);
  textAlign(CENTER);
  fill(40);
  smooth();
  text("KANDY TO ELLA TRAIN", 360, 30);

  // adding the description marker and displaying the description when the cursor is over it
  fill(214, 169, 56);
  ellipse(450, 25, 15, 15);
  if ((dist(mouseX, mouseY, 450, 25) < r)) {
    pushStyle();
    textAlign(LEFT);
    fill(255);
    rect(345, 32, 347, 153);
    fill(0);
    smooth();
    text("\nThe train that runs from Kandy to Ella is unique in" + 
      "\nmany ways; from the unparalleled scenery that it runs" +
      "\npast to the feet that dangle from the windows as" +
      "\ntravellers sit on the windows to drink in the beauty" +
      "\nof Sri Lanka. Seven hours is a long train ride," +
      "\nbut the Sri Lankan street food (listen for the calls" +
      "\nof ‘Wade! Wade!’ and the tinkle of a cart) and scenery" +
      "\nrushing past make the hours turn into minutes. With" +
      "\nabundant Instagram-able moments on the train, you are" +
      "\nbound to leave the train with lifelong memories.", 350, 35);
    popStyle();
  }

  // adding the train sound marker and sound effect
  fill(255, 255, 0);
  ellipse(360, 310, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 360, 310) < r) && (clicked == true)) {
    if (!trainSound.isPlaying()) {
      trainSound.play();
    }
  }

  // adding the mountain sound marker and sound effect
  fill(255, 255, 0);
  ellipse(300, 55, 15, 15);
  // ensuring that the sound effect only plays once when the marker is clicked
  if ((dist(mouseX, mouseY, 300, 55) < r) && (clicked == true)) {
    if (!mountainSound.isPlaying()) {
      mountainSound.play();
    }
  }

  // display the home icon and return to home screen when it's clicked
  // the icon object and its functions are set up in the homeIcon tab
  homeIcon.displayHomeIcon();
  homeIcon.homeIconClicked();
}
