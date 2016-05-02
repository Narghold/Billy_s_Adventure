//////Variables//////
boolean boss = false;
int ennemi;

int ennemi_maxHP;
int ennemi_maxMP;
int ennemi_maxDmg;
int ennemi_minDmg;
float ennemi_esquive;
int ennemi_HP;
int ennemi_MP;

int player_maxHP = 50;
int player_maxMP = 25;
int player_maxDmg = 18;
int player_minDmg = 10;
int player_minDmgM = 18;
int player_maxDmgM = 25;
int player_HP = 50;
int player_MP = 25;
int gold = 0;

int animation = 0;

PImage combat_background;

////////////////////////////

void combat_draw(){
  
  combat_update();
  combat_transition();
  //println(mouseX);
  //print("  " + mouseY);
  
  
  
}

void combat_initialisation(){
  combat_update();
  if(boss == true){
    ennemi_maxHP = 125;
    ennemi_maxDmg = 20;
    ennemi_minDmg = 10;
    ennemi_esquive = 1/2;
    ennemi_HP = ennemi_maxHP;
  }
  else
  ennemi = int(random(1,3.99));
  
  if(ennemi == 1){                    //| 1 = Knight | 2 = Orc | 3 = Mage |
    ennemi_maxHP = 75;
    ennemi_maxDmg = 8;
    ennemi_minDmg = 4;
    ennemi_esquive = 1/3;
    ennemi_HP = ennemi_maxHP;
  }
  else
  if(ennemi == 2){
    ennemi_maxHP = 50;
    ennemi_maxDmg = 12;
    ennemi_minDmg = 8;
    ennemi_esquive = 1/2;
    ennemi_HP = ennemi_maxHP;
  }
  else
  if(ennemi == 3){
    ennemi_maxHP = 75;
    ennemi_maxDmg = 16;
    ennemi_minDmg = 12;
    ennemi_esquive = 3/4;
    ennemi_HP = ennemi_maxHP;
  }
  combat_background = loadImage("Battle_Background.jpg");
  //combat_box1 = 
  //combat_box2 = 
  //player =
   
 
}


/*
Knight
75 HP
4-8 Dmg

Orc
50 HP
8-12 Dmg

Mage
25 HP
12-16 Dmg

Objets
Epée de héro -> 18-25 Dmg          150 Or
Bouclier d'or -> +25 HP            100 Or
Armure céleste -> +25 HP           200 Or
Bague de Foudre -> 25-35 MP_Dmg    250 Or
Crystal de Mana -> +15 MP          150 Or

Loot
15-35 Or

*/



//Timer
int combat_lastTimer = 0;
int combat_timer = 0;
int combat_frame = 0; 

///////////////////////////

void combat_update(){
  combat_timer = millis();
  if(combat_timer - combat_lastTimer > 100){
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
    stroke(0);
    fill(0);
    if(combat_frame == 1 && animation == 0){ rect(0,0,1080,120); animation = 1;}
    if(combat_frame == 0 && animation == 2){ rect(0,120,1080,120); animation = 3;}
    if(combat_frame == 1 && animation == 4){ rect(0,240,1080,120); animation = 5;}
    if(combat_frame == 0 && animation == 5){ rect(0,360,1080,120); animation = 6;}  
    if(combat_frame == 1 && animation == 3){ rect(0,480,1080,120); animation = 4;}
    if(combat_frame == 0 && animation == 1){ rect(0,600,1080,120); animation = 2;}
    if(animation == 6)image(combat_background, 0, 0);
}