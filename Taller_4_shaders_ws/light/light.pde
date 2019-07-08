PShape can;
float angle;
PShader lightShader;
int lp=250;
float cx = width/2, cy = width/2, cz = height/2;

void setup() {
  size(640, 450, P3D);
  can = createCan(200, 500, 32);
  lightShader = loadShader("lightfragD.glsl", "lightvertD.glsl");
}

void draw() {    
  background(34, 164, 213);
  camera(cx, cy, cz+600, width/2, height/2, 0, 0, 1, 0);
  shader(lightShader);
  pointLight(51, 102, 126, mouseX, mouseY, lp);
  translate(width/2, height/2);
  rotateY(angle);  
  shape(can);  
  angle += 0.01;
}

PShape createCan(float r, float h, int detail) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);    
  }
  sh.endShape(); 
  return sh;
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == UP)cy += 200;
    else if(keyCode == DOWN)cy -= 200;
  }
  if (key == '+')lp += 100;
  else if (key == '-')lp -= 100;
  else if (key == 'd')lightShader = loadShader("lightfragD.glsl", "lightvertD.glsl");
  else if (key == 's')lightShader = loadShader("lightfragS.glsl", "lightvertS.glsl");
  else if (key == 'c')lightShader = loadShader("pixlightfragD.glsl", "pixlightvertD.glsl");
  else if (key == 'x')lightShader = loadShader("pixlightfragS.glsl", "pixlightvertS.glsl");
  println(lp);
}
