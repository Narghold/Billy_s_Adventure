//////VARIABLES/////////

//Images
PImage background_Menu;
PImage curseur_Menu;

//Coordonnées Background
int backgroundMenu_x = 0;
int backgroundMenu_y = -100;

//Coordonnées Curseur
int menuCurseur_x = 50;
int menuCurseur_y = 50;

//Coordonnées Texte
int menuPlay_x = 30;
int menuPlay_y = 580;

int menuCommand_x = 30;
int menuCommand_y = 630;

int menuQuit_x = 30;
int menuQuit_y = 680;

//Timer
int menu_timer = 0;
int menu_lastTimer = 0;
int menu_frame = 0;

//Boolean boutons
boolean boutonPlay = true;
boolean boutonCommand = false;
boolean boutonQuit = false;

///////////////////////

void menu_initialisation(){
  background_Menu = loadImage("background.jpg");
  curseur_Menu = loadImage("menu_curseur.png");
}

void menu_update(){
  
//Défilement Background
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
  
  //Detection boutons
  
}

void menu_draw(){
  
  //Background
  image(background_Menu , backgroundMenu_x , backgroundMenu_y , 1600 , 1000);
  
  //Bouton Play
  fill(255, 255, 255);
  textSize(42);
  text("Play" , menuPlay_x , menuPlay_y);
  
  //Bouton Commands
  fill(255, 255, 255);
  textSize(42);
  text("Commands" , menuCommand_x , menuCommand_y);
  
  //Bouton Quit
  fill(255, 255, 255);
  textSize(42);
  text("Quit" , menuQuit_x , menuQuit_y);
  
  //Curseur
  image(curseur_Menu , menuCurseur_x , menuCurseur_y);
}