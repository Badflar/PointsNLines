import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;
JSONObject json;

Default def = new Default();
int points = this.def.points;
int radius = this.def.radius;
int factor = this.def.factor;
float strokeWeightVal = this.def.strokeWeightVal;
int rotationInt = this.def.rotationInt;

boolean generating = false;
boolean reset = false;

void setup() {
  size (1920, 1080);
  ControlP5Controls(cp5, points, factor, strokeWeightVal, radius, rotationInt);
}

void draw() {
  background(0);
  if (reset) {
    def = new Default();
    points = this.def.points;
    radius = this.def.radius;
    factor = this.def.factor;
    strokeWeightVal = this.def.strokeWeightVal;
    rotationInt = this.def.rotationInt;
    reset = false;
  }
  
  if (generating) {
    background(0, 0, 0, 0);
    beginRecord(PDF, "image-####.pdf");
    println("Generating Image");
  }
  
  pushMatrix();
  translate(width/2, height/2);
  generateCircle(radius);
  //generatePoints(points, radius);
  generateLines(points, radius, factor, strokeWeightVal, rotationInt);
  popMatrix();
  
  if (generating) {
     println("Generated Image!");
     endRecord();
     generating = false;
  };
}
