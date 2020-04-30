/*******************************Details of Architecture****************************/
/* Author: Noora    */
/* Date: 30/04/2020 */

/* Problem: I wanted this code to create a way to zoom into the details of Iranian 
 Architecture, and to do this, I tried to use the function 'resize'. However, when I used 
 the resize function, as you will see when you run the code, the smaller image didn't resize
 rather it just slightly displaced the image. 
 */

PImage architecturePic; 
int mouseClicked;

void setup() { 
  size(640, 640); // size of the image
  architecturePic = loadImage("iranianArchitecture.jpg");
  background(255);
}

void draw() { 
  image(architecturePic, 10, 10);
  PImage newPhoto = architecturePic.get(mouseX, mouseY, 100, 100); // grabs a smaller segment of the full image
  image (newPhoto, mouseX, mouseY); // draws that smaller segment
  loadPixels();
  newPhoto.resize(400, 400);
  println(mouseX, mouseY);
  if (mousePressed) {
    // counts the number of times the mouse is pressed so that the tint can go back to normal after a few clicks
    mouseClicked++;
    tint(random(0, 100), random(0, 255), random(0, 255));
  }
  if (mouseClicked>30) {
    noTint();
  }
  updatePixels();
}

/*  Image credits: https://www.pinterest.com/pin/206039751688564163/  */
