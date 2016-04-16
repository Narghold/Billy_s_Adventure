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
  if(keyCode == ENTER && menu_List == 2) menu_List = 0;
  touche = true;
}

void keyReleased(){
  if(menu_List == 0) touche = false;
}