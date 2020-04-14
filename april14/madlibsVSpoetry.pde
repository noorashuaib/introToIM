 /************************************** POETRY VS MADLIBS ***********************************************/

/************************************ References **************************************\
https://processing.org/reference/Table_getStringColumn_.html
 https://processing.org/reference/Table.html
 https://processing.org/reference/textLeading_.html
 https://github.com/aaronsherwood/introduction_interactive_media/blob/master/processingExamples/textExamples/splitCommas/splitCommas.pde
 https://github.com/JulianAGCarrera/Intro_IM/blob/master/Generative_Text_Output/Noun_Verb_Adverb_Generator.pde
 https://github.com/paredesfluffyshark/Intro-To-IM/blob/master/Text-Generator/Text-Generator-Code-Quim.pde
 https://processing.org/reference/text_.html
 /*************************************************************************************/

// creates a table to store the data from the csv file
Table table;

// creates a variable for each type of word in the poem/madlibs
String randomAdjective;
String randomNoun;
String randomVerb;
String randomAdverb;
String randomEmotion;
String randomPlace;

void setup() {
  size(500, 500);
  background(255);

  // adds the data from the csv file into the table created earlier
  table = loadTable("madlibsvspoetry.csv", "header");

  // creates an array containing the random words for each column of the table
  String adjective[] = table.getStringColumn("Adjective");
  String noun[] = table.getStringColumn("Noun");
  String verb[] = table.getStringColumn("Verb");
  String adverb[] = table.getStringColumn("Adverb");
  String place[] = table.getStringColumn("Place");
  String emotion[] = table.getStringColumn("Emotion");

  // chooses a random word from each category to be the variable in each new poem/madlib
  randomAdjective = adjective[int(random(0, 6))];
  randomNoun = noun[int(random(0, 6))];
  randomVerb = verb[int(random(0, 6))];
  randomAdverb = adverb[int(random(0, 6))];
  randomEmotion = emotion[int(random(0, 6))];
  randomPlace = place[int(random(0, 6))];
  
  // creates the text, and aligns it. Here the variables are added into the blank spaces 
  // to create a poem/madlibs depending on which words are generated. New lines are created
  // using \n to give it an air of poetry.
  textAlign(LEFT);
  fill(40);
  text("\n"+randomAdjective+""+
    "\nShe was in "+randomPlace+","+
    "\nPicking up memories of a "+randomNoun+","+
    "\nLong gone"+
    "\n"+randomAdverb+" wandering,"+
    "\nWishing she were "+randomVerb+" instead,"+
    "\nBut clinging to her "+randomEmotion+","+
    "\nAnd walking the footsteps of a stranger", 150, 200);
}


/************************************* Problems: **************************************\

I tried to make the poem change every time you click the mouse, but when I added this 
part of the code, the words kept fluctuating.

void draw() {
  background(255);
  mouseClicked();
}

void mouseClicked() {
  String adjective[] = table.getStringColumn("Adjective");
  String noun[] = table.getStringColumn("Noun");
  String verb[] = table.getStringColumn("Verb");
  String adverb[] = table.getStringColumn("Adverb");
  String place[] = table.getStringColumn("Place");
  String emotion[] = table.getStringColumn("Emotion");

  randomAdjective = adjective[int(random(0, 6))];
  randomNoun = noun[int(random(0, 6))];
  randomVerb = verb[int(random(0, 6))];
  randomAdverb = adverb[int(random(0, 6))];
  randomEmotion = emotion[int(random(0, 6))];
  randomPlace = place[int(random(0, 6))];

  textAlign(LEFT);
  fill(40);
  text("\n"+randomAdjective+""+
    "\nShe was in "+randomPlace+","+
    "\nPicking up memories of a "+randomNoun+","+
    "\nLong gone"+
    "\n"+randomAdverb+" wandering,"+
    "\nWishing she were "+randomVerb+" instead,"+
    "\nBut clinging to her "+randomEmotion+","+
    "\nAnd walking the footsteps of a stranger", 150, 200);
  
} 
/**************************************************************************************/
