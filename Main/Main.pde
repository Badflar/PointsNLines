// import the pdf library
import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;

int points = 200;
int factor = 2; 
float strokeWeight = .25;



boolean generated = false;
int radius;


void setup() {
  size (640, 640);
  
   cp5 = new ControlP5(this);
  
  cp5.addNumberbox("points")
    .setPosition(width-100, height-100)
    .setSize(100, 54)
    .setScrollSensitivity(1.1)
    .setValue(200);
  
  beginRecord(PDF, "demo1.pdf");
  //background(0);
  
  radius = width/2 - 16;
}

void draw() {
  // SETUP
  translate(width/2, height/2);
  
  if (!generated) {
    generateCircle(radius);
    //Debug
    //generatePoints(points, radius);
    generateLines(points, radius, factor, strokeWeight);
    generated = true;
  }
  
}

void keyPressed() {
  if (key == 'S') {
    endRecord();
    exit();
  } 
}
