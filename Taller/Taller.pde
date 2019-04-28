//Realizar dos canvas, el de la izquierda con una imagen o video,
//el de la derecha con analisis.

//----------------------------------------------------------------------
//Librerias
import processing.video.*;

//variables globales
PGraphics pg, pg2;
PImage myImage, myImageH, imgOr;
Movie myMovie;
boolean button = false;
boolean arrastrar = false;
float x;
int y, w, h = 50, change, fr, initH, initAux, finishH;
//mascaras de convolucion:
float mascaras[][][]={
  {//identidad
    {0, 0, 0}, 
    {0, 1, 0}, 
    {0, 0, 0}
  }, //edge detection 
  {
    {1, 0, -1}, 
    {0, 0, 0}, 
    {-1, 0, 1}
  }, 
  {
    {0, 1, 0}, 
    {1, -4, 1}, 
    {0, 1, 0}
  }, //Sharpen
  {
    {-1, -1, -1}, 
    {-1, 8, -1}, 
    {-1, -1, -1}
  }
};
//funcion de convolucion
PImage convolucion(PImage img, float[][]mask) {
  PImage imgConv=img.copy();
  int x, y, i, j, k, l, mitad=int(mask.length/2);
  float R, G, B;

  img.loadPixels();
  imgConv.loadPixels();

  for (y=mitad; y<img.height-mitad; y++) {
    for (x=mitad; x<img.width-mitad; x++) {
      R=0;
      G=0;
      B=0;
      int loc1=x+y*img.width;
      for (j=-mitad, l=0; j<=mitad; j++, l++) {
        for (i=-mitad, k=0; i<=mitad; i++, k++) {
          int loc2=(x+i)+((y+j)*img.width);
          R+=red(img.pixels[loc2])*mask[k][l];
          G+=green(img.pixels[loc2])*mask[k][l];
          B+=blue(img.pixels[loc2])*mask[k][l];
        }
      }
      imgConv.pixels[loc1]=color(R, G, B);
    }
  }
  imgConv.updatePixels();
  return imgConv;
}

