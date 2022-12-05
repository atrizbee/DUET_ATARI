void fase1() {
  y1rect=y1r-200;
  y2rect=y2r-40;
  y3rect=y3r-40;
  y4rect=y4r-40;
  y5rect=y5r-70;
  y6rect=y6r-300;

  if (cont>=60 ) {
    fill(255);
    rect(x1r, y1r-220, 40, 220);
    y1r=y1r+3;
  }


  if (cont>=60*4 ) {

    rect(x2r, y2r-40, 220, 40);
    y2r=y2r+3;
  }


  if (cont>=60*7 ) {

    rect(x1r, y3r-40, 220, 40);
    y3r=y3r+3;
  }

  if (cont>=60*11 ) {

    rect(x2r, y4r-40, 110, 40);
    rect(x5r, y4r-40, 110, 40);
    y4r=y4r+3;
  }

  if (cont>=60*14 ) {

    rect(x6r, y5r-70, 80, 70);
    rect(x7r, y6r-300, 80, 70);
    y5r=y5r+3;
    y6r=y6r+3;
  }
}
void bolinha() {
  background(0);
  x1  =   210+   cos (anglezul)  *  scalar ;
  y1  =  posy  + sin  (anglezul)  * scalar ;
  xbazul=round(x1);
  ybazul=round(y1);
  x2  =  180 + cos (anglered)  *  scalar ;
  y2  =  posy  + sin  (anglered)  * scalar ;
  xbred=round(x2);
  ybred=round(y2);
  image( azul, xbazul, ybazul, lb, lb);
  image( vermelho, xbred, ybred, lb, lb);
}
void colisao() {

  //colisao 1
  if (xbazul+32>=x1r&&xbazul<=x1r+40&&ybazul+32>=y1rect&&ybazul<=y1rect+200||xbred+32>=x1r&&xbred<=x1r+40&&ybred+32>=y1rect&&ybred<=y1rect+200) {
    partida=false;
    acabou=true;
  }
  //colisao 2
  if (xbazul+32>=x2r&&xbazul<=x2r+220&&ybazul+32>=y2rect&&ybazul<=y2rect+40||xbred+32>=x2r&&xbred<=x2r+220&&ybred+32>=y2rect&&ybred<=y2rect+40) {
    partida=false;
    acabou=true;
  }
  //colisao 3
  if (xbazul+32>=x1r&&xbazul<=x1r+220&&ybazul+32>=y3rect&&ybazul<=y3rect+40||xbred+32>=x1r&&xbred<=x1r+220&&ybred+32>=y3rect&&ybred<=y3rect+40) {
    partida=false;
    acabou=true;
  }
  //colisao 4
  if (xbazul+32>=x2r&&xbazul<=x2r+110&&ybazul+32>=y4rect&&ybazul<=y4rect+40||xbred+32>=x2r&&xbred<=x2r+110&&ybred+32>=y4rect&&ybred<=y4rect+40) {
    partida=false;
    acabou=true;
  }
  //colisao 5
  if (xbazul+32>=x5r&&xbazul<=x5r+110&&ybazul+32>=y4rect&&ybazul<=y4rect+40||xbred+32>=x5r&&xbred<=x5r+110&&ybred+32>=y4rect&&ybred<=y4rect+40) {
    partida=false;
    acabou=true;
  }

  //colisao 6
  if (xbazul+32>=x6r&&xbazul<=x6r+80&&ybazul+32>=y5rect&&ybazul<=y5rect+70||xbred+32>=x6r&&xbred<=x6r+80&&ybred+32>=y5rect&&ybred<=y5rect+70) {
    partida=false;
    acabou=true;
  }
  if (xbazul+32>=x7r&&xbazul<=x7r+80&&ybazul+32>=y6rect&&ybazul<=y6rect+70||xbred+32>=x7r&&xbred<=x7r+80&&ybred+32>=y6rect&&ybred<=y6rect+70) {
    partida=false;
    acabou=true;
  }
}

void gameover() {
  background(0);
  for (int i=0; i<100; i++) {
    int l=10;
    fill(255);
    rect(posX[i], posY[i], l, l);

    posY[i]++;
    if (posY[i]>=height) {
      posY[i]=0;
    }
  }
  fill(216, 26, 26);
  text("GAMEOVER", 150, 100);
  fill(255);


  if (mouseX>=160&&mouseX<=270&&mouseY>=380&&mouseY<=400) {
    fill(227, 204, 27);
  }
  text("RESTART", 160, 400);
  rect(135, 390, 20, 3);
  rect(275, 390, 20, 3);
  if (mousePressed) {
    if (mouseX>=160&&mouseX<=270&&mouseY>=380&&mouseY<=400) {
      inicial=true;
      acabou=false;
      cont=0;
      anglezul  = PI*2;
      anglered=PI;
      y1r=0;
      y2r=0;
      y3r=0;
      y4r=0;
      y5r=0;
      y6r=0;
    }
  }
}
void rodando() {
  if (keyPressed==true) {
    if (keyCode==RIGHT) {
      anglered  +=  speed;
      anglezul+=speed;
    }
    if (keyCode==LEFT) {
      anglered-=speed;
      anglezul-=speed;
    }
  }
}
void gamend() {
  background(0);


  for (int i=0; i<100; i++) {
    int l=10;
    fill(255);
    rect(posX[i], posY[i], l, l);

    posY[i]++;
    if (posY[i]>=height) {
      posY[i]=0;
    }
  }
  fill(255);
  textSize(20);
  text("YOU WON!", 150, 100);
  if (mouseX>=160&&mouseX<=270&&mouseY>=380&&mouseY<=400) {
    fill(227, 204, 27);
  }

  text("RESTART", 160, 400);
  rect(135, 390, 20, 3);
  rect(275, 390, 20, 3);
 
  if (mousePressed) {
    if (mouseX>=160&&mouseX<=270&&mouseY>=380&&mouseY<=400) {
      venceu=false;
      partida=false;
      inicial=true;
      cont=0;
      anglezul  = PI*2;
      anglered=PI;
      y1r=0;
      y2r=0;
      y3r=0;
      y4r=0;
      y5r=0;
      y6r=0;
    }
  }
}
