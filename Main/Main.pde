import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;

int factor; 
int strokeWeightVal;

String text;


boolean generatedBoxes = true;
int radius;
int points = 200;


void setup() {
  size (640, 640);
  
  cp5 = new ControlP5(this);
  
  cp5.addNumberbox("points")
     .setPosition(50,50)
     .setSize(100,14)
     .setRange(0,300)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(100)
     ;
     
   cp5.addNumberbox("factor")
     .setPosition(50,80)
     .setSize(100,14)
     .setRange(0,100)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(2)
   ;
   
   cp5.addNumberbox("strokeWeightVal")
     .setPosition(50,110)
     .setSize(100,14)
     .setRange(0,100)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(.25)
   ;
    
  radius = width/2 - 16;
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  // SETUP
  
  
  generateCircle(radius);
  //Debug
  //generatePoints(points, radius);
  generateLines(points, radius, factor, strokeWeightVal);
  popMatrix();
}



void keyPressed() {
  if (key == 'S') {
    endRecord();
    exit();
  } 
}
