PImage img;
PShape texImg;
int option=0;
int shader=0;

PShader texShader;
String[] texts = {"Filtro: Original","Filtro: Edge detection","Filtro: Box blur","Filtro: Sharpen","Filtro: Gaussian blur"};
String[] shaders = {"original.glsl","edgeDetection.glsl","boxBlur.glsl","sharpen.glsl","gaussianBlur.glsl"};

void setup() {
  size(1000,600, P2D);
  background(34, 164, 213);
  texImg = createShape(loadImage("img" + option + ".jpg"));
  texShader = loadShader(shaders[0]);
}

void draw() {
  background(34, 164, 213);
  shader(loadShader(shaders[shader]));
  shape(createShape(loadImage("img" + option + ".jpg")));
}

PShape createShape(PImage tex) {
  textureMode(NORMAL);
  PShape shape = createShape();
  float var = 0.8;
  shape.beginShape();
  shape.texture(tex);
  shape.vertex((width-tex.width*var)/2, (height-height*0.8)/5, 0, 0);
  shape.vertex(width- (width-tex.width*var)/2, (height-height*0.8)/5, 1, 0);
  shape.vertex(width- (width-tex.width*var)/2, height-(height-height*0.8)/5, 1, 1);
  shape.vertex((width-tex.width*var)/2, height-(height-height*0.8)/5, 0, 1);
  shape.endShape();
  return shape;
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
     if(option==0)option = 3;
     else option -= 1;
  }else if(key == 'w' || key == 'W'){
     if(shader==4)shader = 0;
     else shader += 1;
  }else if(key == 'd' || key == 'D'){
    if(option==4)option = 0;
     else option += 1;
  }else if(key == 's' || key == 'S'){
    if(shader==0)shader = 4;
     else shader -= 1;
  }else{
    
  }
}
