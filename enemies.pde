class boom extends enemy {
  int timer = 0;
  boom(int x, int y) {
    super(100, 30, x, y, white, 5);
  }

  void show() {
    super.show();
    super.Hbar(100);
  }
  void act() {
    super.act();
    float d = dist(loc.x, loc.y, myPlayer.loc.x, myPlayer.loc.y);
    if (d<=300) {
      v = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
      v.setMag(5);
      timer++;
      if (timer == 5) {
        myObjects.add(new bullet(loc, v, green, 10));
        timer = 0;
      }
    }
    if (hp <= 0) 
      explode(20, loc.x, loc.y, 17, 1);
    else if (d <= size/2 + myPlayer.size/2 && imtimer < 180) {
      explode(20, loc.x, loc.y, 17, 1);
      hp = 0;
    }
  }
}


class turret extends enemy {
  int timer = 0;
  turret(int x, int y) {
    super(200, 100, x, y, black, 5);
  }
  void show() {
    image(turret, loc.x, loc.y, size, size);
    super.Hbar(200);
  }
  void act() {
    super.collision();
    timer++;
    if (timer==50) {
      PVector aim = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
      myObjects.add(new ebullet(loc.x-1, loc.y-27, aim, 10, int(random(7, 10))));
      timer = 0;
    }
  }
}

class follower extends enemy {
  follower(int x, int y) {
    super(100, 21, x, y, white, 1);
  }
  void show() {
    super.show();
    super.Hbar(100);
    if (v.x>0) image(fol1, loc.x-5, loc.y+5, 30, 30);
    else image(fol2, loc.x+4, loc.y-4, 30, 30);
  }
  void act() {
    super.act();
    v = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
    v.setMag(2);
  }
}





class boss1 extends enemy {

  int timer = 0;
  boss1(int x, int y) {
    super(1000, 200, x, y, 100, 600, 200);
  }

  void show() {
    super.Hbar1(1000, 604, 87);
    boss1.show1(600, 200, 210, 240);
  }

  void act() {

    timer++;
    if (timer>=50) {
      if (hp >= 500) {
        PVector aim = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
        myObjects.add(new ebullet(loc.x, loc.y, aim, 1, 2, 2.5));
        timer = 0;
      }


      if (hp<500) {
        if (timer>2) {
          for (int i = 0; i < 10; i++) {
            PVector aim = new PVector(random(-3, 3), random(-3, 3));
            myObjects.add(new ebullet(loc.x, loc.y, aim, 1, 7, 2.5));
            aim.rotate(random(-PI, PI));

            timer = 0;
          }
        }
      }
    }

    super.collision();
  }
}

class boss2 extends enemy {
  int timer = 0;
  boss2(int x, int y) {
    super(2000, 200, x, y, 200, 100, 400);
  }

  void show() {
    super.Hbar1(2000, 99, 285);
    boss2.show1(100, 400, 150, 220);
  }

  void act() {
    super.collision();
    timer ++;
    if (timer > 30) {
      PVector aim = new PVector(myPlayer.loc.x-loc.x, myPlayer.loc.y-loc.y);
      for (int i = 0; i < 5; i++) myObjects.add(new ebullet(loc.x, loc.y, aim, 0, 10, 1.5));

      if (hp>1000) timer = 0;
      if (hp<=1000 & timer > 90) timer = 0;
    }
  }
}

class boss3 extends enemy {

  int timer = 0;
  boss3(int x, int y) {
    super(5000, 300, x, y, 200, 300, 300);
  }

  void show() {
    super.Hbar1(5000, 183, 83);
    boss3.show1(200, 200, 300, 300);
  }

  void act() {
    timer ++;
    if (timer > 80) {
      fill(red, 200);
      rect(0, 0, width, height);
      hp-=300;
      myPlayer.hp-=30;
      timer = 0;
    }

    if (hp == 2500) if (myPlayer.hp <= 0.23*myPlayer.maxHP) myPlayer.hp = 1;

    if (hp <= 0) mode = gameover;
  }
  
  
}
