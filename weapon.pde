class weapon {

  int shottimer, threshold, bulletspeed, s;
  color c;
  PVector aimVector;

  weapon() {
    shottimer = 0;
    threshold = 5;
    bulletspeed = 5;
    c = white;
    s = 5;
  }

  weapon(int thr, int ps, int c1, int s1) {
    shottimer = 0;
    threshold = thr;
    bulletspeed = ps;
    c = c1;
    s = s1;
  }

  void update() {
    shottimer++;
  }

  void shoot() {
    if (shottimer >= threshold) {
      aimVector = new PVector(mouseX-myPlayer.loc.x, mouseY-myPlayer.loc.y);
      aimVector.setMag(bulletspeed);
      myObjects.add(new bullet(aimVector, c, s));
      shottimer = 0;
    }
  }
}
