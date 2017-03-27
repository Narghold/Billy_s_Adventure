import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Billy_s_Adventure extends PApplet {



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

public void intialization(){
  menu_initialisation();
  menu_choix = 0;
  play_initialisation();
  command_initialisation();
}

public void update(){
  if(menu_List == 0) menu_update();
  if(menu_List == 1) play_update();
}

public void setup(){
  
  
  stroke(0);
  intialization();
  music_menu.loop();
}

public void draw(){
  update();
  if(menu_List == 0) menu_draw();
  if(menu_List == 1){
    play_draw();
    music_timer = 0;
    music_timer = millis();
    if(music_timer - music_lastTimer > 134000){
      music_menu.play();
      music_lastTimer = music_timer;
    }
  }
  if(menu_List == 2) command_draw();
  if(menu_List == 3) combat_draw();
  if(menu_List == 4) shop_draw();
  if(menu_List == 5) gameOver_draw();
  println(map_x + "///" + map_y);
}
//////VARIABLES/////////

boolean boss = false;
int ennemi;
                      ///////POUR L'ENNEMI///////
int ennemi_maxHP;            //Total de HP
int ennemi_maxMP;            //Total de MP
int ennemi_maxDmg;           //Borne haute de l'interval de d\u00e9gats
int ennemi_minDmg;           //Borne basse de l'interval de d\u00e9gats
float ennemi_esquive;        //Probalit\u00e9 de r\u00e9ussite d'esquiver l'attaque du joueur
int ennemi_HP;               //Nombre de HP en cours pouvant varier
int ennemi_MP;               //Nombre de MP en cours pouvant varier
int ennemi_gold;             //Gold gagn\u00e9es

                    ///////POUR LE JOUEUR///////
int player_maxHP = 50;
int player_maxMP = 25;
int player_maxDmg = 18;
int player_minDmg = 10; 
int player_minDmgM = 18;
int player_maxDmgM = 25;
int player_HP = 50;
int player_MP = 25;
int gold = 100;
float player_fuite = 0.5f;    //Probabilit\u00e9 de r\u00e9ussite pour fuir le combat

int animation = 0;

PImage combat_background;
PImage combat_box1;
PImage combat_box2;
PImage combat_player;
PImage combat_ennemi;

int combat_choix = 1;

float fuite;
float ennemi_choix = 0;
float Eesquive;
int Eattaque;
boolean attaque;
int player_dmg;
int ennemi_dmg;
boolean esquive;
boolean player_Mattaque;
boolean player_attaque;
boolean ennemi_priority;

////////////////////////////

public void combat_draw(){
  
  combat_update();
  combat_transition();
  combat_stats();
  if(ennemi_HP <= 0 && boss == false){
    gold = gold + ennemi_gold;
    menu_List = 1;
  }else if(ennemi_HP <= 0 && boss == true){
    win();
  }else if(player_HP <= 0){
    gameOver_draw();
  }
  
  
}

public void combat_initialisation(){
  combat_update();
  if(boss == true){
    ennemi = 0;
    ennemi_maxHP = 125;
    ennemi_maxDmg = 20;
    ennemi_minDmg = 10;
    ennemi_esquive = 0.5f;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = 10000;
    combat_ennemi =  loadImage("boss.png");
  }
  else
  ennemi = PApplet.parseInt(random(1,7)); //| 1 = Pikachu | 2 = Mario Bros | 3 = Batman | 4 = Thor | 5 = Gandhalf | 6 = Link | 7 = Saitama | 8 = Goku | 9 = Vegeto 
  
  if(ennemi == 1){
    ennemi_maxHP = 35;
    ennemi_maxDmg = 8;
    ennemi_minDmg = 4;
    ennemi_esquive = 0.2f;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("pikachu.png");
  }
  else
  if(ennemi == 2){
    ennemi_maxHP = 50;
    ennemi_maxDmg = 8;
    ennemi_minDmg = 6;
    ennemi_esquive = 0.3f;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("batman.png");
  }
  else
  if(ennemi == 3){
    ennemi_maxHP = 200;
    ennemi_maxDmg = 4;
    ennemi_minDmg = 0;
    ennemi_esquive = 0.3f;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("thor.png");
  }
  else
  if(ennemi == 4){
    ennemi_maxHP = 100;
    ennemi_maxDmg = 10;
    ennemi_minDmg = 0;
    ennemi_esquive = 0.3f;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("gandalf.png");
  }
  else
  if(ennemi == 5){
    ennemi_maxHP = 50;
    ennemi_maxDmg = 12;
    ennemi_minDmg = 6;
    ennemi_esquive = 0.5f;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("link.png");
  }
  else
  if(ennemi == 6){
    ennemi_maxHP = 250;
    ennemi_maxDmg = 15;
    ennemi_minDmg = 0;
    ennemi_esquive = 0.6f;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("goku.png");
  }
  else
  if(ennemi == 7){
    ennemi_maxHP = 300;
    ennemi_maxDmg = 25;
    ennemi_minDmg = 0;
    ennemi_esquive = 0.65f;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("vegeto.png");
  }
  combat_background = loadImage("Battle_Background.jpg");
  combat_box1 = loadImage("box.png");
  combat_box2 = loadImage("box.png");
  combat_player = loadImage("perso_epee.png");
}

//Timer
int combat_lastTimer = 0;
int combat_timer = 0;
int combat_frame = 0; 

///////////////////////////

public void combat_update(){
  combat_timer = millis();
  if(combat_timer - combat_lastTimer > 200){
    if(combat_frame == 0){
      combat_frame = 1;
      combat_lastTimer = combat_timer;
    }
    else 
    if(combat_frame == 1){
      combat_frame = 0;
      combat_lastTimer = combat_timer;
    }
  }
}



public void combat_transition(){
    if(animation == 6) background(0);
    stroke(0);
    fill(0);
    if(combat_frame == 1 && animation == 0){ rect(0,0,1080,120); animation = 1;}
    if(combat_frame == 0 && animation == 2){ rect(0,120,1080,120); animation = 3;}
    if(combat_frame == 1 && animation == 4){ rect(0,240,1080,120); animation = 5;}
    if(combat_frame == 0 && animation == 5){ rect(0,360,1080,120); animation = 6;}  
    if(combat_frame == 1 && animation == 3){ rect(0,480,1080,120); animation = 4;}
    if(combat_frame == 0 && animation == 1){ rect(0,600,1080,120); animation = 2;}
    if(animation == 6)image(combat_background, 0, 0);
    if(animation == 6)image(combat_ennemi, 800, 150, 210, 190);
    if(animation == 6)image(combat_player, 75,150);
    if(animation == 6)image(combat_box1, 50, 30);
    if(animation == 6)image(combat_box2, 850, 30);
    if(animation == 6){
      fill(255, 20, 20);
      textFont(GillSansMT_48 , 42);
      text("/"+player_maxHP , 160, 70);
      text("/"+ennemi_maxHP , 960, 70);
      fill(0);
      text(player_HP , 105, 70);
      text(ennemi_HP , 905, 70);
      text(player_MP , 120, 110);
      text("////////", 920, 110);
      fill(20,20,255);
      text("/"+player_maxMP , 160, 110);      
      fill(255);
      textFont(Arblanca_48 , 42);
      text("Attaque" , 150 , 480);
      text("Attaque Magique" , 150 , 550 );
      text("Fuite" ,  150, 620);
   } 
}

public void combat_stats(){
  if(combat_choix==1 && animation == 6)image(curseur_Menu , 100 , 460);
  if(combat_choix==2 && animation == 6)image(curseur_Menu , 100 , 530);
  if(combat_choix==3 && animation == 6)image(curseur_Menu , 100 , 600);
  if(attaque == false){
    player_dmg = 0;
  }
    

}


public void player_fuite(){
  fuite = random(0,1);
  if(fuite<player_fuite){
    menu_List = 1;
    animation = 0;
  }
}

public void ennemi_esquive(){
  Eesquive = random(0,1);
  if(Eesquive<ennemi_esquive){
    player_dmg = 0;
    esquive = true;
    ennemi_priority = true;
  }
  else esquive = false;
}

public void ennemi_attaque(){
  Eattaque = PApplet.parseInt(random(ennemi_minDmg,ennemi_maxDmg+1));
  player_HP = player_HP - Eattaque;
}

public void combat_tour(){
  if(boss == true){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.33f){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 1){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.6f){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 2){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.40f){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 3){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.15f){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 4){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.5f){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 5){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.35f){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 6){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.25f){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 7){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.2f){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(player_Mattaque == true){
    player_dmg = PApplet.parseInt(random(player_minDmgM, player_maxDmgM + 1));
    ennemi_HP = ennemi_HP - player_dmg;
  }
  else
  if(player_attaque == true){
        player_dmg = PApplet.parseInt(random(player_minDmg, player_maxDmg + 1));
        ennemi_HP = ennemi_HP - player_dmg;
  }
  if(ennemi_priority == true){
    
  }
}
//////VARIABLES/////////

//Fleches directionnelles
PImage Up;
PImage Down;
PImage Left;
PImage Right;
int fleche_x = 100;
int fleche_y = 100;

public void command_initialisation(){
  
  Up = loadImage("up.png");
  Down = loadImage("down.png");
  Left = loadImage("left.png");
  Right = loadImage("right.png");
  
  Arblanca_48 = loadFont("ARBLANCA-48.vlw");
  GillSansMT_48 = loadFont("GillSansMT-48.vlw");
  
}

public void command_draw(){
  background(0xff6C3621);
  
  //Titre
  fill(255, 255, 255);
  textFont(Arblanca_48 , 60);
  text("Commands" , 30 , 70);
  
  //Up
  image(Up , 150 , 150 , fleche_x , fleche_y);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Up" , 185 , 140);
  
  //Down
  image(Down , 150 , 250 , fleche_x , fleche_y);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Down" , 165 , 380);
  
  //Left
  image(Left , 50 , 250 , fleche_x , fleche_y);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Left" , 75 , 380);
  
  //Right
  image(Right , 250 , 250 , fleche_x , fleche_y);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Right" , 265 , 380);
  
  //Indication retour
  fill(255, 255, 255);
  textFont(Arblanca_48 , 30);
  text("Press ENTER to return to return menu" , 700 , 700);
  
  
}
public void keyPressed(){
  if (keyCode == UP && menu_choix == 0 && touche == false && menu_List == 0)   menu_choix = 2;  //Variable curseur // 0 = Play | 1 = Command | 2 = Quit 
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
  else
  if (keyCode == ENTER && menu_choix == 0 && touche == false && menu_List == 0) menu_List = 1;
  else
  if (keyCode == ENTER && menu_choix == 1 && touche == false && menu_List == 0) menu_List = 2;
  else
  if (keyCode == ENTER && menu_choix == 2 && touche == false && menu_List == 0) exit();
  else
  if(keyCode == UP && menu_List == 1) map_y = map_y + 3;  //D\u00e9placement carte //Scrolling
  else
  if(keyCode == DOWN && menu_List == 1) map_y = map_y - 3;
  else
  if(keyCode == LEFT && menu_List == 1) map_x = map_x + 3;
  else
  if(keyCode == RIGHT && menu_List == 1) map_x = map_x - 3;
  else
  if(keyCode == ENTER && menu_List == 1 && map_x > -2040 && map_x < -1970 && map_y < -1470 && map_y > -1510){shop_initialisation(); menu_List = 4;}
  else
  if(keyCode == TAB && menu_List == 4){
    menu_List = 1;
    animation = 0;
  }
  else
  if (keyCode == ENTER && menu_List == 5 && touche == false) menu_List = 0;
  else
  if (keyCode == ENTER && menu_List == 6 && touche == false) exit();
  else
  if(keyCode == ENTER && menu_List == 1 && touche == false && map_x <= -1475 && map_x > -1540 && map_y < -870 && map_y > -930){ boss = true; combat_initialisation(); menu_List = 3;}
  else
  if(keyCode == ENTER && menu_List == 1 && touche == false){boss = false; combat_initialisation(); menu_List = 3;}
  else
  if(keyCode == ENTER && menu_List == 2 && touche == false){
    menu_List = 0;
    menu_choix = 0;
  }
  else
  if (keyCode == UP && shop_choix == 1 && touche == false && menu_List == 4) shop_choix = 5; 
  else
  if (keyCode == DOWN && shop_choix == 1 && touche == false && menu_List == 4) shop_choix = 2;
  else
  if (keyCode == ENTER && shop_choix == 1 && touche == false && menu_List == 4 && gold>=200 && armure == false){armure = true; gold = gold-200; player_maxHP = player_maxHP + 25; player_HP = player_HP + 25;}
  else
  if (keyCode == UP && shop_choix == 2 && touche == false && menu_List == 4) shop_choix = 1;
  else
  if (keyCode == DOWN && shop_choix == 2 && touche == false && menu_List == 4) shop_choix = 3;
  else
  if (keyCode == ENTER && shop_choix == 2 && touche == false && menu_List == 4 && gold>=250 && bague == false){bague = true; gold = gold-250; player_minDmgM = 25; player_maxDmgM = 35;}
  else
  if (keyCode == UP && shop_choix == 3 && touche == false && menu_List == 4) shop_choix = 2;
  else
  if (keyCode == DOWN && shop_choix == 3 && touche == false && menu_List == 4) shop_choix = 4;
  else
  if (keyCode == ENTER && shop_choix == 3 && touche == false && menu_List == 4 && gold>=100 && bouclier == false){bouclier = true; gold = gold-100; player_maxHP = player_maxHP + 25; player_HP = player_HP + 25;}
  else
  if (keyCode == UP && shop_choix == 4 && touche == false && menu_List == 4) shop_choix = 3;
  else
  if (keyCode == DOWN && shop_choix == 4 && touche == false && menu_List == 4) shop_choix = 5;
  else
  if (keyCode == ENTER && shop_choix == 4 && touche == false && menu_List == 4 && gold>=150 && cristal == false){cristal = true; gold = gold-150; player_maxMP = player_maxMP + 15; player_MP = player_MP + 15;}
  else
  if (keyCode == UP && shop_choix == 5 && touche == false && menu_List == 4) shop_choix = 4;
  else
  if (keyCode == DOWN && shop_choix == 5 && touche == false && menu_List == 4) shop_choix = 1;
  else
  if (keyCode == ENTER && shop_choix == 5 && touche == false && menu_List == 4 && gold>=150 && epee == false){epee = true; gold = gold-150; player_minDmg = 18; player_maxDmg = 25;}
  else
  if (keyCode == CONTROL && touche == false && gold>= 50){player_HP = player_maxHP; player_MP = player_maxMP; gold=gold-50;}
  
  
  else
  if (keyCode == UP && combat_choix == 1 && touche == false && menu_List == 3) combat_choix = 3;
  else
  if (keyCode == DOWN && combat_choix == 1 && touche == false && menu_List == 3) combat_choix = 2;
  else
  if (keyCode == UP && combat_choix == 2 && touche == false && menu_List == 3) combat_choix = 1;
  else
  if (keyCode == DOWN && combat_choix == 2 && touche == false && menu_List == 3) combat_choix = 3;
  else
  if (keyCode == UP && combat_choix == 3 && touche == false && menu_List == 3) combat_choix = 2;
  else
  if (keyCode == DOWN && combat_choix == 3 && touche == false && menu_List == 3) combat_choix = 1;
 
 
  else
  if (keyCode == ENTER && combat_choix == 1 && touche == false && menu_List == 3){player_attaque = true; player_Mattaque = false; combat_tour();}
  else
  if (keyCode == ENTER && combat_choix == 2 && touche == false && menu_List == 3 && player_MP >= 5){player_MP = player_MP-5; player_attaque = false; player_Mattaque = true; combat_tour();}
  else
  if (keyCode == ENTER && combat_choix == 3 && touche == false && menu_List == 3){player_attaque = false; player_Mattaque = false; player_fuite();}
  

  touche = true;
}

public void keyReleased(){
  touche = false;
}

public void win(){
  menu_List = 6;
  
  background(0xff000000);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 40);
  text("Bravo !! Tu as d\u00e9fait le terrible Ganondorf !!" , 1080/5 , 720/3);
  text("Tu es maintenant le nouveau roi" , 1080/5 , 720/2);
  text("Press ENTER to return to stop" , 50 , 700);
}

public void gameOver_draw(){
  menu_List = 5;
  music_menu.stop();
  
  //R\u00e9initialisation stats perso
  player_maxHP = 50;
  player_maxMP = 25;
  player_maxDmg = 18;
  player_minDmg = 10; 
  player_minDmgM = 18;
  player_maxDmgM = 25;
  player_HP = 50;
  player_MP = 25;
  gold = 150;
  
  //R\u00e9initialisation carte
  map_x  = -1976;
  map_y = -2016;
  
  background(0xff000000);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 100);
  text("Game Over" , 1080/3 , 720/2);
}
//////VARIABLES/////////

