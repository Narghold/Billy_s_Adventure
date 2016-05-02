//////VARIABLES/////////

//Fleches directionnelles
PImage Up;
PImage Down;
PImage Left;
PImage Right;
int fleche_x = 100;
int fleche_y = 100;

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
  
  //Up
  image(Up , 150 , 150 , fleche_x , fleche_y);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Up" , 185 , 140);
  
  //Down
  image(Down , 150 , 250 , fleche_x , fleche_y);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Down" , 165 , 380);
  
  //Left
  image(Left , 50 , 250 , fleche_x , fleche_y);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Left" , 75 , 380);
  
  //Right
  image(Right , 250 , 250 , fleche_x , fleche_y);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Right" , 265 , 380);
  
  //Indication retour
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Press ENTER to return to Menu" , 700 , 700);
  
  
}