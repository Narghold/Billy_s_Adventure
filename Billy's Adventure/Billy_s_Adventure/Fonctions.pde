void keyPressed(){
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
  if(keyCode == UP && menu_List == 1) map_y = map_y + 3;  //Déplacement carte //Scrolling
  else
  if(keyCode == DOWN && menu_List == 1) map_y = map_y - 3;
  else
  if(keyCode == LEFT && menu_List == 1) map_x = map_x + 3;
  else
  if(keyCode == RIGHT && menu_List == 1) map_x = map_x - 3;
  
  else
  if(keyCode == ENTER && menu_List == 1 && map_x <= -650 && map_x > -765 && map_y < -735 && map_y > -865){shop_initialisation(); menu_List = 4;}
  else
  if(keyCode == TAB && menu_List == 4){
    menu_List = 1;
    animation = 0;
  }
  else
  if(keyCode == ENTER && menu_List == 1 && touche == false && map_x <= -1450 && map_x > -1570 && map_y < -85 && map_y > -245){ boss = true; combat_initialisation(); menu_List = 3;}
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
  if (keyCode == ENTER && shop_choix == 1 && touche == false && menu_List == 4 && or>=200 && armure == false){armure = true; or = or-200; player_maxHP = player_maxHP + 25; player_HP = player_HP + 25;}
  else
  if (keyCode == UP && shop_choix == 2 && touche == false && menu_List == 4) shop_choix = 1;
  else
  if (keyCode == DOWN && shop_choix == 2 && touche == false && menu_List == 4) shop_choix = 3;
  else
  if (keyCode == ENTER && shop_choix == 2 && touche == false && menu_List == 4 && or>=250 && bague == false){bague = true; or = or-250; player_minDmgM = 25; player_maxDmgM = 35;}
  else
  if (keyCode == UP && shop_choix == 3 && touche == false && menu_List == 4) shop_choix = 2;
  else
  if (keyCode == DOWN && shop_choix == 3 && touche == false && menu_List == 4) shop_choix = 4;
  else
  if (keyCode == ENTER && shop_choix == 3 && touche == false && menu_List == 4 && or>=100 && bouclier == false){bouclier = true; or = or-100; player_maxHP = player_maxHP + 25; player_HP = player_HP + 25;}
  else
  if (keyCode == UP && shop_choix == 4 && touche == false && menu_List == 4) shop_choix = 3;
  else
  if (keyCode == DOWN && shop_choix == 4 && touche == false && menu_List == 4) shop_choix = 5;
  else
  if (keyCode == ENTER && shop_choix == 4 && touche == false && menu_List == 4 && or>=150 && cristal == false){cristal = true; or = or-150; player_maxMP = player_maxMP + 15; player_MP = player_MP + 15;}
  else
  if (keyCode == UP && shop_choix == 5 && touche == false && menu_List == 4) shop_choix = 4;
  else
  if (keyCode == DOWN && shop_choix == 5 && touche == false && menu_List == 4) shop_choix = 1;
  else
  if (keyCode == ENTER && shop_choix == 5 && touche == false && menu_List == 4 && or>=150 && epee == false){epee = true; or = or-150; player_minDmg = 18; player_maxDmg = 25;}
  else
  if (keyCode == CONTROL && touche == false && or>= 50){player_HP = player_maxHP; player_MP = player_maxMP; or=or-50;}
  
  
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

void keyReleased(){
  touche = false;
}