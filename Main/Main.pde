import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;

int factor, points, strokeWeightVal, radius; 

boolean generating = false;

void setup() {
  size (640, 640);
  generating = false;
  
  ControlP5Controls(cp5);
    
  radius = width/2 - 16; // convert to control
}

void draw() {
  background(0);
  println(generating);
  if (generating == true) {
    background(0, 0, 0, 0);
    beginRecord(PDF, "image-####.pdf"); 
    println("Generating Image");
  }
  
  pushMatrix();
  translate(width/2, height/2);
  // SETUP
  generateCircle(radius);
  //Debug
  //generatePoints(points, radius);
  generateLines(points, radius, factor, strokeWeightVal);
  popMatrix();
  
  if (generating) {
     println("Generated Image!");
     endRecord();
     generating = false;
  };
}
