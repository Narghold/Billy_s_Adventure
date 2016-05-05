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
  if(keyCode == ENTER && menu_List == 1 && map_x <= -650 && map_x > -765 && map_y < -735 && map_y > -865){ menu_List = 4;}
  else
  if(keyCode == ENTER && menu_List == 1 && map_x <= -1450 && map_x > -1570 && map_y < -85 && map_y > -245){ boss = true; combat_initialisation(); menu_List = 3;}
  else
  if(keyCode == ENTER && menu_List == 1){boss = false; combat_initialisation(); menu_List = 3;}
  else
  if(keyCode == ENTER && menu_List == 2){
    menu_List = 0;
    menu_choix = 0;
  }
  else
  if (keyCode == UP && shop_choix == 1 && touche == false && menu_List == 4) shop_choix = 5; 
  else
  if (keyCode == DOWN && shop_choix == 1 && touche == false && menu_List == 4) shop_choix = 2;
  else
  if (keyCode == ENTER && shop_choix == 1 && touche == false && menu_List == 4 && or>=200){armure = true; or = or-200; player_maxHP = player_maxHP + 25; player_HP = player_HP + 25;}
  else
  if (keyCode == UP && shop_choix == 2 && touche == false && menu_List == 4) shop_choix = 1;
  else
  if (keyCode == DOWN && shop_choix == 2 && touche == false && menu_List == 4) shop_choix = 3;
  else
  if (keyCode == ENTER && shop_choix == 2 && touche == false && menu_List == 4 && or>=250){bague = true; or = or-250; player_minDmgM = 25; player_maxDmgM = 35;}
  else
  if (keyCode == UP && shop_choix == 3 && touche == false && menu_List == 4) shop_choix = 2;
  else
  if (keyCode == DOWN && shop_choix == 3 && touche == false && menu_List == 4) shop_choix = 4;
  else
  if (keyCode == ENTER && shop_choix == 3 && touche == false && menu_List == 4 && or>=100){bouclier = true; or = or-100; player_maxHP = player_maxHP + 25; player_HP = player_HP + 25;}
  else
  if (keyCode == UP && shop_choix == 4 && touche == false && menu_List == 4) shop_choix = 3;
  else
  if (keyCode == DOWN && shop_choix == 4 && touche == false && menu_List == 4) shop_choix = 5;
  else
  if (keyCode == ENTER && shop_choix == 4 && touche == false && menu_List == 4 && or>=150){cristal = true; or = or-150; player_maxMP = player_maxMP + 15; player_MP = player_MP + 15;}
  else
  if (keyCode == UP && shop_choix == 5 && touche == false && menu_List == 4) shop_choix = 4;
  else
  if (keyCode == DOWN && shop_choix == 5 && touche == false && menu_List == 4) shop_choix = 1;
  else
  if (keyCode == ENTER && shop_choix == 5 && touche == false && menu_List == 4 && or>=150){epee = true; or = or-150; player_minDmg = 18; player_maxDmg = 25;}
  
 
  if(keyCode == TAB){
    menu_List = 1;
    animation = 0;
  }
  touche = true;
}

void keyReleased(){
  touche = false;
}