//Images
PImage background_Menu;
PImage curseur_Menu;
PImage titre;

//Coordonn\u00e9es Background
int backgroundMenu_x = 0;
int backgroundMenu_y = -100;

//Coordonn\u00e9es Curseur
int menuCurseur_x = 15;
int menuCurseur_y;
int menuCurseur_yplay= 555;
int menuCurseur_ycommand = 605;
int menuCurseur_yquit = 655;
 
//Coordonn\u00e9es Texte
int menuPlay_x = 60;
int menuPlay_y = 580;

int menuCommand_x = 60;
int menuCommand_y = 630;

int menuQuit_x = 60;
int menuQuit_y = 680;

//Timer
int menu_timer = 0;
int menu_lastTimer = 0;
int menu_frame = 0;

//Boolean boutons
boolean boutonPlay = true;
boolean boutonCommand = false;
boolean boutonQuit = false;

//Variable curseur // 0 = Play | 1 = Command | 2 = Quit 
int menu_choix;

//Musique
SoundFile music_menu;

///////////////////////

public void menu_initialisation(){
  background_Menu = loadImage("background.jpg");
  curseur_Menu = loadImage("menu_curseur.png");
  music_menu = new SoundFile(this , "musicMenu.mp3");
  titre = loadImage("titre.png");
}

