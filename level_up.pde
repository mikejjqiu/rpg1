void pause() {
  background(dblue);
  g_l.show();
  image(ss, 374, 213, 240, 180); 

  text_show();
  buttons();
  //fill(white);
  //text(mouseX, 600, 200);
  //text(mouseY, 680, 200);

  if (key == 'r' || key == 'R') mode = game;
}


void texts(String a, int y) {
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(lpurple);
  text(a, 3*width/4 + 2, y+2);

  fill(white);
  text(a, 3*width/4, y);
}

void text_show() {
  texts("YOU HAVE "+ myPlayer.xp + " XP", 100);
  texts("HP: "+ myPlayer.maxHP, 220);
  texts("SPEED: "+ myPlayer.speed, 320);
  texts("DAMAGE: "+ myPlayer.damage, 420);
}

void buttons() {
  bHP.show1(720, 223, 30);
  bS.show1(721, 323, 30);
  bD.show1(723, 423, 30);

  if (bHP.clicked == true && myPlayer.xp >= 1) {
    myPlayer.xp -= 1;
    myPlayer.maxHP += 10;
    myPlayer.hp = myPlayer.maxHP;
  }

  if (bS.clicked == true && myPlayer.xp >= 10 && myPlayer.speed < 6) {
    myPlayer.xp -= 10;
    myPlayer.speed += 1;
  }

  if (bD.clicked == true && myPlayer.xp >= 5) {
    myPlayer.xp -= 5;
    myPlayer.damage += 1;
  }
}
