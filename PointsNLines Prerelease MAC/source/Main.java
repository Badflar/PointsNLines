import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Main extends PApplet {




// Test

ControlP5 cp5;
JSONObject json;

Default def = new Default();
int points = this.def.points;
int radius = this.def.radius;
int factor = this.def.factor;
float strokeWeightVal = this.def.strokeWeightVal;
int rotationInt = this.def.rotationInt;

boolean autoPoints = false;
boolean autoFactor = false;
boolean autoRotation = false;
boolean generating = false;
boolean reset = false;

public void setup() {
  
  ControlP5Controls(cp5, points, factor, strokeWeightVal, radius, rotationInt);
}

public void draw() {
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
  
  if (autoPoints) {
    points++;
    if (points > 300) {
      points = 0;
    }
  }
  
  if (autoFactor) {
    factor++;
    if (factor > 100) {
      factor = 0;
    }
  }
  
  if (autoRotation) {
    rotationInt++;
    if (rotationInt > 360) {
      rotationInt = 0;
    }
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
public class Default {
  int factor = 2;
  int points = 100;
  int radius = 300;
  int rotationInt = 180;
  
  float strokeWeightVal = .25f;
}
int red = color(144,0,0);
int green = color(0,144,0);
int grey = color(144,144,144);

Textfield SavePresetName;

public void ControlP5Controls(ControlP5 cp5, int points, int factor, float strokeWeightVal, int radius, int rotationInt) {
  cp5 = new ControlP5(this);
    
  cp5.addNumberbox("points")
     .setPosition(50,50)
     .setSize(200,28)
     .setRange(0,300)
     .setMultiplier(0.1f) 
     .setDirection(Controller.HORIZONTAL) 
     .setValue(points)
     ;
     
   cp5.addBang("autoPoints")
     .setPosition(275,50)
     .setSize(28,28)
     ;
     
   cp5.addNumberbox("factor")
     .setPosition(50,100)
     .setSize(200,28)
     .setRange(0,100)
     .setMultiplier(0.1f) 
     .setDirection(Controller.HORIZONTAL) 
     .setValue(factor)
   ;
   
   cp5.addBang("autoFactor")
     .setPosition(275,100)
     .setSize(28,28)
     ;
   
   cp5.addNumberbox("strokeWeightVal")
     .setPosition(50,150)
     .setSize(200,28)
     .setRange(0,100)
     .setMultiplier(0.1f) 
     .setDirection(Controller.HORIZONTAL) 
     .setValue(strokeWeightVal)
   ;
   
   cp5.addNumberbox("radius")
     .setPosition(50,200)
     .setSize(200,28)
     .setRange(0,550)
     .setMultiplier(0.1f) 
     .setDirection(Controller.HORIZONTAL) 
     .setValue(radius)
   ;
   
   cp5.addNumberbox("rotationInt")
     .setPosition(50,250)
     .setSize(200,28)
     .setRange(0,360)
     .setMultiplier(0.1f) 
     .setDirection(Controller.HORIZONTAL) 
     .setValue(rotationInt)
   ;
   
   cp5.addBang("autoRotation")
     .setPosition(275,250)
     .setSize(28,28)
     ;
   
   cp5.addButton("reset")
     .setPosition(1800,50)
      .setSize(38,38)
      .setColorBackground(red);
      
   SavePresetName = cp5.addTextfield("presetName")
    .setPosition(50, 1000)
    .setSize(200, 38)
    .setColor(grey)
    .setAutoClear(false)
  ;
  
  SavePresetName = cp5.addTextfield("presetName")
    .setPosition(50, 1000)
    .setSize(200, 38)
    .setColor(grey)
    .setAutoClear(false)
  ;
      
   cp5.addBang("savePreset")
     .setPosition(275,1000)
     .setSize(50,38)
     .setColorBackground(green)
     ;
     
   cp5.addBang("loadPreset")
     .setPosition(350,1000)
     .setSize(50,38)
     .setColorBackground(grey)
     .setColorForeground(grey)
     ;
   
   cp5.addButton("finish")
     .setPosition(1400,1000)
     .setSize(400,38)
     .setColorBackground(green)
   ;
}

public void savePreset() {
  json = new JSONObject();
  
  json.setInt("points", points);
  json.setInt("factor", factor);
  json.setFloat("strokeWeightVal", strokeWeightVal);
  json.setInt("radius", radius);
  json.setInt("rotationInt", rotationInt);

  //String presetName = "test";
  String SavePresetText = SavePresetName.getText();
  
  saveJSONObject(json, "presets/" + SavePresetText);
}

public void  autoPoints() {
  if (autoPoints) {
    autoPoints = false;
  }
  else {
    autoPoints = true;
  }
}

public void  autoFactor() {
  if (autoFactor) {
    autoFactor = false;
  }
  else {
    autoFactor = true;
  }
}

public void autoRotation() {
  if (autoRotation) {
    autoRotation = false;
  }
  else {
    autoRotation = true;
  }

}

public void loadPreset() {
  selectInput("Select a file to load presets from...", "presetFileSelected");
}

public void presetFileSelected(File selection) {
  if (selection == null) {
    println("No file was selected");
  } else {
    println("Selected File");
    
    String Location = selection.getAbsolutePath();
    
    println(Location);
    
    try {
      json = loadJSONObject(Location);
      
      points = json.getInt("points");
      factor = json.getInt("factor");
      strokeWeightVal = json.getFloat("strokeWeightVal");
      radius = json.getInt("radius");
      rotationInt = json.getInt("rotationInt");
    } catch(Exception e) {
      println("Either file was not a json or something when wrong" + e);
    }
  }
}


public void reset() {
  reset = true;
}

public void finish() {
  generating = true;
}
public void generateCircle(float radius) {
  stroke(255);
  noFill();
  circle(0, 0, radius*2);
}
public void generateLines(int points, int radius, int factor, float strokeWeight, int rotationInt) {
  for (int i = 0; i < points; i++) {
    PVector a = getVector(i, points, radius, rotationInt);
    PVector b = getVector(i  * factor, points, radius, rotationInt); 
    
    strokeWeight(strokeWeight / 25);
    stroke(255);
    line(a.x, a.y, b.x, b.y);
  }
}
public void generatePoints(int points, int radius, int rotationInt) {
  
  for (int i = 0; i < points; i++) { 
     PVector v = getVector(i, points, radius, rotationInt);
     
     fill(255);
     circle(v.x, v.y, 16);
     
  }
}
public PVector getVector(int index, int points, float radius, int rotationInt) {
  // Change point index to a point in TWO_PI
  float angle = map(index % points, 0, points, 0, TWO_PI);
  float rotation = map(rotationInt, 0, 360, 0, TWO_PI);
  // Get the x and y from angle using a PVector (add PI to angle to flip the circle)
  PVector v = PVector.fromAngle(angle + rotation);
  // Make the new PVector match the radius of the circle
  v.mult(radius);
  
  return v;
}
  public void settings() {  size (1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
