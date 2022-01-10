class message extends GameObject {

  message(float x, float y, String t) {

    hp = 1;
    textSize(50);
    fill(0);
    text(t, x, y);

    y--;
    if (y <= 0) hp = 0;
  }
}
