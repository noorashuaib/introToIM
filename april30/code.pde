PImage photo; 
float d = dist(width/2, height/2, mouseX, mouseY);
int mouseClicked;

void setup() { 
  size(640, 640); 
  photo = loadImage("iranianArchitecture.jpg");
  background(255);
}

void draw() { 
  //  image(photo, 10, 10);
  PImage newPhoto = photo.get(mouseX, mouseY, 100, 100);
  image (newPhoto, mouseX, mouseY);
  newPhoto.resize(400, 400);
  // loadPixels();
  //  photo.get(mouseX, mouseY);
  println(mouseX, mouseY);
  //map(d, 0, 500, 0, 6);
  //constrain(d, 0, 4);
  if (mousePressed) {
    mouseClicked++;
    tint(random(0, 100), random(0, 255), random(0, 255));
  }
  if (mouseClicked>30) {
    noTint();
  }
}

/* void makePoster() {
 filter(POSTERIZE, 4);
 }
 
 void makeGrey() {
 filter(GRAY);
 }
 
 void makeBlur() {
 filter(BLUR, 6);
 }
 */
