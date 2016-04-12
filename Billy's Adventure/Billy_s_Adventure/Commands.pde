//////VARIABLES/////////

//Fleches directionnelles
PImage Up;
PImage Down;
PImage Left;
PImage Right;


///////////////////////

void command_initialisation(){
  
  Up = loadImage("up.png");
  Down = loadImage("down.png");
  Left = loadImage("left.png");
  Right = loadImage("right.png");
  
  Arblanca_48 = loadFont("ARBLANCA-48.vlw");
  
}

void command_draw(){
  background(#6C3621);
  
  //Titre
  fill(255, 255, 255);
  textFont(Arblanca_48 , 60);
  text("Commands" , 30 , 70);
  
}