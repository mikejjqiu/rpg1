class player extends GameObject {

  weapon myWeapon;
  gif curAct;
  boolean ce = true;
  int e = 0;

  player() {
    super();
    speed = 10;
    roomX = 8;
    roomY = 1;
    size = 50;
    myWeapon = new shotgun();

    maxHP = hp = 100;
    xp = 30;
    damage = 0;

    if (HERO!=HERO1) curAct = d3;
    if (HERO!=HERO3) curAct = d1;
  }




  void show() {

    curAct.show1(loc.x, loc.y, size/1.5, size);
    Hbar();
  }


  void act() {
    super.act();

    if (HERO==HERO1) {
      movement(u1, d1, l1, r1);
    }
    if (HERO==HERO3) movement(u3, d3, l3, r3);


    myWeapon.update();
    if (mousePressed) {
      myWeapon.shoot();
    }

    if (ce) {
      checkExit(); 
      immunity();
    }
    droppeditem();
    cleanup();
  }



  void immunity() {
    imtimer++;
    if (imtimer > 180) {
      dmg();
    }
    if (imtimer <= 180) {
      noFill();
      stroke(dpurple);
      strokeWeight(3);
      ellipse(loc.x-1, loc.y, 50, 70);
    }
  }


  void dmg() {
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof ebullet && colliding(myObj)) {
        hp -= 40;
        myObj.hp = 0;
        imtimer = 0;
      }

      if (myObj instanceof boom && colliding(myObj)) {
        hp -= 30;
        myObj.hp = 0;
        imtimer = 0;
        explode(40, loc.x, loc.y, 17, 1);
      }

      if (myObj instanceof follower && colliding(myObj)) {
        hp -= 1;
      }
    }
  }

  void droppeditem() {
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof DroppedItem && colliding(myObj)) {
        DroppedItem item = (DroppedItem) myObj;
        if (item.type == GUN) {
          myWeapon = item.w;
          item.hp = 0;
        }
        if (item.type == HEALTH) {
          item.hp = 0;
          hp += 20;
          if (hp>maxHP) hp = maxHP;
        }
      }
    }
  }









  void checkExit() {
    if (nRoom != white && loc.y == height*0.1 && loc.x >= width/2 - 50 && loc.x <= width/2 + 50) {
      roomY--;
      loc = new PVector(width/2, height*0.9-10);
    }

    if (eRoom != white && loc.x == width*0.9 && loc.y >= height/2 - 50 && loc.y <= height/2 + 50) {
      roomX++;
      loc = new PVector(width*0.1+10, height/2);
    }

    if (sRoom != white && loc.y == height*0.9 && loc.x >= width/2 - 50 && loc.x <= width/2 + 50) {
      roomY++;
      loc = new PVector(width/2, height*0.1+10);
    }

    if (wRoom != white && loc.x == width*0.1 && loc.y >= height/2 - 50 && loc.y <= height/2 + 50) {
      roomX--;
      loc = new PVector(width*0.9-10, height/2);
    }
  }



  void movement(gif u, gif d, gif l, gif r) {

    v.setMag(speed);
    v.limit(speed);
    if (up) {
      v.y = -speed; 
      curAct = u;
    }
    if (down) {
      v.y = speed;    
      curAct = d;
    }
    if (left) {
      v.x = -speed; 
      curAct = l;
    }
    if (right) {
      v.x = speed; 
      curAct = r;
    }

    if (!up && !down) v.y = 0;
    if (!left && !right) v.x = 0;
  }


  void Hbar() {
    rectMode(CORNER);

    fill(black);
    rect(loc.x-size/2-2, loc.y-42, 54, 8);

    fill(red);
    rect(loc.x-size/2, loc.y-40, 50, 4);

    fill(green);
    float x = map(hp, 0, maxHP, 0, 50);
    rect(loc.x-size/2, loc.y-40, x, 4);
  }
}


void cleanup() {
  int i = 0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    if ( obj instanceof bullet || obj instanceof message || obj instanceof ebullet || obj instanceof DroppedItem) {
      if (obj.roomX != myPlayer.roomX && obj.roomY != myPlayer.roomY) {
        myObjects.remove(i);
        i--;
      }
    }
    i++;
  }
}
