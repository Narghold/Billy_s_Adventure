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

void shop_draw(){
  shop_update();
}

void shop_initialisation(){
  shop_armure = loadImage("shop_armure.png");
  shop_bague = loadImage("shop_bague.png");
  shop_bouclier = loadImage("shop_bouclier.png");
  shop_cristal = loadImage("shop_cristal.png");
  shop_epee = loadImage("shop_epee.png");
    
}

void shop_update(){
  background(0);
  fill(255, 215, 0);
  textFont(Arblanca_48 , 42);
  text("OR:" , 850 , 50);
  text(or, 910, 50);
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
    text("Déjà Acheté" , 100 , 130);
  }
  if(bague==false){
    image(shop_bague, 100, 210, 100, 89);
    fill(240);
    textFont(Arblanca_48 , 42);
    text("Dégats Magiques++  250 Or" , 200 , 260);
  }
  else
  if(bague==true){
    fill(240);
    textFont(Arblanca_48 , 42);
    text("Déjà Acheté" , 100 , 260);
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
    text("Déjà Acheté" , 100 , 390);
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
    text("Déjà Acheté" , 100 , 520);
  }
  if(epee==false){
    image(shop_epee, 100, 600, 100, 89);
    fill(240);
    textFont(Arblanca_48 , 42);
    text("Dégats++               150 Or" , 200 , 650);
  }
  else
  if(epee==true){
    fill(240);
    textFont(Arblanca_48 , 42);
    text("Déjà Acheté" , 100 , 650);
  }
  fill(255);
  textFont(Arblanca_48 , 30);
  text("TAB pour retourner au jeu" , 700 , 680);
  text("CTRL pour se soigner: 50 Or" , 700 , 710);
}