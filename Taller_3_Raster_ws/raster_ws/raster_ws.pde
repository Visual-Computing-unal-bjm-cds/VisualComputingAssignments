import nub.timing.*;
import nub.primitives.*;
import nub.core.*;
import nub.processing.*;

// 1. Nub objects
Scene scene;
Node node;
Vector v1, v2, v3;
// timing
TimingTask spinningTask;
boolean yDirection;
// scaling is a power of 2
int n = 6;

// 2. Hints
boolean triangleHint = true;
boolean gridHint = true;
boolean debug = true;

// 3. Use FX2D, JAVA2D, P2D or P3D
String renderer = P3D;

// 4. Window dimension
int dim = 9;

void settings() {
  size(int(pow(2, dim)), int(pow(2, dim)), renderer);
}

void setup() {
  scene = new Scene(this);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(width/2);
  scene.fit(1);

  // not really needed here but create a spinning task
  // just to illustrate some nub.timing features. For
  // example, to see how 3D spinning from the horizon
  // (no bias from above nor from below) induces movement
  // on the node instance (the one used to represent
  // onscreen pixels): upwards or backwards (or to the left
  // vs to the right)?
  // Press ' ' to play it
  // Press 'y' to change the spinning axes defined in the
  // world system.
  spinningTask = new TimingTask() {
    @Override
    public void execute() {
      scene.eye().orbit(scene.is2D() ? new Vector(0, 0, 1) :
        yDirection ? new Vector(0, 1, 0) : new Vector(1, 0, 0), PI / 100);
    }
  };
  scene.registerTask(spinningTask);

  node = new Node();
  node.setScaling(width/pow(2, n));

  // init the triangle that's gonna be rasterized
  randomizeTriangle();
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  if (gridHint)
    scene.drawGrid(scene.radius(), (int)pow(2, n));
  if (triangleHint)
    drawTriangleHint();
  pushMatrix();
  pushStyle();
  scene.applyTransformation(node);
  triangleRaster();
  popStyle();
  popMatrix();
}

float puntoTriangulo(Vector V1, Vector V2, Vector V3){
  return (V1.x()-V3.x())*(V2.y()-V3.y()) - (V1.y() - V3.y()) * (V2.x() - V3.x());
}

int colorFill(Vector P, Vector V1, Vector V2, Vector V3){
  //Coordenada baricentricaç
  //float x = (V1.x() + V2.x() +V3.x())/3;
  //float y = (V1.y() + V2.y() +V3.y())/3;
  //float d =  sqrt(pow((x-V3.x()),2)+pow((y-V3.y()),2));;
  float d1 = sqrt(pow((V1.x()-V3.x()),2)+pow((V1.y()-V3.y()),2));
  float d2 = sqrt(pow((V2.x()-V3.x()),2)+pow((V2.y()-V3.y()),2));
  float d = (d1+d2)/2;
  float dp = sqrt(pow((P.x()-V3.x()),2)+pow((P.y()-V3.y()),2));
  return round(255-((dp*255)/d));
}

// Implement this function to rasterize the triangle.
// Coordinates are given in the node system which has a dimension of 2^n
void triangleRaster() {
  // node.location converts points from world to node
  // here we convert v1 to illustrate the idea
  Vector V1  = node.location(v1);
  Vector V2  = node.location(v2);
  Vector V3  = node.location(v3);
  
  for(int i=-round(pow(2,n-1)); i<pow(2,n-1);i++){
     for(int j=-round(pow(2,n)/2); j<round(pow(2,n)/2);j++){
       float T = puntoTriangulo(V1,V2,V3);
       float T1 = puntoTriangulo(V1, V2, new Vector(i+0.75,j+0.75));
       float T2 = puntoTriangulo(V2, V3, new Vector(i+0.75,j+0.75));
       float T3 = puntoTriangulo(V3, V1, new Vector(i+0.75,j+0.75));
       if((T>=0 && T1>=0 && T2>=0 && T3>=0)||(T<=0 && T1<=0 && T2<=0 && T3<=0)){
         int R = colorFill(new Vector(i,j),V1,V2,V3);
         int G = colorFill(new Vector(i,j),V2,V3,V1);
         int B = colorFill(new Vector(i,j),V3,V1,V2);
         if(R<0)R=0;
         if(G<0)G=0;
         if(B<0)B=0;
         pushStyle();
         noStroke();
         fill(R,G,B);
         rect(i,j,1,1);
         popStyle();
       }
     }
  }
  if (debug) {
    pushStyle();
    stroke(0,255,0);
    point(round(node.location(v1).x()), round(node.location(v1).y()));
    popStyle();
    pushStyle();
    stroke(0,0,255);
    point(round(node.location(v2).x()), round(node.location(v2).y()));
    popStyle();
    pushStyle();
    stroke(255,0,0);
    point(round(node.location(v3).x()), round(node.location(v3).y()));
    popStyle();
  }
  
}

void randomizeTriangle() {
  int low = -width/2;
  int high = width/2;
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
}

void drawTriangleHint() {
  pushStyle();
  noFill();
  strokeWeight(2);
  stroke(255, 0, 0);
  triangle(v1.x(), v1.y(), v2.x(), v2.y(), v3.x(), v3.y());
  strokeWeight(5);
  stroke(0, 255, 255);
  point(v1.x(), v1.y());
  point(v2.x(), v2.y());
  point(v3.x(), v3.y());
  popStyle();
}

void keyPressed() {
  if (key == 'g')
    gridHint = !gridHint;
  if (key == 't')
    triangleHint = !triangleHint;
  if (key == 'd')
    debug = !debug;
  if (key == '+') {
    n = n < 7 ? n+1 : 2;
    node.setScaling(width/pow( 2, n));
  }
  if (key == '-') {
    n = n >2 ? n-1 : 7;
    node.setScaling(width/pow( 2, n));
  }
  if (key == 'r')
    randomizeTriangle();
  if (key == ' ')
    if (spinningTask.isActive())
      spinningTask.stop();
    else
      spinningTask.run(20);
  if (key == 'y')
    yDirection = !yDirection;
}
