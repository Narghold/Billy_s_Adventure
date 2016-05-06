import processing.sound.*;

//////VARIABLES/////////

int menu_List = 0; // 0 = Menu | 1 = Play | 2 = Commands | 3 = Combat | 4 = Shop |
boolean touche = false;

//Police
PFont Arblanca_48;
PFont GillSansMT_48;


//Musique Timer
int music_timer = 0;
int music_lastTimer = 0;


///////////////////////

void intialization(){
  menu_initialisation();
  menu_choix = 0;
  play_initialisation();
  command_initialisation();
}

void update(){
  if(menu_List == 0) menu_update();
  if(menu_List == 1) play_update();
}

void setup(){
  size(1080,720);
  smooth(0);
  stroke(0);
  intialization();
  music_menu.loop();
}

void draw(){
  update();
  if(menu_List == 0) menu_draw();
  if(menu_List == 1) play_draw();
  if(menu_List == 2) command_draw();
  if(menu_List == 3) combat_draw();
  if(menu_List == 4) shop_draw();
  
  //Musique en boucle
  music_timer = millis();
  if(music_timer - music_lastTimer > 134000){
    music_menu.play();
    music_lastTimer = music_timer;
  }
}