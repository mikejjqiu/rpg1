class DroppedItem extends GameObject {

  int type;
  weapon w;
  color c;
  float r;



  DroppedItem(float x, float y, int rx, int ry) {
    r = random(0, 100);


    float r1 = random(0, 2);
    if (r1 > 1) {
      type = GUN;
      weapons();
    }
    if (r1 <= 0.5) {
      type = HEALTH;
      hh.show(loc.x, loc.y, size);
    }


    hp = 1;
    loc = new PVector(x, y);
    v = new PVector(0, 0);
    size = 30;
    roomX = rx;
    roomY = ry;
    c = yellow;
  }

  void show() {

    if (type == GUN)fill(c);
    else if (type == HEALTH) fill(red);
    else noFill();

    noStroke();
    circle(loc.x, loc.y, size);

    if (type == GUN) weapons();
    if (type == HEALTH) hh.show(loc.x, loc.y, size);
  }


  void weapons() {

    if (r>=55&&r<=80) {
      w = new fireball(); 
      fireball.show(loc.x, loc.y, size);
    }
    if (r<=15) {
      w = new pistol();
      pistol.show(loc.x, loc.y, size);
    }
    if (r>15&&r<30) {
      w = new pewpew();
      pewpew.show(loc.x, loc.y, size);
    }
    if (r>=30&&r<55) {
      w = new shotgun();
      shotgun.show(loc.x, loc.y, size);
    }
    if (r>95&&r<=100) {
      w = new fireball1(); 
      fireball1.show(loc.x, loc.y, size);
    }
    if (r>80&&r<=95) {
      w = new fireball2(); 
      fireball2.show(loc.x, loc.y, size);
    }
  }
}
