//class Button {
//  float x, y, w, h; // dimenstions of answer buttons
//  String t;
//  color boxColour, hoveredColour, boxTextColour;
//  int v; // 
//  Button(int value){
//    v = value;
//    x = width/2;
//    y = height/2;
//    w = 100;
//    h = 30;
//    boxColour = color(128); //the boxes
//    hoveredColour = color(196); // box colour when hovered over
//    boxTextColour = color(0); // box text colours
//    t = "";
//  }
//  void draw(){
//    noStroke();
//    fill(boxColour);
//    if( over() ){
//      fill(hoveredColour);
//    }
//    pushMatrix();
//    translate(x,y);
//    rect(0,0,w,h);
//    fill(boxTextColour);
//    textAlign(CENTER);
//    text( t, w/2, h/2 + 4); 
//    popMatrix();
//  }
//  boolean over(){
//    return( x < mouseX && mouseX < x + w && y < mouseY && mouseY < y + h );
//  }
//  void mousePressed(){
//    if( over() ){
//      copeWithAnswer( v );
//    }
//  }
//  void setText(String newText){
//    t = newText;
//  }
//}

//Button[] buttons;

////void mousePressed(){
////    for( int i = 0; i < buttons.length; i++){
////    buttons[i].mousePressed();
////  }
////}

//String[][] questions = {
//  { "Volleyball", "Cricket", "Tennis", "Football", "What is the national sport of Sri Lanka?", "0" },
//  { "71", "35", "103", "60", "How many waterfalls are in Sri Lanka?", "3" },
//};
//int current_question = 0;

//void copeWithAnswer(int givenAnswer){
//  if( int(questions[current_question][5]) == givenAnswer ){
//    println( "RIGHT!" );
//  } else {
//    println( "WRONG!" );
//  }
//  current_question++;
//  current_question%=questions.length;
//  prime_buttons();
//}

//void prime_buttons(){
//  for( int i = 0; i < buttons.length; i++){
//    buttons[i].setText(questions[current_question][i]);
//  }
//}
