//////VARIABLES/////////

int menu_List = 0; // 0 = Menu | 1 = Level | 2 = Paramètres | 3 = Quit


///////////////////////

void intialization(){
  menu_initialisation();
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
    menu_draw();}
}