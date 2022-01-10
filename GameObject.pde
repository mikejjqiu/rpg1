class GameObject {

  PVector loc;
  PVector v;
  int hp, size;
  int maxHP, damage, speed;
  int roomX, roomY;
  int xp;

  GameObject() {
    loc = new PVector(width/2, height/2);
    v = new PVector(0, 0);
    hp = 1;
  }

  void show() {
  }

  void act() {
    loc.add(v);

    if (loc.x <= width*0.1) loc.x = width*0.1;
    if (loc.x >= width*0.9) loc.x = width*0.9;
    if (loc.y <= height*0.1) loc.y = height*0.1;
    if (loc.y >= height*0.9) loc.y = height*0.9;
  }

  // ============================================================
  boolean inRoomWith(GameObject myObj) {
    return (myObj.roomX == roomX && myObj.roomY == roomY);
  }


  // =============================================================
  boolean colliding(GameObject myObj) {
    float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
    return (inRoomWith(myObj) && d < size/2 + myObj.size/2);
  }
}
