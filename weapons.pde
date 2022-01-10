class fireball extends weapon {
  fireball() {
    super(20, 2, mred, 30);
  }
}

class fireball1 extends weapon {
  fireball1() {
    super(30, 5, red, 50);
  }
  void shoot() {
    if (shottimer >= threshold) {
      for (int i = 0; i < 10; i++) {
        PVector aim = new PVector(mouseX-myPlayer.loc.x,mouseY-myPlayer.loc.y);
        aim.setMag(bulletspeed);
        myObjects.add(new bullet(aim, red, 40));
        aim.rotate(random(-PI,PI));
      }
      shottimer = 0;
    }
  }
}

class pistol extends weapon {
  pistol() {
    super(5, 5, blue, 10);
  }
}

class pewpew extends weapon {
  pewpew() {
    super(2, 4, mbrown, 4);
  }
}

class fireball2 extends weapon {
  fireball2() {
    super(5, 10, white, 3);
  }
}

class shotgun extends weapon {
  shotgun() {
    super(40, 10, mgreen, 5);
  }
  void shoot() {
    if (shottimer >= threshold) {
      for (int i = 0; i < 20; i++) {
        PVector aim = new PVector(mouseX-myPlayer.loc.x,mouseY-myPlayer.loc.y);
        aim.setMag(bulletspeed);
        myObjects.add(new bullet(aim, mgreen, 5));
        aim.rotate(random(-0.2,0.2));
      }
      shottimer = 0;
    }
  }
}
