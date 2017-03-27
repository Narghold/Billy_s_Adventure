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

void keyReleased(){
  touche = false;
}

void win(){
  menu_List = 6;
  
  background(#000000);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 40);
  text("Bravo !! Tu as défait le terrible Ganondorf !!" , 1080/5 , 720/3);
  text("Tu es maintenant le nouveau roi" , 1080/5 , 720/2);
  text("Press ENTER to return to stop" , 50 , 700);
}

void gameOver_draw(){
  menu_List = 5;
  music_menu.stop();
  
  //Réinitialisation stats perso
  player_maxHP = 50;
  player_maxMP = 25;
  player_maxDmg = 18;
  player_minDmg = 10; 
  player_minDmgM = 18;
  player_maxDmgM = 25;
  player_HP = 50;
  player_MP = 25;
  gold = 150;
  
  //Réinitialisation carte
  map_x  = -1976;
  map_y = -2016;
  
  background(#000000);
  fill(255, 255, 255);
  textFont(Arblanca_48 , 100);
  text("Game Over" , 1080/3 , 720/2);
}