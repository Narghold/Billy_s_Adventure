import processing.sound.*;

//////VARIABLES/////////

int menu_List = 0; // 0 = Menu | 1 = Play | 2 = Commands | 3 = Quit
boolean touche = false;

//Police
PFont Arblanca_48;

//Musique
SoundFile music_menu;

///////////////////////

void intialization(){
  menu_initialization();
  menu_choix = 0;
  play_initialization();
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
  
  //Musique
  if(menu_List == 0) music_menu.play();
}

void draw(){
  update();
  if(menu_List == 0) menu_draw();
  if(menu_List == 1) play_draw();
  if(menu_List == 2) command_draw();
}