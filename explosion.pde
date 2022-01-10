class explosion extends GameObject {

  float tt = 255;
  int c;

  explosion(float x, float y, int s1, int c1) {
    hp = 1;
    loc = new PVector (x, y);
    v = new PVector (random(-3, 3), random(-3, 3));
    v.rotate(random(-1, 1));
    roomX = myPlayer.roomX;
    roomY = myPlayer.roomY;
    size = s1;
    c = c1;
  }

  void show() {
    colors();
    noStroke();
    square(loc.x, loc.y, int(random(size-10, size+10)));
  }

  void act() {
    loc.add(v);

    if (loc.x <= width*0.1) loc.x = width*0.1;
    if (loc.x >= width*0.9) loc.x = width*0.9;
    if (loc.y <= height*0.1) loc.y = height*0.1;
    if (loc.y >= height*0.9) loc.y = height*0.9;

    tt = tt - 80/size;
    if (tt <= 0) hp = 0;
  }

  void colors() {
    if (c == 1) 
      fill(255, random(0, tt), random(0, tt), tt);

    if (c == 2)
      fill(random(0, tt), 255, random(0, tt), tt);

    if (c == 3)
      fill(random(0, tt), random(0, tt), 255, tt);
      
    if (c == 4)
      fill(255, 255, random(0, tt), tt);
  }
}

void explode(int n, float x, float y, int s, int c) {
  for (int i = 0; i < n; i++) myObjects.add(new explosion(x, y, s, c));
}
