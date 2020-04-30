/*******************************Playing With Architecture****************************/
/* Author: Noora    */
/* Date: 30/04/2020 */

/* 
 Explanation: The code I created plays with tinting as well as obtaining smaller sections of a larger image, 
 which you use to reveal the full image. The tinting is randomized, and I used mouseClicked to count the number of 
 times the tint was changed so that after a certain number of times, the colour returns to normal and you are able 
 to reveal the original image.
 */

PImage architecturePic; 
int mouseClicked;

void setup() { 
  size(640, 640); // size of the image
  architecturePic = loadImage("iranianArchitecture.jpg");
  background(255);
}

void draw() { 
  PImage newPhoto = architecturePic.get(mouseX, mouseY, 100, 100); // grabs a smaller segment of the full image
  image (newPhoto, mouseX, mouseY); // draws that smaller segment
  loadPixels();
  newPhoto.resize(400, 400); // I tried to use this to zoom in on the segment
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
