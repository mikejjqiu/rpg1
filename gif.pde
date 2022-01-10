class gif {
  int numframe;
  int currFrame;
  PImage[] g;
  PVector loc;
  int x, y, w, h;
  int s;


  gif(int frames, String a, String b, int x1, int y1, int w1, int h1, int s1) {
    numframe = frames;
    g = new PImage[frames];
    for (int i = 0; i < frames; i++) {
      g[i] = loadImage(a + i + b);
    }
    w = w1;
    h = h1;
    x = x1;
    y = y1;
    s = s1;
    //currFrame = 0;
  }

  gif(int frames, String a, String b, int s1) {
    numframe = frames;
    g = new PImage[frames];
    for (int i = 0; i < frames; i++) {
      g[i] = loadImage(a + i + b);
    }
    s = s1;

    currFrame = 0;
  }

  void show() {
    image(g[currFrame], x, y, w, h);
    if (frameCount % s == 0) {
      currFrame++;
    }
    if (currFrame == numframe) {
      currFrame = 0;
    }
  }

  void show1(float x1, float y1, float w1, float h1) {
    image(g[currFrame], x1, y1, w1, h1);
    if (frameCount % s == 0) {
      currFrame++;
    }
    if (currFrame == numframe) {
      currFrame = 0;
    }
  }
}
