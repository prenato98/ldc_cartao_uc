import processing.pdf.*;

int max = 4;
Cell c1, c2, c3, c4, c5;
InfoCard card;
Padrao c2P, c3P;
OneCell c5P;
OneCellAl c4P;
ThreeCell c1P;
float cartaoAreaX, cartaoAreaY, cartaoCel, nLinCol;
float x, y, w, h;
color c;
int seed1, seed2;
int inc;

//ELEMENTO DE DEFINIÇÃO DE SEGUNDA E TERCEIRA LINHA DO CARTÃO
int r; //(r)andom number

//INFO CARTÃO
String fac, grau, curso, estatuto, anoLetivo, nAluno, nome, nCC;

//FÓRMULA DEFINIÇÃO ESQUEMA
String nAlunoP, nAlunoI, nAlunoTotal, algAluno, seedFinal;
int nAlunoInv;
//variavel1 corresponde ao numero de aluno e a variavel2 corresponde ao numero de aluno invertido
int variavel1, variavel2, variavel3, varFinal;

//PADRÕES
PGraphics bg, mask;
//CRIAÇÃO DE VARIÁVEIS DE PARAMETROS DE CONTAINERS PARA PREENCHER
float wP1, hP1, xP1, yP1; //CONTAINER 1 - FACULDADE + DEP.
float wP2, hP2, xP2, yP2; //CONTAINER 2 - GRAU DE CURSO
float wP3, hP3, xP3, yP3; //CONTAINER 3 - CURSO
float wP4, hP4, xP4, yP4; //CONTAINER 4 - ANO DE ENTRADA
float wP5, hP5, xP5, yP5; //CONTAINER 5 - ELEMENTO DE ALEATORIEDADE

//CRIAÇÃO VARIÁVEIS DE COR
color cC1, cC2, cC3, cC4, cC5; //CORES FUNDO CONTAINER
color cFac1, cFac2, cFac3, cFac4, cFac5; //COR 1 - FACULDADE + DEP.
color corG1, corG2; //COR 2 - GRAU DE CURSO
color corC1, corC2; //COR 3 - CURSO
color corAno1, corAno2; //COR 4 - ANO DE ENTRADA
color corAl1, corAl2; //COR 5 - ELEMENTO DE ALEATORIEDADE

//VARIÁVEL DE GRAU DE CURSO
int loop;