public void menu_update(){
  
//D\u00e9filement Background
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
  if(menu_choix == 0) menuCurseur_y = menuCurseur_yplay;
  if(menu_choix == 1) menuCurseur_y = menuCurseur_ycommand;
  if(menu_choix == 2) menuCurseur_y = menuCurseur_yquit;
}

public void menu_draw(){
  
  //Background
  image(background_Menu , backgroundMenu_x , backgroundMenu_y , 1600 , 1000);
  
  //Bouton Play
  fill(255, 255, 255);
  textFont(Arblanca_48 , 42);
  text("Play" , menuPlay_x , menuPlay_y);
  
  //Bouton Commands
  fill(255, 255, 255);
  textFont(Arblanca_48 , 42);
  text("Commands" , menuCommand_x , menuCommand_y);
  
  //Bouton Quit
  fill(255, 255, 255);
  textFont(Arblanca_48 , 42);
  text("Quit" , menuQuit_x , menuQuit_y);
  
  //Curseur
  image(curseur_Menu , menuCurseur_x , menuCurseur_y);
  
  // Titre
  image(titre , 0,0);
  
}
//////VARIABLES/////////

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
int map_x  = -1976;
int map_y = -2016;
int perso_x = 516;
int perso_y = 328;

//Redimentionnement Images
int token_x = 48;
int token_y = 64;

