void setup() {
  size(500, 500);
  int leftEyeyx = width/2 - 50;
  int rightEyex = width/2 + 50;
  int eyeHeight = 200;

  // hijab
  fill(18, 17, 87);
  ellipse(250, 250, 400, 500);
  // head
  fill(199, 148, 93);
  ellipse(width/2, height/2, 300, 350);
  // eyes
  fill(255, 255, 255);
  ellipse(leftEyeyx, eyeHeight, 40, 40);
  fill(255, 255, 255);
  ellipse(rightEyex, eyeHeight, 40, 40);
  // pupils
  fill(105, 82, 60);
  ellipse((width/2 - 50), (height/2 - 45), 20, 20);
  fill(105, 82, 60);
  ellipse((width/2 + 50), (height/2 - 45), 20, 20);
  // mouth 
  fill(148, 49, 49);
  arc(width/2, 350, 90, 30, 0, 180);
  //nose 
  fill(0, 0, 0);
  line(250, 240, 230, 280);
  line(230, 280, 250, 280);
  //dimple 
  curve(240, 360, 240, 370, 265, 370, 295, 360);
  //left eyebrow
  curve(155, 200, 175, 170, 215, 170, 235, 200);
  // right eyebrow
  curve(255, 200, 275, 170, 315, 170, 335, 200);
}
