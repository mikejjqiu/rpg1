// ================================
//final int AMMO = 0;
final int HEALTH = 1;
final int GUN = 2;

//modes ============================
int mode = 0;
final int intro = 1;
final int game = 2;
final int pause = 3;
final int gameover = 4;

//gif ===================
gif g_l, gi;

//button ====================
boolean mouseReleased;
boolean hadPressed;
Button buttoni, bHP, bS, bD;

//palette ===================================
color dgreen = #4a6fa5, mgreen = #3EBC19, green = #19FC0A;
color mred = #A02520, red = #D3231A;
color dblue = #1A3037, blue = #1DB7F2;
color lyellowg = #D7E3A1, dyellowg = #B6C17D;
color black = #030C12;
color dpurple = #2E2F51, lpurple = #8C7CA8;
color dbrown = #1C1912, mbrown = #4D4035, yellow = #EAE128;
color mgrey = #5A4F55, white = #FFFFFF;

// ===============================================
color e = #ff8100, f = #842555, t = #fbff00;
color heal = #000000;
color b1 = #0008ff, b2 = #176f11, b3 = #ff0000;

//gameobj ========================
ArrayList<GameObject> myObjects;

//player ==============
PImage pp;
boolean up, down, left, right, space;
player myPlayer;

// map ====================
PImage map;
color nRoom, sRoom, eRoom, wRoom;
PImage bg, floor;

// darkness =========================
ArrayList<Darkness> darkness;
Darkness lightlayer;

int imtimer;

// ======================================
PImage turret, fol1, fol2;

// =====================================
gif u1, d1, l1, r1;
gif u2, d2, l2, r2;
gif u3, d3, l3, r3;
gif boss1, boss2, boss3;

PImage boss_hb;

final int HERO1 = 1;
final int HERO3 = 3;
int HERO;

// ===========================
images shotgun, fireball, fireball1, fireball2, pewpew, pistol, hh;
PImage shotgun_, fireball_, fireball1_, fireball2_, pewpew_, pistol_, hh_;

PImage ss, fountain; 

PImage hero1, hero2, hero3;



void setup() {
  size(800, 600, P2D);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  //gif =====================
  g_l = new gif(3, "level/frame_", "_delay-0.2s.gif", width/4, height/2, 470, height, 7);
  gi = new gif(33, "intro/frame_", "_delay-0.08s.gif", width/2, height/2, 850, 850, 4);

  //button =============================
  buttoni = new Button("Start", width/2, 500, 200, 80, dblue, lyellowg);
  bHP = new Button();
  bS = new Button();
  bD = new Button();

  //player =================================================
  u1 = new gif(3, "hero/hero1/up/", ".png", 8);
  d1 = new gif(3, "hero/hero1/down/", ".png", 8);
  l1 = new gif(3, "hero/hero1/left/", ".png", 8);
  r1 = new gif(3, "hero/hero1/right/", ".png", 8);

  u3 = new gif(3, "hero/hero3/up/", ".png", 8);
  d3 = new gif(3, "hero/hero3/down/", ".png", 8);
  l3 = new gif(3, "hero/hero3/left/", ".png", 8);
  r3 = new gif(3, "hero/hero3/right/", ".png", 8);

  hero1 = loadImage("hero/hero1/down/1.png");
  hero3 = loadImage("hero/hero3/down/1.png");
  boss_hb = loadImage("healthbar.png");

  boss1 = new gif(5, "boss/boss1/frame_", "_delay-0.1s.png", 5);
  boss2 = new gif(5, "boss/boss2/frame_", "_delay-0.18s.png", 5);
  boss3 = new gif(16, "boss/boss3/frame_", "_delay-0.1s.png", 5);

  //objs ========================
  myObjects = new ArrayList<GameObject>();
  myPlayer = new player();
  myObjects.add(myPlayer);

  //myObjects.add(new enemy());

  // mode ====================
  mode = intro;

  // map ========================
  map = loadImage("map.png");
  bg = loadImage("floor.jpg");
  floor = loadImage("floor1.jpg");

  ss = loadImage("11.png");

  //darkness =====================
  darkness = new ArrayList<Darkness>();
  lightlayer = new Darkness(1, 1, 3);

  //load enemies
  int y = 0, x = 0; 
  while (y < map.height) {
    color Rcolor = map.get(x, y);
    if (Rcolor == e) {
      for (int i = 0; i < 4; i++) 
        myObjects.add(new boom(x, y));
    }
    if (Rcolor == f) { 
      for (int i = 0; i < 5; i++) 
        myObjects.add(new follower(x, y));
    }

    if (Rcolor == t) {
      for (int i = 0; i < 4; i++) myObjects.add(new turret(x, y));
    }

    if (Rcolor == b1) { 
      myObjects.add(new boss1(x, y));
    }

    if (Rcolor == b2) {
      myObjects.add(new boss2(x, y));
    }

    if (Rcolor == b3) {
      myObjects.add(new boss3(x, y));
    }

    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }

  //==================================================
  turret = loadImage("enemy/turret.png");
  fol1 = loadImage("enemy/f1.png");
  fol2 = loadImage("enemy/f2.png");
  fountain = loadImage("heal.png");

  // weapon ============================================
  shotgun = new images("2", shotgun_);
  fireball = new images("7", fireball_);
  fireball1 = new images("6", fireball1_);
  fireball2 = new images("1", fireball2_);
  pewpew = new images("5", pewpew_);
  pistol = new images("3", pistol_);
  hh = new images("8", hh_);
}

void draw() {

  //mode =======================
  if (mode==intro) {
    intro();
  } else if (mode==game) {
    game();
  } else if (mode==pause) {
    pause();
  } else if (mode==gameover) {
    gameover();
  } else {
    println("Error" + mode);
  }

  //button ========================
  bPressed();
}

void bPressed() {
  if (mousePressed) hadPressed = true;
  else if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (mouseReleased) mouseReleased = false;
}

void keyPressed() { //reorganize 
  if (key == 'w' || key == 'W') up = true;
  if (key == 's' || key == 'S') down = true;
  if (key == 'a' || key == 'A') left = true;
  if (key == 'd' || key == 'D') right = true;
  if (key ==  ' ') space = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') up = false;
  if (key == 's' || key == 'S') down = false;
  if (key == 'a' || key == 'A') left = false;
  if (key == 'd' || key == 'D') right = false;
  if (key ==  ' ') space = false;
}
