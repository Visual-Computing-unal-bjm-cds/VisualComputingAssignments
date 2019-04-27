PGraphics pg, pg2;
PImage myImage, myImageH;
boolean button = false;

float x;
int y;
int w;
int h = 50;

void setup(){
   fullScreen();
   background(34, 164, 213);
   y = height-150;
   x = width-(3*width/5);
   w = width/5;
   
   fill(213,34,66);
   rect(x,y,w,h,7);
   stroke(213,34,66);
   fill(255);
   text("Prueba con video", width-(2.67*width/5),height-120);
   
   myImage = loadImage("imgPrueba.jpeg");
   if (myImage.width<myImage.height) {
     myImage.resize(0, int(height*0.7));
   } else {
     myImage.resize(int(height*0.7), 0);
   }
   myImageH=myImage.copy();
   //creacion de los espacios graficos dentro de la ventana
   pg=createGraphics(myImage.width, myImage.height);
   pg2=createGraphics(myImageH.width, myImageH.height);
   
   pg.beginDraw();
   myImage.loadPixels();
   int prom;
   for (int i = 0; i < (myImage.width*myImage.height); i++) {
     prom=int((red(myImage.pixels[i])+green(myImage.pixels[i])+blue(myImage.pixels[i]))/3);
     myImage.pixels[i] = color(prom, prom, prom);
   }
   myImage.updatePixels();
   pg.background(myImage);
   pg.endDraw();
   
   pg2.beginDraw();
   pg2.background(myImageH);
   pg2.endDraw();
}

void draw(){
  if (myImageH.width<myImageH.height) {
    image(pg, (width-(myImageH.width*2))/3, 50);
    image(pg2,((width-(myImageH.width*2))/3)*2 + myImageH.width, 50);
  } else {
    //falta arreglar este en proporcion a la pantalla
    image(pg, 20, ((400-myImage.height)/2)+20);
    image(pg2, 440, ((400-myImageH.height)/2)+20);
  }
  if(button){
    fill(213,34,66);
    rect(x,y,w,h,7);
    fill(255);
    text("Prueba con Imagen", width-(2.7*width/5),height-120);
  }else{
    fill(213,34,66);
    rect(x,y,w,h,7);
    fill(255);
    text("Prueba con video", width-(2.67*width/5),height-120);
  }
  
}

void mousePressed(){
 if((mouseX > x) && (mouseX < x+w) && (mouseY > y) && (mouseY < y+h)){
   if(button){
     button = false;
   }else{
     button = true;
   }
 }
}
