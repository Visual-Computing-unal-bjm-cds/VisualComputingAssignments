import processing.video.*;

PGraphics pg, pg2;
PImage myImage, myImageH;
Movie myMovie;
boolean button = false;

float x;
int y;
int w;
int h = 50;

void setup(){
   fullScreen();
   frameRate(60);
   background(34, 164, 213);
   y = height-150;
   x = width-(3*width/5);
   w = width/5;  
   //Cargar Imagen
   myImage = loadImage("imgPrueba.jpeg");
   if (myImage.width<myImage.height) {
     myImage.resize(0, int(height*0.7));
   } else {
     myImage.resize(int(height*0.7), 0);
   }
   myImageH=myImage.copy();
   
   ////Cargar video
   myMovie = new Movie(this, "video.mov");
   myMovie.loop();
   myMovie.speed(0.3);
   
   //creacion de los espacios graficos dentro de la ventana
   pg=createGraphics(int(height*0.7), int(height*0.7));
   pg2=createGraphics(int(height*0.7), int(height*0.7));
}

void draw(){
  if(button){
    fill(213,34,66);
    rect(x,y,w,h,7);
    fill(255);
    text("Prueba con Imagen", width-(2.7*width/5),height-120);
    
    pg.beginDraw();
    pg.background(34, 164, 213);
    myMovie.loadPixels();
    int prom;
    for (int i = 0; i < (myMovie.width*myMovie.height); i++) {
      prom=int((red(myMovie.pixels[i])+green(myMovie.pixels[i])+blue(myMovie.pixels[i]))/3);
      myMovie.pixels[i] = color(prom, prom, prom);
    }
    myMovie.updatePixels();
    pg.image(myMovie, 0, (pg.height - myMovie.height)/2, pg.width, myMovie.height);
    pg.endDraw();
    
    pg2.beginDraw();
    pg2.background(34, 164, 213);
    pg2.image(myMovie, 0, (pg2.height - myMovie.height)/2, pg2.width, myMovie.height);
    pg2.endDraw();
    image(pg, (width-(pg.width*2))/3, 50);
    image(pg2,((width-(pg2.width*2))/3)*2 + pg2.width, 50);
  }else{
    fill(213,34,66);
    rect(x,y,w,h,7);
    fill(255);
    text("Prueba con video", width-(2.67*width/5),height-120);
    
    pg.beginDraw();
    myImage.loadPixels();
    int prom;
    for (int i = 0; i < (myImage.width*myImage.height); i++) {
      prom=int((red(myImage.pixels[i])+green(myImage.pixels[i])+blue(myImage.pixels[i]))/3);
      myImage.pixels[i] = color(prom, prom, prom);
    }
    myImage.updatePixels();
    pg.background(34, 164, 213);
    pg.image(myImage,(pg.width-myImage.width)/2,(pg.height-myImage.height)/2);
    pg.endDraw();
   
    pg2.beginDraw();
    pg2.background(34, 164, 213);
    pg2.image(myImageH,(pg.width-myImage.width)/2,(pg2.height-myImageH.height)/2);
    pg2.endDraw();
    
    image(pg, (width-(pg.width*2))/3, 50);
    image(pg2,((width-(pg2.width*2))/3)*2 + pg2.width, 50);
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

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
