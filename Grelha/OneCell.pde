class OneCell {

  int sMax = 10;
  PShape[] pAleatorio = new PShape [sMax];
  int pAlMax, pAlInc;
  float x, y, w, h;
  color c1, c2, c3, c4;
  color cFac1, cFac2, cFac3, cFac4;
  color cP, cS;
  String fac, nAluno;


  OneCell(float x, float y, float w, float h, String fac, String nAluno) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.fac = fac;
    this.nAluno = nAluno;
    pAlMax = 3;
    for (int i = 0; i< sMax; i++) {
      pAleatorio[i] = loadShape("s"+i+".svg");
      println("s"+i+".svg");
    }
  }


  void padrao1() {
    noStroke();
    float wCel = h/pAlMax;
    definirCores();
    c1 = cFac1;
    c2 = cFac2;
    c3 = cFac3;
    c4 = cFac4;
    float xP = x;
    float yP = y;

    for (int linha = 0; linha< pAlMax; linha++) {
      float yC = yP + linha * wCel;

      for (int coluna = 0; coluna< pAlMax; coluna++) {
        float xC = xP + coluna * wCel;

        int nS = int (random(10));
        float r1, r2;
        r1 = random(1);
        r2 = random(1);
        if (r1 < 0.25) {
          cP = c2;
          if (r2 < 0.33) {
            cS = c1;
          } else if (r2 > 0.33 && r2 < 0.66) {
            cS = c3;
          } else {
            cS = c4;
          }
        } else if (r1 > 0.25 && r1 < 0.5) {
          cP = c4;
          if (r2 < 0.33) {
            cS = c3;
          } else if (r2 > 0.33 && r2 < 0.66) {
            cS = c1;
          } else {
            cS = c2;
          }
        } else if (r1 > 0.5 && r1 < 0.75) {
          cP = c1;
          if (r2 < 0.33) {
            cS = c4;
          } else if (r2 > 0.33 && r2 < 0.66) {
            cS = c2;
          } else {
            cS = c3;
          }
        } else {
          cP = c3;
          if (r2 < 0.33) {
            cS = c2;
          } else if (r2 > 0.33 && r2 < 0.66) {
            cS = c4;
          } else {
            cS = c1;
          }
        }

        fill (cP);
        rect(xC, yC, wCel, wCel);
        println ("rnadom number: " + nS + " | X: " + cP + " | Y: " + y);
        pushMatrix();
        pAleatorio[nS].disableStyle();
        fill (cS);
        //shapeMode(CORNER);
        shape(pAleatorio[nS], xC, yC, wCel, wCel);
        //shapeMode(CENTER);
        popMatrix();
        nS++;
        if (nS>8) {
          nS = 0;
        }
      }
    }
  }

  void definirCores () {
  //DEFINIÇÃO PALETA DE CORES
  //FLUC
  if (fac == "Faculdade de Letras") {
    cFac1 = color(0, 69, 128);
    cFac2 = color(255);
    cFac3 = color(20, 120, 200);
    cFac4 = color(0, 30, 80);
  }

  //FDUC
  if (fac == "Faculdade de Direito") {
    cFac1 = color(237, 51, 36);
    cFac2 = color(0);
    cFac3 = color(175, 30, 15);
    cFac4 = color(75, 10, 20);
  }

  //FMUC
  if (fac == "Faculdade de Medicina") {
    cFac1 = color(255, 196, 37);
    cFac2 = color(255);
    cFac3 = color(235, 166, 67);
    cFac4 = color(100, 90, 15);
  }

  //FCTUC
  if (fac == "Faculdade de Ciências e Tecnologias") {
    cFac1 = color(0, 150, 215);
    cFac2 = color(255);
    cFac3 = color(30, 230, 240);
    cFac4 = color(10, 70, 100);
    cFac5 = color(138, 140, 140);
  }

  //FFUC
  if (fac == "Faculdade de Farmácia") {
    cFac1 = color(83, 36, 127);
    cFac2 = color(255);
    cFac3 = color(130, 70, 200);
    cFac4 = color(90, 65, 220);
  }


    //FEUC
    if (fac == "Faculdade de Economia") {
      cFac1 = color(237, 51, 36);
      cFac2 = color(255);
      cFac3 = color(255, 100, 50);
      cFac4 = color(255, 220, 200);
    }

    //FPCEUC
    if (fac == "Faculdade de Psicologia e Ciências da Educação") {
      cFac1 = color(249, 157, 49);
      cFac2 = color(255);
      cFac3 = color(239, 199, 100);
      cFac4 = color(130, 100, 50);
    }

    //FCDEFUC
    if (fac == "Faculdade de Ciências do Desporto e Educação Física") {
      cFac1 = color(85, 25, 0);
      cFac2 = color(255, 246, 220);
      cFac3 = color(175, 125, 50);
      cFac4 = color(225, 165, 120);
    }

    //CA
    if (fac == "Colégio das Artes") {
      cFac1 = color(138, 140, 140);
      cFac2 = color(255);
      cFac3 = color(35);
      cFac4 = color(200);
    }

    //III
    if (fac == "Instituto de Investigação Interdisciplinar") {
      cFac1 = color(77, 134, 142);
      cFac2 = color(255);
      cFac3 = color(107, 234, 242);
      cFac4 = color(7, 34, 42);
    }
  }
}