void setup() {
  //size(904, 585);
  //size(243, 153);
  size(243, 153, PDF, "DoutFLUCFrente.pdf");
  noLoop();

  bg = createGraphics(width, height);
  mask = createGraphics(width, height);

  //DEFINIÇÃO DO TAMANHO DO CARTÃO
  //cartaoAreaX = 904;
  //cartaoAreaY = 585;
  cartaoAreaX = 243;
  cartaoAreaY = 153;

  //DEFINIÇÃO DE TAMANHOS DO MOSAICO
  nLinCol = 3;
  cartaoCel = cartaoAreaY/nLinCol;
  w = cartaoCel;
  h = cartaoCel;

  //DEFINIÇÃO DE POSIÇÕES INICIAIS
  x = 0;
  y = 0;

  /*
   Faculdade de Letras
   Faculdade de Direito
   Faculdade de Medicina
   Faculdade de Ciências e Tecnologias
   Faculdade de Farmácia
   Faculdade de Economia
   Faculdade de Psicologia e Ciências da Educação
   Faculdade de Ciências do Desporto e Educação Física
   Colégio das Artes
   Instituto de Investigação Interdisciplinar
   */

  //INFORMAÇÃO CARTÃO
  fac = "Faculdade de Letras";
  grau = "Doutoramento";
  curso = "História";
  estatuto = "Estudante";
  anoLetivo = "2019/2023";
  nAluno = "2019147932";
  nome = "Nome de Estudante";
  nCC = "12345678";
  nAlunoI = "";
  nAlunoP = "";
  algAluno = "";
  seedFinal = "";

  //CRIAÇÃO VARIÁVEL DO NÚMERO DE ALUNO INVERTIDO
  for (int i = nAluno.length()-1; i >= 0; i--) {
    if (i%2==0) {
      nAlunoP+= nAluno.charAt(i);
    }
    if (i%2==1) {
      nAlunoI+= nAluno.charAt(i);
    }
  }
  variavel2 = int(nAlunoI);
  variavel1 = int(nAlunoP);
  variavel3 = variavel1*variavel2;
  nAlunoTotal = str(variavel3);
  println("Número de aluno: " + variavel1 + "/n Número de aluno invertido: " + variavel2 + " || total: " + nAlunoTotal);

  varFinal=0;
  for (int i = 0; i <nAlunoTotal.length(); i++) {
    varFinal += int(nAlunoTotal.charAt(i)-48);
  }

  seedFinal = str(varFinal);
  for (int i = 0; i <seedFinal.length(); i++) {
    varFinal += int(seedFinal.charAt(i));
    if (i==0) {
      seed1 = int(seedFinal.charAt(i)-48);
    } else {
      seed2 = int(seedFinal.charAt(i)-48);
    }
  }

  println("1º algarismo: " + seed1 + " || 2º algarismo: " + seed2);

  //DEFINIÇÃO GRAU DO CURSO
  if (grau == "Licenciatura") {
    loop = 1;
  }

  if (grau == "Mestrado") {
    loop = 2;
  }

  if (grau == "Doutoramento") {
    loop = 3;
  }

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


  //DEFINIÇÃO DE CORES
  cC1 = color(255);
  cC2 = cFac1;
  //cC3 = color(50, 90, 120);
  cC3 = cFac2;
  //cC3 = color(50, 150, 200);
  cC4 = color(205);
  cC5 = cFac2;

//DEFINIÇÃO ESQUEMA
  r = int(random (9));
  if (seed1%2 == 0) {
    if (seed2%3==0) {
      if (r%2==0) {
        //GRELHA 321 - HORIZONTAL
        //LINHA 1
        c1 = new Cell(0, 0, w, 3, color(cC1), seed1);
        //LINHA 2
        c2 = new Cell(0, h, w, 2, color(cC2), seed1);
        c4 = new Cell(w*2, h, w, 1, color(cC4), seed1);
        //LINHA 3
        c5 = new Cell(0, h*2, w, 1, color(cC5), seed1);
        c3 = new Cell(w, h*2, w, 2, color(cC3), seed1);
      } else {
        //GRELHA 312 - HORIZONTAL
        //LINHA 1
        c1 = new Cell(0, 0, w, 3, color(cC1), seed1);
        //LINHA 2
        c4 = new Cell(0, h, w, 1, color(cC4), seed1);
        c2 = new Cell(w, h, w, 2, color(cC2), seed1);
        //LINHA 3
        c3 = new Cell(0, h*2, w, 2, color(cC3), seed1);
        c5 = new Cell(w*2, h*2, w, 1, color(cC5), seed1);
      }
    }
    if (seed2%3==2) {
      if (r%2==0) {
        //GRELHA 231 - HORIZONTAL
        //LINHA 1
        c2 = new Cell(0, 0, w, 2, color(cC2), seed1);
        c4 = new Cell(w*2, 0, w, 1, color(cC4), seed1);
        //LINHA 2
        c1 = new Cell(0, h, w, 3, color(cC1), seed1);
        //LINHA 3
        c5 = new Cell(0, h*2, w, 1, color(cC5), seed1);
        c3 = new Cell(w, h*2, w, 2, color(cC3), seed1);
      } else {
        //GRELHA 213 - HORIZONTAL
        //LINHA 1
        c2 = new Cell(0, 0, w, 2, color(cC2), seed1);
        c4 = new Cell(w*2, 0, w, 1, color(cC4), seed1);
        //LINHA 2
        c5 = new Cell(0, h, w, 1, color(cC5), seed1);
        c3 = new Cell(w, h, w, 2, color(cC3), seed1);
        //LINHA 3
        c1 = new Cell(0, h*2, w, 3, color(cC1), seed1);
      }
    }
    if (seed2%3==1) {
      if (r%2==0) {
        //GRELHA 132 - HORIZONTAL
        //LINHA 1
        c4 = new Cell(0, 0, w, 1, color(cC4), seed1);
        c2 = new Cell(w, 0, w, 2, color(cC2), seed1);
        //LINHA 2
        c1 = new Cell(0, h, w, 3, color(cC1), seed1);
        //LINHA 3
        c3 = new Cell(0, h*2, w, 2, color(cC3), seed1);
        c5 = new Cell(w*2, h*2, w, 1, color(cC5), seed1);
      } else {
        //GRELHA 123 - HORIZONTAL
        //LINHA 1
        c4 = new Cell(0, 0, w, 1, color(cC4), seed1);
        c2 = new Cell(w, 0, w, 2, color(cC2), seed1);
        //LINHA 2
        c3 = new Cell(0, h, w, 2, color(cC3), seed1);
        c5 = new Cell(w*2, h, w, 1, color(cC5), seed1);
        //LINHA 3
        c1 = new Cell(0, h*2, w, 3, color(cC1), seed1);
      }
    }
  }

  if (seed1%2 == 1) {
    if (seed2%3==0) {
      if (r%2==0) {
        //GRELHA 321 - VERTICAL
        //LINHA 1
        c1 = new Cell(0, 0, w, 3, color(cC1), seed1);
        //LINHA 2
        c4 = new Cell(w, 0, w, 1, color(cC4), seed1);
        c2 = new Cell(w, h, w, 2, color(cC2), seed1);
        //LINHA 3
        c3 = new Cell(w*2, 0, w, 2, color(cC3), seed1);
        c5 = new Cell(w*2, h*2, w, 1, color(cC5), seed1);
      } else {
        //GRELHA 312 - VERTICAL
        //LINHA 1
        c1 = new Cell(0, 0, w, 3, color(cC1), seed1);
        //LINHA 2
        c2 = new Cell(w, 0, w, 2, color(cC2), seed1);
        c4 = new Cell(w, h*2, w, 1, color(cC4), seed1);
        //LINHA 3
        c5 = new Cell(w*2, 0, w, 1, color(cC5), seed1);
        c3 = new Cell(w*2, h, w, 2, color(cC3), seed1);
      }
    }
    if (seed2%3==2) {
      if (r%2==0) {
        //GRELHA 231 - VERTICAL
        //LINHA 1
        c4 = new Cell(0, 0, w, 1, color(cC4), seed1);
        c2 = new Cell(0, h, w, 2, color(cC2), seed1);
        //LINHA 2
        c1 = new Cell(w, 0, w, 3, color(cC1), seed1);
        //LINHA 3
        c3 = new Cell(w*2, 0, w, 2, color(cC3), seed1);
        c5 = new Cell(w*2, h*2, w, 1, color(cC5), seed1);
      } else {
        //GRELHA 213 - VERTICAL
        //LINHA 1
        c4 = new Cell(0, 0, w, 1, color(cC4), seed1);
        c2 = new Cell(0, h, w, 2, color(cC2), seed1);
        //LINHA 2
        c3 = new Cell(w, 0, w, 2, color(cC3), seed1);
        c5 = new Cell(w, h*2, w, 1, color(cC5), seed1);
        //LINHA 3
        c1 = new Cell(w*2, 0, w, 3, color(cC1), seed1);
      }
    }
    if (seed2%3==1) {
      if (r%2==0) {
        //GRELHA 132 - VERTICAL
        //LINHA 1
        c2 = new Cell(0, 0, w, 2, color(cC2), seed1);
        c4 = new Cell(0, h*2, w, 1, color(cC4), seed1);
        //LINHA 2
        c1 = new Cell(w, 0, w, 3, color(cC1), seed1);
        //LINHA 3
        c5 = new Cell(w*2, 0, w, 1, color(cC5), seed1);
        c3 = new Cell(w*2, h, w, 2, color(cC3), seed1);
      } else {
        //GRELHA 123 - VERTICAL
        //LINHA 1
        c2 = new Cell(0, 0, w, 2, color(cC2), seed1);
        c4 = new Cell(0, h*2, w, 1, color(cC4), seed1);
        //LINHA 2
        c5 = new Cell(w, 0, w, 1, color(cC5), seed1);
        c3 = new Cell(w, h, w, 2, color(cC3), seed1);
        //LINHA 3
        c1 = new Cell(w*2, 0, w, 3, color(cC1), seed1);
      }
    }
  }
  println("seed2=" + seed2 + " e par/impar=" + r);
  card = new InfoCard(fac, grau, curso, estatuto, anoLetivo, int(nAluno), nome, int(nCC), cFac1, int(cartaoAreaX), int(cartaoAreaY));

  //DEFINIÇÃO PARAMETROS PADRÃO
  
    //CONTAINER FACULDADE
  wP1 = c1.getW();
  hP1 = c1.getH();
  xP1 = c1.getX();
  yP1 = c1.getY();

  c1P = new ThreeCell (xP1, yP1, wP1, hP1, fac, seed1);
  
  //CONTAINER GRAU DO CURSO
  corG1 = cFac2;
  corG2 = cFac1;
  wP2 = c2.getW();
  hP2 = c2.getH();
  xP2 = c2.getX();
  yP2 = c2.getY();

  c2P = new Padrao (xP2, yP2, wP2, hP2, corG1, corG2, loop, seed1);

  //CONTAINER CURSO
  if (curso == "Design e Multimédia" && fac == "Faculdade de Ciências e Tecnologias") {
    corC1 = cFac1;
    corC2 = cFac5;
  } else {
    corC1 = cFac1;
    corC2 = corC1;
  }
  wP2 = c3.getW();
  hP2 = c3.getH();
  xP2 = c3.getX();
  yP2 = c3.getY();
  
  c3P = new Padrao (xP2, yP2, wP2, hP2, corC1, corC2, loop, seed1);
  
    //CONTAINER ALEATORIEDADE
  wP4 = c4.getW();
  hP4 = c4.getH();
  xP4 = c4.getX();
  yP4 = c4.getY();

  c4P = new OneCellAl (xP4, yP4, wP4, hP4, fac, nAluno);
  
  //CONTAINER ALEATORIEDADE
  wP5 = c5.getW();
  hP5 = c5.getH();
  xP5 = c5.getX();
  yP5 = c5.getY();

  c5P = new OneCell (xP5, yP5, wP5, hP5, fac, nAluno);
}


void draw() {
  cartaoFrente();
  //cartaoTras();
  exit();
}

int invertNum(String n) {
  int output = 0;
  int quarterN = int(n)/4;
  String nAlunoS = str(quarterN);
  String nAlunoInvString = "";
  for (int i = nAlunoS.length()-1; i >= 0; i--) {
    nAlunoInvString+= nAlunoS.charAt(i);
  }
  output = int(nAlunoInvString);
  return output;
}

void cartaoFrente() {
  c3.display();
  c3P.padrao2();
  c1.display();
  c1P.padrao1();
  c2.display();
  c2P.padrao1();
  c4.display();
  c4P.padrao1();
  c5.display();
  c5P.padrao1();
  card.cardFrente();
}

void cartaoTras() {
  card.cardTras();
}
