PImage azul, vermelho;
PFont retro;
//variaveis bolinhas iniciais
float a1=1.578;
float aVelocity=0;
float aAcceleration=0.04;
//variavel de execução de telas
int posX[] = new int[100];
int posY[] = new int[100];
int xquad;
int yquad;
//variaveis retang
float cont=0 ;
int y1r, y2r, y3r, y4r, y5r, y6r=0;
int x1r=190;
int x2r=10;
int x5r=300;
int x6r=210;
int x7r= 130;
int lb=32;
int xver, y1rect, y2rect, y3rect, y4rect, y5rect, y6rect;
//variavies comando bolinhas
float   anglezul  = PI*2; //2=red,1=azul
float anglered=PI;
int  posy  =  435 ;
float   scalar  =   100;
float   speed   =  0.04;
float x1, y1, x2, y2;
int xbazul, ybazul, xbred, ybred;
boolean acabou=false;
boolean venceu=false;
boolean inicial=true;
boolean partida=false;


void setup() {

  size(420, 580);
  noStroke();
  retro=createFont("retro.ttf", 30);
  textFont(retro);
  azul=loadImage("azul.png");
  vermelho=loadImage("vermelho.png");
  //quadradinho();
  background(0);
  for (int i=0; i<100; i++) {
    xquad =i*5;
    yquad =int(random(height));
    posX[i] = xquad;
    posY[i] = yquad+32;
  }
}



void draw() {
  background(0);

  if (inicial==true) {
    tela();
    frameRate(30);
  
  if (mousePressed) {
    if (mouseX>=191&&mouseX<=250&&mouseY>=483&&mouseY<=500) {
      inicial=false;
      partida=true;
    }
  }
  }
  if (partida==true) {
    background(0);
    frameRate(60);
    cont++;

    bolinha();
    fundo();
    fase1();
    colisao();
    rodando();
  
  if (cont>=60*19) {
    venceu=true;
  }
  if (venceu==true) {
    gamend();
  }
  }

  if (acabou==true) {
    gameover();
  }
}
void tela() {
  fill(255);
  textSize(80);
  text("DUET", 100, 120);
  textSize(20);
  if (mouseX>=191&&mouseX<=250&&mouseY>=483&&mouseY<=500) {
    fill(227, 204, 27);
  }
  text("PLAY", 180, 500);
  rect(150, 492, 15, 3);
  rect(250, 492, 15, 3);
  
  translate(width/2, height/2);
  rotate(a1);
  image(azul, 0-16, 50, 32, 32);
  image(vermelho, 0-16, -82, 32, 32);
  a1+=aVelocity;
  aVelocity=+aAcceleration;
}
void fundo() {
  for (int i=0; i<100; i++) {
    int l=10;
    fill(255, 255, 255, 50);
    rect(posX[i], posY[i], l, l);

    posY[i]++;
    if (posY[i]>=height) {
      posY[i]=0;
    }
  }
}
