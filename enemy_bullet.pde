class ebullet extends GameObject {

  PVector aimVector;
  PImage[] g;
  float cc;

  ebullet(float x, float y, PVector aim1, int size1, int s) {
    loc = new PVector(x, y);
    aimVector = aim1;
    size = size1;
    hp = 1;
    v = new PVector(0, 0);
    v.rotate(random(-1, 1));
    roomX = myPlayer.roomX;
    roomY = myPlayer.roomY;
    speed = s;
  }

  ebullet(float x, float y, PVector aim1, int size1, int s, float c) {
    loc = new PVector(x, y);
    aimVector = aim1;
    size = size1;
    hp = 1;
    v = new PVector(0, 0);
    v.rotate(random(-1, 1));
    roomX = myPlayer.roomX;
    roomY = myPlayer.roomY;
    speed = s;
    cc = c;
  }

  void show() {
    fill(white);
    circle(loc.x, loc.y, size);
  }


  void act() {
    loc.add(v);
    v.add(aimVector);
    v.setMag(speed);
    colors();
    explode(10, loc.x, loc.y, 3, 4);
    if (loc.x <= width*0.1 || loc.x >= width*0.9 || loc.y <= height*0.1 || loc.y >= height*0.9) {
      hp = 0;
    }
  }

  void colors() {
    int x = 0;
    if (cc<1) x = 1;
    if (cc>1 && cc<2) x = 2;
    if (cc>2) x = 3;

    explode(3, loc.x, loc.y, 2, x);


    //    explode(10, loc.x, loc.y, 4, 2);


    //    explode(10, loc.x, loc.y, 4, 3);
  }
}
