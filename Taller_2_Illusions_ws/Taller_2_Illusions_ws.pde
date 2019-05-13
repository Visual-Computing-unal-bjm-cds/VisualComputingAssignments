float x = 5.2;
float y = 0.85; 
void ParaUno() {
  textSize(40);
  textAlign(CENTER);
  text("Ilusion Paradogica", (width*3)/4, 150, 0);
  textSize(25);
  textAlign(CENTER);
  text("Presiona las teclas de abajo y arriba", (width*3)/4, 250, 0);
  text("para ver mas.", (width*3)/4, 280, 0);
  if (keyCode == 38) fill(0);
  rect(width-250, height-250, 50, 50);
  fill(125, 52, 34);
  if (keyCode == 40) fill(0);
  rect(width-250, height-190, 50, 50);
  fill(125, 52, 34);
  rect(width-310, height-190, 50, 50);
  rect(width-190, height-190, 50, 50);

  translate(-100, 400, 200);
  rotateX(x);
  rotateY(y);

  float w = width/2;
  float h = height/2;
  stroke(125, 52, 34);
  translate(w, h, 0);
  fill(42, 52, 34);
  stroke(39, 174, 96);
  box(100);
  stroke(125, 52, 34);
  fill(125, 52, 34);
  translate(-100, 47.5, -200);
  box(100, 5, 500);
  fill(42, 52, 34);
  translate(200, -147.5, 200);
  stroke(39, 174, 96);
  box(100);
  stroke(125, 52, 34);
  fill(125, 52, 34);
  translate(0, -47.5, -150);
  box(100, 5, 200);
  translate(-150, 0, -50);
  box(200, 5, 100);
  rotateY(-y);
  rotateX(-x);
  if (keyCode == 40) {
    if (x<5.9)x+= 0.015;
    if (y<0.91)y+= 0.015;
  } else if (keyCode == 38) {
    if (x>5.2)x-= 0.015;
    if (y>0.85)y-= 0.015;
  }
}

boolean cuboIz = true;
boolean cuboDe = true;
void AmbiUno() {
  textSize(40);
  textAlign(CENTER);
  text("Ilusion Ambigua", width/2, 100, 0);
  textSize(25);
  textAlign(CENTER);
  text("Presiona las teclas de A, S y D para interactuar", width/2, height-100, 0);
  text("las flechas para cambiar de Ilusion Optica.", width/2, height-70, 0);
  float w = width/2;
  float h = height/2;
  int v = 0;
  float wAux;
  for (int i=0; i<5; i++) {
    wAux = w - (v*30);
    for (int j=0; j<(v+1); j++) {
      fill(241, 196, 15);
      quad(wAux, h-150, wAux-30, h-100, wAux, h-50, wAux + 30, h-100);
      wAux += 60;
    }
    h+=50;
    if (i>1)v--;
    else v++;
  }
  h = height/2;
  for (int j=0; j<3; j++) {
    for (int i=0; i<3; i++) {
      if (cuboIz) {
        fill(39, 174, 96);
        quad((w-j*30)-(180 - i*60), h-(150 - j*50), (w-j*30)-(210- i*60), h-(100- j*50), (w-j*30)-(150-i*60), h-(100- j*50), (w-j*30)-(120-i*60), h-(150- j*50));
        fill(231, 76, 60);
        quad((w+j*30)-(270 - i*60), h + (j*50), (w+j*30)-(240 - i*60), h+50+ (j*50), (w+j*30)-(180- i*60), h+50+ (j*50), (w+j*30)-(210 - i*60), h+ (j*50));
      } else {
        fill(255, 255, 255);
        quad(w-180, h-150, w-270, h, w-90, h, w, h-150);
        quad(w-270, h, w-180, h+150, w, h+150, w-90, h);
      }
      if (cuboDe) {
        fill(41, 128, 185);
        quad((w+j*30) + (i*60), h-150 + (j*50), (w+j*30)+ (30 + i*60), h-100 + (j*50), (w+j*30)+ (90 + i*60), h-100 + (j*50), (w+j*30)+ (60 + i*60), h-150 + (j*50));
        fill(230, 126, 34);
        quad((w - j*30) + (90 + i*60), h + (j*50), (w - j*30)+(60 + i*60), h + (50 + j*50), (w-j*30)+ (120+i*60), h + (50 + j*50), (w-j*30)+(150+i*60), h +(j*50));
      } else {
        fill(255, 255, 255);
        quad(w, h-150, w+90, h, w+270, h, w+180, h-150);
        quad(w+90, h, w, h+150, w+180, h+150, w+270, h);
      }
    }
  }

  if (key == 'd' || key == 'D') {
    cuboIz = false;
    cuboDe = true;
  } else if (key == 'a' || key == 'A') {
    cuboIz = true;
    cuboDe = false;
  } else if (key == 's' || key == 'S') {
    cuboIz = true;
    cuboDe = true;
  }
}

