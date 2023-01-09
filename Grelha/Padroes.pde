class Padrao {

  float x, y, w, h, seed;
  int grau;
  color c1, c2;

  Padrao(float x, float y, float w, float h, color c1, color c2, int grau, float seed) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    this.c2 = c2;
    this.grau = grau;
    this.seed = seed;
  }

  void display() {
  }

  void m1 (float x, float y, float w, float h) {
    int angleInc, angle;
    angle = 0;
    angleInc = 90;
    noStroke();
    c = c2;
    fill (c);
    rect(x, y, h, h);
    c = c1;
    fill (c);
    arc (x, y, h, h, radians(angle), radians(angle+angleInc));
  }

  void m2 (float x, float y, float w, float h) {
    int angleInc, angle;
    angle = 0;
    angleInc = 90;
    noStroke();
    c = c1;
    fill (c);
    rect(x, y, w, h);
    c = c2;
    fill (c);
    arc (x, y, w, h, radians(angle), radians(angle+angleInc));
  }

  void padrao1() {
    int nPerLine = 4 * grau;
    float wPG = w/nPerLine;
    float hPG = h/nPerLine;
    float extra = int(w/h);
    float extra2 = int(h/w);
    println(seed);
    float xP = x;
    float yP = y;

    if (seed%2 == 0) {
      for (int linha = 0; linha < nPerLine; linha++) {
        float y = yP + linha * hPG + hPG/2;
        for (int coluna = 0; coluna < nPerLine * extra; coluna++) {
          float x = xP + coluna * hPG + hPG/2;
          pushMatrix();
          float angulo = radians(90) * int(random(4));
          translate(x, y);
          rotate(angulo);
          if (random(1) < 0.5) {
            m1 (-hPG/2, -hPG/2, hPG, hPG);
          } else {
            m2 (-hPG/2, -hPG/2, hPG, hPG);
          }
          popMatrix();
        }
      }
    } else {
      for (int linha = 0; linha < nPerLine; linha++) {
        float y = yP + linha * wPG + wPG/2;
        for (int coluna = 0; coluna < nPerLine/2; coluna++) {
          float x = xP + coluna * wPG + wPG/2;
          pushMatrix();
          float angulo = radians(90) * int(random(4));
          translate(x, y);
          rotate(angulo);
          if (random(1) < 0.5) {
            m1 (-wPG/2, -wPG/2, wPG, wPG);
          } else {
            m2 (-wPG/2, -wPG/2, wPG, wPG);
          }
          popMatrix();
        }
      }
    }
  }

  void padrao2() {
    //Código modificado de  "maze_patterns by Liang Qi", retirado do site OpenProcessing.org || Link: https://openprocessing.org/sketch/1566631
    float cellSize, numOfCols, numOfRows;

    c = c1;
    stroke(c);
    strokeWeight(12/grau);
    strokeCap(PROJECT);

    cellSize = 30/grau;
    numOfCols = (h / cellSize);
    numOfRows = (h / cellSize);
    float extra = int(w/h);
    float extra2 = int(h/w);
    float xP = x;
    float yP = y;

    if (seed%2 == 0) {
      for (int y = 0; y < numOfRows; y++) {
        for (int x = 0; x < (numOfCols*extra); x++) {
          float randomNum = random(1);
          if (0.4 < randomNum) {
            line((xP + (x * cellSize)), yP + (y * cellSize), xP + ((x + 1) * cellSize), yP + ((y + 1) * cellSize));
            c = c1;
            stroke(c);
          } else {
            line(xP + ((x + 1) * cellSize), yP + (y * cellSize), xP + (x * cellSize), yP + ((y + 1) * cellSize));
            c = c2;
            stroke(c);
          }
        }
      }
    } else {
      for (int y = 0; y < numOfRows*extra2; y++) {
        for (int x = 0; x < (numOfCols); x++) {
          float randomNum = random(1);
          if (0.4 < randomNum) {
            line((xP + (x * cellSize)), yP + (y * cellSize), xP + ((x + 1) * cellSize), yP + ((y + 1) * cellSize));
            c = c1;
            stroke(c);
          } else {
            line(xP + ((x + 1) * cellSize), yP + (y * cellSize), xP + (x * cellSize), yP + ((y + 1) * cellSize));
            c = c2;
            stroke(c);
          }
        }
      }
    }
  }
}
