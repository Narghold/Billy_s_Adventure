//////VARIABLES/////////

boolean boss = false;
int ennemi;
                      ///////POUR L'ENNEMI///////
int ennemi_maxHP;            //Total de HP
int ennemi_maxMP;            //Total de MP
int ennemi_maxDmg;           //Borne haute de l'interval de dégats
int ennemi_minDmg;           //Borne basse de l'interval de dégats
float ennemi_esquive;        //Probalité de réussite d'esquiver l'attaque du joueur
int ennemi_HP;               //Nombre de HP en cours pouvant varier
int ennemi_MP;               //Nombre de MP en cours pouvant varier
int ennemi_gold;             //Gold gagnées

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
float player_fuite = 0.5;    //Probabilité de réussite pour fuir le combat

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

void combat_draw(){
  
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

void combat_initialisation(){
  combat_update();
  if(boss == true){
    ennemi = 0;
    ennemi_maxHP = 125;
    ennemi_maxDmg = 20;
    ennemi_minDmg = 10;
    ennemi_esquive = 0.5;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = 10000;
    combat_ennemi =  loadImage("boss.png");
  }
  else
  ennemi = int(random(1,9)); //| 1 = Pikachu | 2 = Mario Bros | 3 = Batman | 4 = Thor | 5 = Gandhalf | 6 = Link | 7 = Saitama | 8 = Goku | 9 = Vegeto 
  
  if(ennemi == 1){
    ennemi_maxHP = 35;
    ennemi_maxDmg = 8;
    ennemi_minDmg = 4;
    ennemi_esquive = 0.2;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("pikachu.png");
  }
  else
  if(ennemi == 2){
    ennemi_maxHP = 50;
    ennemi_maxDmg = 8;
    ennemi_minDmg = 6;
    ennemi_esquive = 0.3;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("batman.png");
  }
  else
  if(ennemi == 3){
    ennemi_maxHP = 200;
    ennemi_maxDmg = 4;
    ennemi_minDmg = 0;
    ennemi_esquive = 0.3;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("thor.png");
  }
  else
  if(ennemi == 4){
    ennemi_maxHP = 100;
    ennemi_maxDmg = 10;
    ennemi_minDmg = 0;
    ennemi_esquive = 0.3;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("gandalf.png");
  }
  else
  if(ennemi == 5){
    ennemi_maxHP = 50;
    ennemi_maxDmg = 12;
    ennemi_minDmg = 6;
    ennemi_esquive = 0.5;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("link.png");
  }
  else
  if(ennemi == 6){
    ennemi_maxHP = 250;
    ennemi_maxDmg = 15;
    ennemi_minDmg = 0;
    ennemi_esquive = 0.6;
    ennemi_HP = ennemi_maxHP;
    ennemi_gold = ennemi*10;
    combat_ennemi =  loadImage("goku.png");
  }
  else
  if(ennemi == 7){
    ennemi_maxHP = 300;
    ennemi_maxDmg = 25;
    ennemi_minDmg = 0;
    ennemi_esquive = 0.65;
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

void combat_update(){
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



void combat_transition(){
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

void combat_stats(){
  if(combat_choix==1 && animation == 6)image(curseur_Menu , 100 , 460);
  if(combat_choix==2 && animation == 6)image(curseur_Menu , 100 , 530);
  if(combat_choix==3 && animation == 6)image(curseur_Menu , 100 , 600);
  if(attaque == false){
    player_dmg = 0;
  }
    

}


void player_fuite(){
  fuite = random(0,1);
  if(fuite<player_fuite){
    menu_List = 1;
    animation = 0;
  }
}

void ennemi_esquive(){
  Eesquive = random(0,1);
  if(Eesquive<ennemi_esquive){
    player_dmg = 0;
    esquive = true;
    ennemi_priority = true;
  }
  else esquive = false;
}

void ennemi_attaque(){
  Eattaque = int(random(ennemi_minDmg,ennemi_maxDmg+1));
  player_HP = player_HP - Eattaque;
}

void combat_tour(){
  if(boss == true){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.33){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 1){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.6){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 2){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.40){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 3){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.15){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 4){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.5){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 5){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.35){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 6){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.25){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(ennemi == 7){
    ennemi_choix= random(0,1);
    if(ennemi_choix<0.2){attaque = false; ennemi_esquive();}
    else {ennemi_attaque(); attaque = true;}
  }
  if(player_Mattaque == true){
    player_dmg = int(random(player_minDmgM, player_maxDmgM + 1));
    ennemi_HP = ennemi_HP - player_dmg;
  }
  else
  if(player_attaque == true){
        player_dmg = int(random(player_minDmg, player_maxDmg + 1));
        ennemi_HP = ennemi_HP - player_dmg;
  }
  if(ennemi_priority == true){
    
  }
}