void intro() {
  gi.show();
  //buttoni.show();
  //if (buttoni.clicked == true) mode = game;
  selection();
}



void selection() {
  Button h1, h3;
  h1 = new Button(dgreen, hero1);
  h3 = new Button(dgreen, hero3);

  h1.show2(width/3, height/2, 150, 225);
  h3.show2(2*width/3, height/2, 150, 225);

  if (h1.clicked) { 
    HERO = HERO1;
    mode = game;
  }

  if (h3.clicked) {
    HERO = HERO3;
    mode = game;
  }
}
