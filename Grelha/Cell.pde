class Cell {

  float x, y, w, h, wC, hC, inc, seed;
  color c;

  Cell(float x, float y, float w, float inc, color c, float seed) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.inc = inc;
    this.c = c;
    this.seed = seed;
  }

  void display() {
    if (seed%2 == 0) {
      desenhaCelulaH ();
    } else {
      desenhaCelulaV ();
    }
  }

  void desenhaCelulaH () {
    wC = w*inc;
    hC = w;
    noStroke();
    fill (c);
    rect (x, y, wC, hC);
  }

  void desenhaCelulaV () {
    wC = w;
    hC = w*inc;
    noStroke();
    fill (c);
    rect (x, y, wC, hC);
  }

  float getW() {
    if (seed%2 == 0) {
      wC = w*inc;
      hC = w;
    } else {
      wC = w;
      hC = w*inc;
    }
    return wC;
  }

  float getH() {
    if (seed%2 == 0) {
      wC = w*inc;
      hC = w;
    } else {
      wC = w;
      hC = w*inc;
    }
    return hC;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
}
