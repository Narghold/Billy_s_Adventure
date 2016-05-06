//////VARIABLES/////////
int or = 1000;

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
PImage Marchand;
PImage boss_token;
int map_x  = -725;
int map_y = -1470;
int perso_x = 516;
int perso_y = 328;

//Redimentionnement Images
int token_x = 48;
int token_y = 64;

//Timer marche
int play_lastTimer = 0;
int play_timer = 0;
int play_frame = 0;

//Timer course
int play_lastTimerC = 0;
int play_timerC = 0;

//////////////////////

void play_initialisation(){
  Dos1 = loadImage("Dos1.PNG");
  Dos2 = loadImage("Dos2.png");
  Face1 = loadImage("Face1.png");
  Face2 = loadImage("Face2.png");
  Droite1 = loadImage("Droite1.png");
  Droite2 = loadImage("Droite2.png");
  Gauche1 = loadImage("Gauche1.png");
  Gauche2 = loadImage("Gauche2.png");
  Carte = loadImage("map.png");
  Marchand = loadImage("merchant.png");
  boss_token = loadImage("boss.png");
}

void play_update(){
  
  //Déplacement carte grâce à la fonction keyPressed tjrs activé
  
  //Animation perso marche normale
  if(keyCode == UP && keyPressed || keyCode == LEFT && keyPressed || keyCode == RIGHT && keyPressed || keyCode == DOWN && keyPressed){
    play_timer = millis();
  
    if(play_timer - play_lastTimer > 400){
      if(play_frame == 0 && keyCode == UP && keyPressed){
        play_frame = 1;
        play_lastTimer = play_timer;
      }else if(play_frame == 1 && keyCode == UP && keyPressed){
        play_frame = 0;
        play_lastTimer = play_timer;
      }else if(play_frame == 0 && keyCode == DOWN && keyPressed){
        play_frame = 1;
        play_lastTimer = play_timer;
      }else if(play_frame == 1 && keyCode == DOWN && keyPressed){
        play_frame = 0;
        play_lastTimer = play_timer;
      }else if(play_frame == 0 && keyCode == LEFT && keyPressed){
        play_frame = 1;
        play_lastTimer = play_timer;
      }else if(play_frame == 1 && keyCode == LEFT && keyPressed){
        play_frame = 0;
        play_lastTimer = play_timer;
      }else if(play_frame == 0 && keyCode == RIGHT && keyPressed){
        play_frame = 1;
        play_lastTimer = play_timer;
      }else if(play_frame == 1 && keyCode == RIGHT && keyPressed){
        play_frame = 0;
        play_lastTimer = play_timer;
      }
    }
  }
}

void play_draw(){
  
  //Map
  background(#000000);
  image(Carte , map_x , map_y , 5842/2 , 4930/2); //Reduction à 2921x2465
  image(Marchand, map_x+1200, map_y+1100, 80, 104);
  image(boss_token, map_x+2000, map_y+450, 100, 125);
  
  //Personnage
  if(play_frame == 0 && keyCode == UP || play_frame == 0 && keyCode == UP && keyCode == SHIFT) image(Dos1 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 1 && keyCode == UP || play_frame == 0 && keyCode == UP && keyCode == SHIFT) image(Dos2 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 0 && keyCode == DOWN || play_frame == 0 && keyCode == DOWN && keyCode == SHIFT) image(Face1 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 1 && keyCode == DOWN || play_frame == 0 && keyCode == DOWN && keyCode == SHIFT) image(Face2 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 0 && keyCode == LEFT || play_frame == 0 && keyCode == LEFT && keyCode == SHIFT) image(Gauche1 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 1 && keyCode == LEFT || play_frame == 0 && keyCode == LEFT && keyCode == SHIFT) image(Gauche2 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 0 && keyCode == RIGHT || play_frame == 0 && keyCode == RIGHT && keyCode == SHIFT) image(Droite1 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 1 && keyCode == RIGHT || play_frame == 0 && keyCode == RIGHT && keyCode == SHIFT) image(Droite2 , perso_x , perso_y , token_x , token_y);
  else image(Face1 , perso_x , perso_y , token_x , token_y);
}