float xg = -0.75;
float yg = -2.25;
void GeomeUno() {
  textSize(40);
  textAlign(CENTER);
  text("Ilusion Geometrica", (width*3)/4, 150, 0);
  textSize(25);
  textAlign(CENTER);
  text("Presiona las teclas de abajo y arriba", (width*3)/4, 250, 0);
  text("para interactuar.", (width*3)/4, 280, 0);
  fill(125, 52, 34);
  if (keyCode == 38) fill(0);
  rect(width-280, height-250, 50, 50);
  fill(125, 52, 34);
  if (keyCode == 40) fill(0);
  rect(width-280, height-190, 50, 50);
  fill(125, 52, 34);
  rect(width-340, height-190, 50, 50);
  rect(width-220, height-190, 50, 50);

  stroke(0);
  translate(width/3, 300, 0);
  rotateY(yg);
  rotateX(xg);
  fill(231, 76, 60);
  box(50, 300, 50);
  translate(75, 75, 0);
  box(100, 50, 50);
  translate(-75, -200, 175);
  box(50, 50, 400);
  stroke(231, 76, 60);
  translate(-30, 1, 174);
  box(15, 50, 50);

  if (keyCode == 40) {
    if (xg<0)xg+= 0.015;
    if (yg<-1.8)yg+= 0.015;
  } else if (keyCode == 38) {
    if (xg>-0.75)xg-= 0.015;
    if (yg>-2.25)yg-= 0.015;
  }
}

PGraphics cv1;
PImage img1, img2;
int actual;
boolean one;

void Complement() {
  cv1.beginDraw();
  if (keyPressed) {
    if (keyCode==40 || keyCode==38) {
      one=!one;
    }
  }
  if (one) {
    if (img1.width<img1.height) {
      cv1.image(img1, ((460-img1.width)/2), 0);
    } else {
      cv1.image(img1, 0, ((460-img1.height)/2));
    }
  } else {
    if (img2.width<img2.height) {
      cv1.image(img2, ((460-img2.width)/2), 0);
    } else {
      cv1.image(img2, 0, ((460-img2.height)/2));
    }
  }
  cv1.noStroke();
  cv1.fill(255, 0, 0);
  cv1.circle(226.5, 226.5, 5);
  cv1.endDraw();
  image(cv1, 250, 100);
  textSize(20);
  textAlign(CENTER);
  text("Mirar fijamente el punto rojo 10 segundos y cambiar\ncon las flechas de arriba y abajo", width/2, 40, 0);
}

PImage cambioGris(PImage im) {
  im.loadPixels();
  int prom;
  for (int i = 0; i < (im.width*im.height); i++) {
    prom=int((red(im.pixels[i])+green(im.pixels[i])+blue(im.pixels[i]))/3);
    im.pixels[i] = color(prom, prom, prom);
  }
  im.updatePixels();
  return im;
}

PImage cambioCompl(PImage im) {
  im.loadPixels();
  int r, g, b;
  for (int i = 0; i < (im.width*im.height); i++) {
    r=255-int(red(im.pixels[i]));
    g=255-int(green(im.pixels[i]));
    b=255-int(blue(im.pixels[i]));
    im.pixels[i] = color(r, g, b);
  }
  im.updatePixels();
  return im;
}

PGraphics cv2;
int j,speed;
boolean dir=false;
void rectangles(){
  cv2.beginDraw();
  cv2.background(242,242,242);
  if(!mousePressed){
  cv2.noStroke();
  cv2.fill(0);
  for(int i=0;i<cv2.width;i+=30){
    cv2.rect(i,0,15,cv2.height);
  }
  }
  cv2.noStroke();
  cv2.fill(242,242,0);
  cv2.rect(j,150,60,25);
  cv2.noStroke();
  cv2.fill(0,0,100);
  cv2.rect(j,250,60,25);
  if(j+60>=cv2.width || j<=0)dir=!dir;
  if(dir)j+=speed;
  else j-=speed;
  cv2.endDraw();
  image(cv2, 200, 100);
  if (keyPressed) {
    if (keyCode==38) {
      if(speed<8){
        speed++;
      }
    }else if(keyCode==40){
      if(speed>0){
        speed--;
      }
    }
  }
  textSize(20);
  textAlign(CENTER);
  text("Modifique la velocidad con las flechas de arriba y abajo\nOprima el Mouse para quitar las barras", width/2, 40, 0);
  textSize(40);
  textAlign(CENTER);
  text("Velocidad: "+speed, width/2, 550, 0);
}

void setup() {
  size(1000, 600, P3D);
  background(255);
  img1 = loadImage("img1.jpg");
  for (int i=0; i<3; i++) {
    if (img1.width<img1.height) {
      img1.resize(0, 460);
    } else {
      img1.resize(460, 0);
    }
  }
  img2 = img1.copy();
  actual=0;
  one=true;
  cv1=createGraphics(460, 460);
  cv2=createGraphics(600,400);
  j=0;
  speed=1;
  cambioCompl(img1);
  cambioGris(img2);
}

int pantalla = 0;
boolean button = false;
void draw() {
  background(255);
  switch(pantalla) {
  case 0:
    AmbiUno();
    break;
  case 1:
    ParaUno();
    break;
  case 2:
    GeomeUno();
    break;
  case 3:
    Complement();
    break;
  case 4:
    rectangles();
    break;
  }
  if (keyPressed) {
    switch(keyCode) {
    case 39: 
      pantalla++;
      if (pantalla >4)pantalla = 0;
      break;
    case 37: 
      pantalla--;
      if (pantalla <0)pantalla = 4;
      break;
    default:
      break;
    }
    keyPressed=false;
  }
}
