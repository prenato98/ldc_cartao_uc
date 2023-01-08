class ThreeCell {

  int sMax = 10;
  int pAlMax, pAlInc;
  float x, y, w, h, seed;
  color c1, c2, c3, c4;
  color cFac1, cFac2, cFac3, cFac4;
  color cP, cS;
  String fac, nAluno;
  PShape simboloFac;

  ThreeCell(float x, float y, float w, float h, String fac, float seed) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.fac = fac;
    simboloFac = loadShape("simboloDep.svg");
    this.seed = seed;
  }

  void padrao1() {
    definirCores();
    c1 = cFac1; //COR PRINCIPAL
    c2 = cFac4; //COR FUNDO CÉLULA
    c3 = cFac2; //COR SECUNDÁRIA - BRANCO EM ECONOMIA, PRETO EM DIREITO E AMARELO EM DESPORTO
    c4 = cFac3; //COR TERCIÁRIA

    //DEFINIÇÃO TAMANHO SÍMBOLO


    //FUNDO
    fill(c2);
    rect(x, y, w, h);
    float wFundo;
    if (seed%2 == 0) {
      wFundo = h;
    } else {
      wFundo = w;
    }

    //FILLER - SE NECESSÁRIO (PROVAVELMENTE VAI SER)

    //FIM DE FILLER

    //BACKGROUND SÍMBOLO - SE NECESSÁRIO (PROVAVELMENTE VAI SER)

    
    fill(c4);
    ellipse(x+w/2, y+h/2, wFundo, wFundo);
    fill(c2);
    ellipse(x+w/2, y+h/2, wFundo*0.9, wFundo*0.9);
    fill(c3);
    ellipse(x+w/2, y+h/2, wFundo*0.8, wFundo*0.8);
    //FIM DE BACKGROUND

    //SÍMBOLO
    pushMatrix();
    simboloFac.disableStyle();

    float sizeSym;
    float sizeSymF;
    if (seed%2 == 1) {
      sizeSym = w;
      sizeSymF = sizeSym*0.75;
      translate(sizeSymF/6, y+((h/2)-sizeSymF/2));
    } else {
      sizeSym = h;
      sizeSymF = sizeSym*0.75;
      translate(x+((w/2)-sizeSymF/2), sizeSymF/5.6);
    }
    /*fill(c3);
     shape(simboloFac, x, y, sizeSymF*3, sizeSymF*3);*/
    fill(c1);
    shape(simboloFac, x, y, sizeSymF, sizeSymF);
    println("Tamanho: " + sizeSymF);
    popMatrix();
    ellipseMode(CENTER);
    fill (c3);
    ellipse (x+w/2, y+h/2, sizeSymF/3, sizeSymF/3);
    ellipseMode(CORNER);
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
