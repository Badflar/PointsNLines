import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;

// Make into class so that can be reset on command. 
int factor, points, strokeWeightVal, radius, rotationInt; 

boolean generating = false;

void setup() {
  size (1920, 1080);
  generating = false;
  
  ControlP5Controls(cp5);
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