//SETUP---------------------------------------------------------------
void setup() {
  fullScreen();
  background(34, 164, 213);
  y = height-150;
  x = width-(3*width/5);
  w = width/5;  
  fr = 20;
  //Cargar Imagen
  myImage = loadImage("img1.jpg");
  if (myImage.width<myImage.height) {
    myImage.resize(0, int(height*0.7));
  } else {
    myImage.resize(int(height*0.7), 0);
  }
  //Copia de las imagenes para las mascaras
  myImageH=myImage.copy();
  imgOr=myImage.copy();
  ////Cargar video
  myMovie = new Movie(this, "video.mov");
  myMovie.loop();
  //creacion de los espacios graficos dentro de la ventana
  pg=createGraphics(int(height*0.7), int(height*0.7));
  pg2=createGraphics(int(height*0.7), int(height*0.7));

  pg.beginDraw();
  //Conversion de imagen a escala de grises con el promedio del color de cada pixel
  myImage.loadPixels();
  int prom;
  for (int i = 0; i < (myImage.width*myImage.height); i++) {
    prom=int((red(myImage.pixels[i])+green(myImage.pixels[i])+blue(myImage.pixels[i]))/3);
    myImage.pixels[i] = color(prom, prom, prom);
  }
  myImage.updatePixels();
  pg.background(34, 164, 213);
  pg.image(myImage, (pg.width-myImage.width)/2, (pg.height-myImage.height)/2);
  pg.endDraw();
  //Creacion de la mascara de convolucion e histograma
  change=0;
  pg2.beginDraw();
  //creacion de la mascara de convolucion
  myImageH=convolucion(imgOr, mascaras[change]);
  pg2.background(34, 164, 213);
  pg2.image(myImageH, (pg.width-myImage.width)/2, (pg2.height-myImageH.height)/2);

  //Calculo del histograma segun el brillo de cada pixel de la imagen en blanco y negro
  int[] hist = new int[256];
  for (int i = 0; i < myImage.width; i++) {
    for (int j = 0; j < myImage.height; j++) {
      int bright = int(brightness(myImage.get(i, j)));
      hist[bright]++;
    }
  }
  int histMax = max(hist);
  pg2.stroke(#4dc03b);
  for (int i = 0; i < myImage.width; i+=2) {
    int which = int(map(i, 0, myImage.width, 0, 255));
    int y = int(map(hist[which], 0, histMax, myImage.height, 0));
    pg2.line(i+(pg.width-myImage.width)/2, myImage.height+(pg2.height-myImageH.height)/2, i+(pg.width-myImage.width)/2, y+(pg2.height-myImageH.height)/2);
  }
  pg2.endDraw();
}
//DRAW---------------------------------------------------------------
void draw() {
  if (button) {
    arrastrar = false;
    fill(213, 34, 66);
    rect(x, y, w, h, 7);
    fill(255);
    text("Prueba con Imagen", width-(2.7*width/5), height-120);
    print(frameRate);
    myMovie.play();
    pg.beginDraw();
    pg.background(34, 164, 213);
    myMovie.loadPixels();
    frameRate(fr);
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
    pg2.textSize(32);
    pg2.textAlign(CENTER);
    pg2.fill(213, 34, 66);
    pg2.text("Frames por Segundo",pg2.width/2,(pg.height)/2 - 35);
    pg2.text(fr,pg2.width/2,(pg.height)/2);
    pg2.text(frameRate,pg2.width/2,(pg.height)/2 + 35 );
    pg2.endDraw();
    image(pg, (width-(pg.width*2))/3, 50);
    image(pg2, ((width-(pg2.width*2))/3)*2 + pg2.width, 50);
    
    if (keyPressed) {
      //Inicializacion del cuadro de la derecha para el histograma
     
      switch(keyCode) {
      case 38: //arriba
        fr++;
        if (fr==20) {
          fr=19;
        }
        break;
      case 40: //izquierda…..también admite LEFT
        fr--;
        if (fr==0) {
          fr=1;
        }
        break;
      default:
        break;
      }
    }
  } else {
    myMovie.pause();
    fill(213, 34, 66);
    rect(x, y, w, h, 7);
    fill(255);
    text("Prueba con video", width-(2.67*width/5), height-120);
    pg.beginDraw();
    pg.background(34, 164, 213);
    pg.image(myImage,(pg.width-myImage.width)/2,(pg.height-myImage.height)/2);
    pg.endDraw();
    
    if (keyPressed) {
      //Inicializacion del cuadro de la derecha para el histograma
     
      switch(keyCode) {
      case 39: //derecha……también admite RIGHT
        change++;
        if (change==mascaras.length) {
          change=0;
        }
        break;
      case 37: //izquierda…..también admite LEFT
        change--;
        if (change==-1) {
          change=mascaras.length-1;
        }
        break;
      default:
        break;
      }
    }
     pg2.beginDraw();
          //creacion de la mascara de convolucion
      myImageH=convolucion(imgOr, mascaras[change]);
      pg2.background(34, 164, 213);
      pg2.image(myImageH, (pg.width-myImage.width)/2, (pg2.height-myImageH.height)/2);

      //Calculo del histograma segun el brillo de cada pixel de la imagen en blanco y negro
      int[] hist = new int[256];
      for (int i = 0; i < myImage.width; i++) {
        for (int j = 0; j < myImage.height; j++) {
          int bright = int(brightness(myImage.get(i, j)));
          hist[bright]++;
        }
      }
      int histMax = max(hist);
      pg2.stroke(#4dc03b);
      if(!arrastrar){
        initH = 0; 
        initAux = 0;
        finishH = myImage.width;
      }
      for (int i = initH; i < finishH; i+=2) {
        int which = int(map(i, 0, myImage.width, 0, 255));
        int y = int(map(hist[which], 0, histMax, myImage.height, 0));
        pg2.line(i+(pg.width-myImage.width)/2, myImage.height+(pg2.height-myImageH.height)/2, i+(pg.width-myImage.width)/2, y+(pg2.height-myImageH.height)/2);
      }
      pg2.endDraw();

    image(pg, (width-(pg.width*2))/3, 50);
    image(pg2, ((width-(pg2.width*2))/3)*2 + pg2.width, 50);
    delay(200);
  }
}

void mousePressed() {
  arrastrar = true;
  if((mouseX > (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2)) && (mouseX < (((width-(pg2.width*2))/3)*2 + 2*pg2.width - (pg.width-myImage.width)/2))
   && (mouseY > 50) && (mouseY < (50 + pg2.height))){
    initAux = mouseX - (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2);
    println("d" + initAux);
  }else{
    if((mouseX < (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2))){
      initAux = 0;
    }else if((mouseX > (((width-(pg2.width*2))/3)*2 + 2*pg2.width - (pg.width-myImage.width)/2))){
      initAux = myImage.width;
    }
  }
  if ((mouseX > x) && (mouseX < x+w) && (mouseY > y) && (mouseY < y+h)) {
    if (button) {
      button = false;
    } else {
      button = true;
    }
  }
}

void mouseReleased() {
  if((mouseX > (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2)) && (mouseX < (((width-(pg2.width*2))/3)*2 + 2*pg2.width - (pg.width-myImage.width)/2))
   && (mouseY > 50) && (mouseY < (50 + pg2.height))){
    initH = initAux;
    finishH = mouseX - (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2);
    if(finishH < initH){
      initH = finishH;
      finishH = initAux;
    }
    println(initH);
    println(finishH);
  }else{
    if((mouseX > (((width-(pg2.width*2))/3)*2 + 2*pg2.width - (pg.width-myImage.width)/2))){
      initH = initAux;
      finishH = myImage.width;
      if(finishH < initH){
        initH = finishH;
        finishH = initAux;
      }
    }else if((mouseX < (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2))){
      initH = 0;
      finishH = initAux;
    }
  }
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
