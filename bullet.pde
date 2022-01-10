class bullet extends GameObject {

  PVector aimVector;
  color c;

  bullet(PVector aim1, color c1, int size1) {
    loc = myPlayer.loc.copy();
    aimVector = aim1;
    c = c1;
    size = size1;
    hp = 1;

    roomX = myPlayer.roomX;
    roomY = myPlayer.roomY;
  }

  bullet(PVector loc1, PVector aim1, color c1, int size1) {
    loc = loc1;
    aimVector = aim1;
    c = c1;
    size = size1;
    hp = 1;

    roomX = myPlayer.roomX;
    roomY = myPlayer.roomY;
  } 



  void show() {
    if (size<40) {
      fill(c);
      noStroke();
      circle(loc.x, loc.y, size);
    }
  }

  void act() {
    loc.add(v);
    v.add(aimVector);
    v.setMag(aimVector.mag());
    if (loc.x < width*0.1 || loc.x > width*0.9 || loc.y < height*0.1 || loc.y > height*0.9) {
      hp = 0;
      explode(20, loc.x, loc.y, 4, 1);
    }
    explode(1, loc.x, loc.y, 1, 2);
    if (size>=30) explode(10, loc.x, loc.y, 5, 1);
  }
}
