//////VARIABLES//////

//Animations
PImage Dos1;
PImage Dos2;
PImage Face1;
PImage Face2;
PImage Droite1;
PImage Droite2;
PImage Gauche1;
PImage Gauche2;
PImage Carte;
int map_x  = -725;
int map_y = -1470;

//Timer
int play_lastTimer = 0;
int play_timer = 1080;
int play_frame = 0; 

//////////////////////

void play_initialization(){
  Dos1 = loadImage("Dos1.PNG");
  Dos2 = loadImage("Dos2.png");
  Face1 = loadImage("Face1.png");
  Face2 = loadImage("Face2.png");
  Droite1 = loadImage("Droite1.png");
  Droite2 = loadImage("Droite2.png");
  Gauche1 = loadImage("Gauche1.png");
  Gauche2 = loadImage("Gauche1.png");
  Carte = loadImage("map.png");
}

void play_update(){
  
  //Déplacement carte
  keyPressed();
 
  //Animation perso
  play_timer = millis();
  
}

void play_draw(){
  background(#000000);
  image(Carte , map_x , map_y , 5842/2 , 4930/2); //Reduction à 2921x2465
}