//Timer
int play_lastTimer = 0;
int play_timer = 0;
int play_frame = 0;

//Timer ennemis
int timerE = 0;
int lastTimerE = 0;

//////////////////////

public void play_initialisation(){
  Dos1 = loadImage("Dos1.PNG");
  Dos2 = loadImage("Dos2.png");
  Face1 = loadImage("Face1.png");
  Face2 = loadImage("Face2.png");
  Droite1 = loadImage("Droite1.png");
  Droite2 = loadImage("Droite2.png");
  Gauche1 = loadImage("Gauche1.png");
  Gauche2 = loadImage("Gauche2.png");
  Carte = loadImage("map_ent.jpg");
  Marchand = loadImage("merchant.png");
  boss_token = loadImage("boss.png");
}

public void play_update(){
  
  //D\u00e9placement carte gr\u00e2ce \u00e0 la fonction keyPressed tjrs activ\u00e9
  
  if(keyPressed){
  //Animation perso
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
  int popE = PApplet.parseInt(random(30000,50000));
  //Ennemis
  timerE = millis();
  if(timerE - lastTimerE > popE){
    combat_initialisation();
    combat_draw();
    lastTimerE = timerE;
  }
}

public void play_draw(){
  
  //Map
  background(0xff000000);
  image(Carte , map_x , map_y); //Reduction \u00e0 2921x2465
  image(Marchand, map_x+2500, map_y+1800, 80, 104);
  image(boss_token, map_x+2000, map_y+1200, 100, 125);
  
  //Personnage
  if(play_frame == 0 && keyCode == UP) image(Dos1 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 1 && keyCode == UP) image(Dos2 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 0 && keyCode == DOWN) image(Face1 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 1 && keyCode == DOWN) image(Face2 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 0 && keyCode == LEFT) image(Gauche1 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 1 && keyCode == LEFT) image(Gauche2 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 0 && keyCode == RIGHT) image(Droite1 , perso_x , perso_y , token_x , token_y);
  else
  if(play_frame == 1 && keyCode == RIGHT) image(Droite2 , perso_x , perso_y , token_x , token_y);
  else image(Face1 , perso_x , perso_y , token_x , token_y);
}
//////VARIABLES/////////
PImage shop_armure;
PImage shop_bague;
PImage shop_bouclier;
PImage shop_cristal;
PImage shop_epee;

boolean armure = false;
boolean bague = false;
boolean bouclier = false;
boolean cristal = false;
boolean epee = false;

int shop_choix=1;

//////////////////////

public void shop_draw(){
  shop_update();
}

public void shop_initialisation(){
  shop_armure = loadImage("shop_armure.png");
  shop_bague = loadImage("shop_bague.png");
  shop_bouclier = loadImage("shop_bouclier.png");
  shop_cristal = loadImage("shop_cristal.png");
  shop_epee = loadImage("shop_epee.png");
    
}

public void shop_update(){
  background(0);
  fill(255, 215, 0);
  textFont(Arblanca_48 , 42);
  text("OR:" , 850 , 50);
  text(gold, 910, 50);
  if(shop_choix == 1)image(curseur_Menu , 50 , 100);
  else
  if(shop_choix == 2)image(curseur_Menu , 50 , 230);
  else
  if(shop_choix == 3)image(curseur_Menu , 50 , 360);
  else
  if(shop_choix == 4)image(curseur_Menu , 50 , 490);
  else
  if(shop_choix == 5)image(curseur_Menu , 50 , 620);
  if(armure==false){
    image(shop_armure, 100, 80, 100, 89);
    fill(240);
    textFont(Arblanca_48 , 42);
    text("PV + 25                200 Or" , 200 , 130);
  }
  else
  if(armure==true){
    fill(240);
    textFont(Arblanca_48 , 42);
    text("D\u00e9j\u00e0 Achet\u00e9" , 100 , 130);
  }
  if(bague==false){
    image(shop_bague, 100, 210, 100, 89);
    fill(240);
    textFont(Arblanca_48 , 42);
    text("D\u00e9gats Magiques++  250 Or" , 200 , 260);
  }
  else
  if(bague==true){
    fill(240);
    textFont(Arblanca_48 , 42);
    text("D\u00e9j\u00e0 Achet\u00e9" , 100 , 260);
  }
  if(bouclier==false){
    image(shop_bouclier, 100, 340, 100, 89);
    fill(240);
    textFont(Arblanca_48 , 42);
    text("PV + 25                100 Or" , 200 , 390);
  }
  else
  if(bouclier==true){
    fill(240);
    textFont(Arblanca_48 , 42);
    text("D\u00e9j\u00e0 Achet\u00e9" , 100 , 390);
  }
  if(cristal==false){
    image(shop_cristal, 100, 470, 100, 89);
    fill(240);
    textFont(Arblanca_48 , 42);
    text("MP + 15                150 Or" , 200 , 520);
  }
  else
  if(cristal==true){
    fill(240);
    textFont(Arblanca_48 , 42);
    text("D\u00e9j\u00e0 Achet\u00e9" , 100 , 520);
  }
  if(epee==false){
    image(shop_epee, 100, 600, 100, 89);
    fill(240);
    textFont(Arblanca_48 , 42);
    text("D\u00e9gats++               150 Or" , 200 , 650);
  }
  else
  if(epee==true){
    fill(240);
    textFont(Arblanca_48 , 42);
    text("D\u00e9j\u00e0 Achet\u00e9" , 100 , 650);
  }
  fill(255);
  textFont(Arblanca_48 , 30);
  text("TAB pour retourner au jeu" , 700 , 680);
  text("CTRL pour se soigner: 50 Or" , 700 , 710);
}
  public void settings() {  size(1080,720);  smooth(0); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Billy_s_Adventure" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
