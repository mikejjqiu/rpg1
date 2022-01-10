class Darkness {

  float opacity;
  float x, y, size;

  Darkness(float x1, float y1, float s1) {
    x = x1;
    y = y1;
    size = s1;
    opacity = random(0, 255);
  }

  void show() {
    
    x = 0;
    y = 0;
    pushMatrix();
    rectMode(CORNER);
    float X = width/size;
    float Y = height/size;
    for (int i = 0; i < X*Y; i++) {

      float d = dist(myPlayer.loc.x, myPlayer.loc.y, x, y);
      opacity = map(d, 0, 600, 0, 255);
      fill(0, 0, opacity/20, opacity);
      noStroke();
      square(x, y, size);
      x = x + size;
      if (x >= width) {
        x = 0;
        y = y + size;
      }
    }
    popMatrix();
  }

  void act() {
  }
}
