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


//SETUP---------------------------------------------------------------
void setup() {
  background(34, 164, 213);
}
//DRAW---------------------------------------------------------------
void draw() {

  if (keyPressed) {
    //Inicializacion del cuadro de la derecha para el histograma

    switch(keyCode) {
    case 39: //derecha……también admite RIGHT
      change++;

      break;
    case 37: //izquierda…..también admite LEFT
      change--;

      break;

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
}

void mousePressed() {
  arrastrar = true;
  if ((mouseX > (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2)) && (mouseX < (((width-(pg2.width*2))/3)*2 + 2*pg2.width - (pg.width-myImage.width)/2))
    && (mouseY > 50) && (mouseY < (50 + pg2.height))) {
    initAux = mouseX - (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2);
  } else {
    if ((mouseX < (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2))) {
      initAux = 0;
    } else if ((mouseX > (((width-(pg2.width*2))/3)*2 + 2*pg2.width - (pg.width-myImage.width)/2))) {
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
  if ((mouseX > (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2)) && (mouseX < (((width-(pg2.width*2))/3)*2 + 2*pg2.width - (pg.width-myImage.width)/2))
    && (mouseY > 50) && (mouseY < (50 + pg2.height))) {
    initH = initAux;
    finishH = mouseX - (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2);
    if (finishH < initH) {
      initH = finishH;
      finishH = initAux;
    }
  } else {
    if ((mouseX > (((width-(pg2.width*2))/3)*2 + 2*pg2.width - (pg.width-myImage.width)/2))) {
      initH = initAux;
      finishH = myImage.width;
      if (finishH < initH) {
        initH = finishH;
        finishH = initAux;
      }
    } else if ((mouseX < (((width-(pg2.width*2))/3)*2 + pg2.width+ (pg.width-myImage.width)/2))) {
      initH = 0;
      finishH = initAux;
    }
  }
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
