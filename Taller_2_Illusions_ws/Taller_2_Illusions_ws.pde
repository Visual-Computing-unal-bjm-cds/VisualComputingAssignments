float x = 5.2;
float y = 0.85; 
void ParaUno(){
  textSize(40);
  textAlign(CENTER);
  text("Ilusion Paradogica", (width*3)/4,150, 0);
  textSize(25);
  textAlign(CENTER);
  text("Presiona las teclas de abajo y arriba", (width*3)/4,250, 0);
  text("para ver mas.", (width*3)/4,280, 0);
  if (keyCode == 38) fill(0);
  rect(width-250, height-250,50,50);
  fill(125,52,34);
  if (keyCode == 40) fill(0);
  rect(width-250, height-190,50,50);
  fill(125,52,34);
  rect(width-310, height-190,50,50);
  rect(width-190, height-190,50,50);
  
  translate(-100,400,200);
  rotateX(x);
  rotateY(y);
  
  float w = width/2;
  float h = height/2;
  stroke(125,52,34);
  translate(w,h,0);
  fill(42,52,34);
  stroke(39, 174, 96);
  box(100);
  stroke(125,52,34);
  fill(125,52,34);
  translate(-100,47.5,-200);
  box(100,5,500);
  fill(42,52,34);
  translate(200,-147.5,200);
  stroke(39, 174, 96);
  box(100);
  stroke(125,52,34);
  fill(125,52,34);
  translate(0,-47.5,-150);
  box(100,5,200);
  translate(-150,0,-50);
  box(200,5,100);
  rotateY(-y);
  rotateX(-x);
  if (keyCode == 40) {
    if(x<5.9)x+= 0.015;
    if(y<0.91)y+= 0.015;
  }else if(keyCode == 38){
    if(x>5.2)x-= 0.015;
    if(y>0.85)y-= 0.015;
  }
}

boolean cuboIz = true;
boolean cuboDe = true;
void AmbiUno(){
 textSize(40);
 textAlign(CENTER);
 text("Ilusion Ambigua", width/2,100, 0);
 textSize(25);
 textAlign(CENTER);
 text("Presiona las teclas de A, S y D para interactuar", width/2,height-100, 0);
 text("las flechas para cambiar de Ilusion Optica.", width/2,height-70, 0);
 float w = width/2;
 float h = height/2;
 int v = 0;
 float wAux;
 for(int i=0; i<5;i++){
   wAux = w - (v*30);
   for(int j=0; j<(v+1);j++){
     fill(241, 196, 15);
     quad(wAux,h-150,wAux-30,h-100,wAux,h-50,wAux + 30, h-100);
     wAux += 60;
   }
   h+=50;
   if(i>1)v--;
   else v++;
 }
 h = height/2;
 for(int j=0;j<3;j++){
   for(int i=0; i<3;i++){
     if(cuboIz){
       fill(39, 174, 96);
       quad((w-j*30)-(180 - i*60), h-(150 - j*50), (w-j*30)-(210- i*60), h-(100- j*50), (w-j*30)-(150-i*60), h-(100- j*50), (w-j*30)-(120-i*60), h-(150- j*50));
       fill(231, 76, 60);
       quad((w+j*30)-(270 - i*60),h + (j*50),(w+j*30)-(240 - i*60),h+50+ (j*50),(w+j*30)-(180- i*60),h+50+ (j*50),(w+j*30)-(210 - i*60),h+ (j*50));
     }else{
       fill(255,255,255);
       quad(w-180,h-150,w-270,h,w-90,h,w,h-150);
       quad(w-270,h,w-180,h+150,w,h+150,w-90,h);
     }
     if(cuboDe){
       fill(41, 128, 185);
       quad((w+j*30) + (i*60),h-150 + (j*50),(w+j*30)+ (30 + i*60),h-100 + (j*50),(w+j*30)+ (90 + i*60),h-100 + (j*50),(w+j*30)+ (60 + i*60),h-150 + (j*50));
       fill(230, 126, 34);
       quad((w - j*30) + (90 + i*60), h + (j*50), (w - j*30)+(60 + i*60), h + (50 + j*50), (w-j*30)+ (120+i*60), h + (50 + j*50), (w-j*30)+(150+i*60), h +(j*50));
     }else{
       fill(255,255,255);
       quad(w,h-150,w+90,h,w+270,h,w+180,h-150);
       quad(w+90,h,w,h+150,w+180,h+150,w+270,h);
     }
   }
 }
 
 if (key == 'd' || key == 'D') {
   cuboIz = false;
   cuboDe = true;
 }else if(key == 'a' || key == 'A'){
   cuboIz = true;
   cuboDe = false;
 }else if (key == 's' || key == 'S'){
   cuboIz = true;
   cuboDe = true;
 }
}

float xg = -0.75;
float yg = -2.25;
void GeomeUno(){
  textSize(40);
  textAlign(CENTER);
  text("Ilusion Geometrica", (width*3)/4,150, 0);
  textSize(25);
  textAlign(CENTER);
  text("Presiona las teclas de abajo y arriba", (width*3)/4,250, 0);
  text("para interactuar.", (width*3)/4,280, 0);
  fill(125,52,34);
  if (keyCode == 38) fill(0);
  rect(width-280, height-250,50,50);
  fill(125,52,34);
  if (keyCode == 40) fill(0);
  rect(width-280, height-190,50,50);
  fill(125,52,34);
  rect(width-340, height-190,50,50);
  rect(width-220, height-190,50,50);
  
  stroke(0);
  translate(width/3,300,0);
  rotateY(yg);
  rotateX(xg);
  fill(231, 76, 60);
  box(50,300,50);
  translate(75,75,0);
  box(100,50,50);
  translate(-75,-200,175);
  box(50,50,400);
  stroke(231, 76, 60);
  translate(-30,1,174);
  box(15,50,50);
  
  if (keyCode == 40) {
    if(xg<0)xg+= 0.015;
    if(yg<-1.8)yg+= 0.015;
  }else if(keyCode == 38){
    if(xg>-0.75)xg-= 0.015;
    if(yg>-2.25)yg-= 0.015;
  }
}

void setup(){
  size(1000,600,P3D);
  background(255);
}

int pantalla = 0;
boolean button = false;
void draw(){
  background(255);
  if(pantalla == 0)AmbiUno();
  else if(pantalla == 1)ParaUno();
  else if(pantalla == 2)GeomeUno();
  
  if (keyPressed && !button) {
    button = true;
    if(keyCode == 37){
      if(pantalla >0) pantalla--;
      else pantalla = 0;
    }else if(keyCode == 39){
      if(pantalla < 3) pantalla++;
      else pantalla = 2;
    }
    delay(200);
    button = false;
  }
  
}
