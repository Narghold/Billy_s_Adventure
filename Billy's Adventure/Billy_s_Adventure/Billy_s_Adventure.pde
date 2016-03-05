//////VARIABLES/////////

int menu_List = 0; // 0 = Menu | 1 = Level | 2 = Paramètres | 3 = Quit
boolean touche = false;

///////////////////////

void intialization(){
  menu_initialisation();
  menu_choix = 0;
}

void update(){
  menu_update();
}

void setup(){
  size(1080,720);
  smooth(0);
  stroke(0);
  intialization();
}

void draw(){
  update();
  if(menu_List == 0){
    menu_draw();
  }
}

void keyPressed(){
  if (keyCode == UP && menu_choix == 0 && touche == false && menu_List == 0)   menu_choix = 2;
  else
  if (keyCode == DOWN && menu_choix == 0 && touche == false && menu_List == 0) menu_choix = 1;
  else
  if (keyCode == UP && menu_choix == 1 && touche == false && menu_List == 0)   menu_choix = 0;
  else
  if (keyCode == DOWN && menu_choix == 1 && touche == false && menu_List == 0) menu_choix = 2;
  else
  if (keyCode == UP && menu_choix == 2 && touche == false && menu_List == 0)   menu_choix = 1;
  else
  if (keyCode == DOWN && menu_choix == 2 && touche == false && menu_List == 0) menu_choix = 0;
  touche = true;
}

void keyReleased(){
  if(menu_List == 0) touche = false;
}
