class OneCellAl {

  int sMax = 10;
  PShape[] pAleatorio = new PShape [sMax];
  PShape[] icones = new PShape[10];
  int pAlMax, pAlInc;
  float x, y, w, h;
  color c1, c2, c3, c4;
  color cFac1, cFac2, cFac3, cFac4;
  color cP, cS;
  String fac, nAluno;



  OneCellAl(float x, float y, float w, float h, String fac, String nAluno) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.fac = fac;
    this.nAluno = nAluno;

    //CARREGAR SHAPES
    for (int i = 0; i < 10; i++) {
      icones[i] = loadShape(i + ".svg"); // 4.svg
      // TODO preencher array de icones
    }
  }


  void padrao1() {
    //INCREMENTO DA ESCALA DOS OBJETOS
    float s = 1;
    float incS = 0.1;
    String ano = anoEntrada();
    definirCores();
    c1 = cFac1;
    c2 = cFac4;
    c3 = cFac3;
    c4 = cFac2;
    noStroke();
    color[] colors  = {c1, c2, c3, c4};


    for (int i = 0; i < ano.length(); i++) {
      float wP = w*s;
      float hP = h*s;
      char c = ano.charAt(i);
      int indiceIcone = Integer.valueOf(c + "");
      pushMatrix();
      icones[indiceIcone].disableStyle();

      //shapeMode(CENTER);

      //CONDIÇÃO QUE RODA O TERCEIRO DÍGITO EM ALGUMAS SITUAÇÕES
      if (i == 2) {
        if (Integer.valueOf(c + "") == 2 || Integer.valueOf(c + "") == 3 || Integer.valueOf(c + "") == 9) {
          translate(x+(w*0.75), y+(h*0.75));
          rotate(radians(45));
          translate(-(x+(w*0.85)), -(y+(h*0.5)));
        }
      }
      fill(colors[i]);
      //shape(icones[indiceIcone], x+(0.5*w), y+(0.5*w), w*s, h*s);
      shape(icones[indiceIcone], x + ((w-wP)/2), y + ((h-hP)/2), wP, hP);
      popMatrix();
      s -= incS;
      incS += 0.05;
    }
  }

  void definirCores() {
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

  String anoEntrada() {
    String anoEnt= "";
    for (int i = 0; i < 4; i++) {
      anoEnt+= nAluno.charAt(i);
    }
    return anoEnt;
  }
}
