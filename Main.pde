// import the pdf library
import processing.pdf.*;


int points = 200;
int factor = 2; 
float strokeWeight = .25;



boolean generated = false;
int radius;


void setup() {
  size (640, 640);
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
