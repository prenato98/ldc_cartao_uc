class InfoCard {

  String fac, grau, curso, estatuto, anoLetivo, nome;
  int nAluno, nCC, txtS;
  PImage foto;
  PShape logoUC;
  float wInfo, hInfo, wCartao, hCartao, barraCard, x;
  color c1, c2;

  InfoCard(String fac, String grau, String curso, String estatuto, String anoLetivo, int nAluno, String nome, int nCC, color c1, int wCartao, int hCartao) {
    this.fac = fac;
    this.grau = grau;
    this.curso = curso;
    this.estatuto = estatuto;
    this.anoLetivo = anoLetivo;
    this.nAluno = nAluno;
    this.nome = nome;
    this.nCC = nCC;
    this.wCartao = wCartao;
    this.hCartao = hCartao;
    wInfo = hCartao;
    hInfo = wCartao-hCartao;
    this.c1 = c1;
    this.c2 = c2;
    x = hCartao;
    logoUC = loadShape("uc.svg");
    foto = loadImage("foto1.jpg");
    foto.resize(int(8*(hCartao/20)), int(10*(hCartao/20)));
    imageMode(CENTER);
    //logoUC.resize(int(8*(hInfo/11)), int(8*(hInfo/11)));
    barraCard = 5*(hCartao/30);
    txtS = hCartao/19;
  }

  void display() {
    cardFrente();
  }

  void cardFrente() {
    textSize(txtS);
    fill (230);
    rect(x, 0, hInfo, wInfo);
    fill(0);
    pushMatrix();
    translate (wInfo, hCartao);
    rotate(radians(-90));
    text(estatuto, wInfo/10, 11*(hInfo/30));
    text(nAluno, wInfo/10, 15*(hInfo/30));
    text(anoLetivo, wInfo/10, 19*(hInfo/30));
    //image(logoUC, 7*(wInfo/10), hInfo/2);
    //shapeMode(CORNER);
    shape(logoUC, 4.75*(wInfo/10), 0.5*hInfo/10, 9*(hInfo/10), 9*(hInfo/10));
    //shapeMode(CENTER);
    popMatrix();
  }

  void cardTras() {

    textSize(txtS);
    fill (240);
    rect(0, 0, wCartao, hCartao);
    fill(0);
    textLeading(txtS);
    String facUC = fac + " da Universidade de Coimbra";
    String facUC1 = fac + " Universidade de Coimbra";
    println("O tamanho da string é: " + facUC.length());
    if (facUC.length() > 45 && facUC.length() < 50) {
      text(nome, 2*(wCartao/30), 12*(hCartao/30));
      text(nCC, 2*(wCartao/30), 14*(hCartao/30));
      text(facUC, 2*(wCartao/30), 14.5*(hCartao/30), 13*(wCartao/30), 16*(hCartao/30));
      text(grau + " em " + curso, 2*(wCartao/30), 20*(hCartao/30));
    } else if (facUC.length() > 50 && facUC.length() < 66) {
      text(nome, 2*(wCartao/30), 12*(hCartao/30));
      text(nCC, 2*(wCartao/30), 14*(hCartao/30));
      text(facUC, 2*(wCartao/30), 14.5*(hCartao/30), 15.5*(wCartao/30), 16*(hCartao/30));
      text(grau + " em " + curso, 2*(wCartao/30), 20*(hCartao/30));
    } else if (facUC.length() > 66) {
      text(nome, 2*(wCartao/30), 11*(hCartao/30));
      text(nCC, 2*(wCartao/30), 13*(hCartao/30));
      text(facUC, 2*(wCartao/30), 13.5*(hCartao/30), 15*(wCartao/30), 20*(hCartao/30));
      text(grau + " em " + curso, 2*(wCartao/30), 20*(hCartao/30));
    } else {
      text(nome, 2*(wCartao/30), 12*(hCartao/30));
      text(nCC, 2*(wCartao/30), 14*(hCartao/30));
      text(facUC1, 2*(wCartao/30), 14.5*(hCartao/30), 12*(wCartao/30), 16*(hCartao/30));
      text(grau + " em " + curso, 2*(wCartao/30), 20*(hCartao/30));
    }
    //text("da Universidade de Coimbra", 2*(wCartao/30), 17*(hCartao/30));

    image(foto, 23*(wCartao/30), hCartao/2);
    fill (c1);
    rect (0, 0, wCartao, barraCard);
    rect (0, hCartao-barraCard, wCartao, barraCard);
  }
}
