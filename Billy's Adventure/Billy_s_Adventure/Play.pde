//////VARIABLES//////

//Animations//
PImage Dos1;
PImage Dos2;
PImage Face1;
PImage Face2;
PImage Droite1;
PImage Droite2;
PImage Gauche1;
PImage Gauche2;
int perso_x = 500;
int perso_y = 500;

//Timer
int play_lastTimer = 0;
int play_timer = 0;

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
}

/*void play_update(){
   
  //Animation perso//
  play_timer = millis();
  
  if(play_timer - play_lastTimer > 1000){
    if(keyCode == UP){
      perso_y ++;
      image(Dos1 , 500 , perso_y);
    }else{
      perso_y ++;
      image(Dos2 , 500 , perso_y);
    }
  }
  if(backgroundMenu_x < -1600+1080){
    play_frame = 1;
  }
  if(backgroundMenu_x == 0){
    play_frame = 0;
  }
}*/

void play_draw(){

}