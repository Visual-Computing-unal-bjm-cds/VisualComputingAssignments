PImage img;
PShape texImg;
int option=0;

PShader texShader;
String[] shaders = {"original.glsl","edgeDetection.glsl","sharpen.glsl","boxBlur.glsl","gaussianBlur.glsl"};

void setup() {
  size(600,600, P2D);
  img = loadImage("img0.jpg");
  texImg = createShape(img);
  texShader = loadShader(shaders[0]);
}

void draw() {
  background(0);
  shader(loadShader(shaders[option]));
  shape(texImg);
}

PShape createShape(PImage tex) {
  textureMode(NORMAL);
  PShape shape = createShape();
  shape.beginShape();
  textureMode(NORMAL);
  shape.texture(tex);
  shape.vertex(0, 0, 0, 0);
  shape.vertex(width, 0, 1, 0);
  shape.vertex(width, height, 1, 1);
  shape.vertex(0, height, 0, 1);
  shape.endShape();
  return shape;
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
     if(option==0)option = 4;
     else option -= 1;
  }else if(key == UP){
   
  }else if(key == 'd' || key == 'D'){
    if(option==4)option = 0;
     else option += 1;
  }else if(key == DOWN){
  
  }else{
    
  }
}
