class images {
  
  PImage b;
 
  images(String a, PImage b1) {
    b1 = loadImage("items/"+a+".png");
    b = b1;
  }
  
  void show(float x, float y, float s) {
    image(b, x, y, s, s);
  }
}
