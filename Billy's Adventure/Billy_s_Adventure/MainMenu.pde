//////VARIABLES/////////

//Images
PImage background_Menu;

//Coordonnées Background
int backgroundMenu_x = 0;
int backgroundMenu_y = -100;

//Coordonnées Texte
int menuPlay_x = 540;
int menuPlay_y = 360;

//Timer
int menu_timer = 0;
int menu_lastTimer = 0;
int menu_frame = 0;

///////////////////////

void menu_initialisation(){
  background_Menu = loadImage("background.jpg");
}

void menu_update(){
  menu_timer = millis();
  
  if(menu_timer - menu_lastTimer > 30){
    if(menu_frame == 0){
      backgroundMenu_x --;
    }else{
      backgroundMenu_x ++;
    }
  }
  if(backgroundMenu_x < -1600+1080){
    menu_frame = 1;
  }
  if(backgroundMenu_x == 0){
    menu_frame = 0;
  }
}

void menu_draw(){
  
  //Background
  image(background_Menu , backgroundMenu_x , backgroundMenu_y , 1600 , 1000);
  
  //Bouton Play
  fill(255, 255, 255);
  textSize(42);
  text("Play" , menuPlay_x , menuPlay_y);
  
  
}