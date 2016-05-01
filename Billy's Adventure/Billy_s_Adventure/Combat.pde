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

int player_maxHP;
int player_maxMP;
int player_maxDmg;
int player_minDmg;
int player_HP;
int player_MP;
int gold;

void combat_draw(){
  
}

void combat_initialisation(){
  if(boss == true){
    ennemi_maxHP = 75;
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
  for(int i=0;i<1081;i++){
    stroke(0);
    fill(0);
    rect(0,0,i,120);
    rect(0,240,i,120);
    rect(0,480,i,120);
    rect(1080,120,-i,120);
    rect(1080,360,-i,120);
    rect(1080,600,-i,120);
  }
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

Boss
125 HP
10-20 Dmg
*/



//Timer
int play_lastTimer = 0;
int play_timer = 0;
int play_frame = 0; 

void play_update(){
 
  //Animation perso
  play_timer = millis();
  
  //Déplacement
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