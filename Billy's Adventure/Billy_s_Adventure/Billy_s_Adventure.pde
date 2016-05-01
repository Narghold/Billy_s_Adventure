import processing.sound.*;

//////VARIABLES/////////

int menu_List = 0; // 0 = Menu | 1 = Play | 2 = Commands | 3 = Combat | 4 = Shop |
boolean touche = false;

//Police
PFont Arblanca_48;

///////////////////////

void intialization(){
  menu_initialisation();
  menu_choix = 0;
  play_initialisation();
  command_initialisation();
  Arblanca_48 = loadFont("ARBLANCA-48.vlw");
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
}

void draw(){
  update();
  if(menu_List == 0) menu_draw();
  if(menu_List == 1) play_draw();
  if(menu_List == 2) command_draw();
  if(menu_List == 3) combat_draw();
  if(menu_List == 4) shop_draw();
}