color red = color(144,0,0);
color green = color(0,144,0);
color grey = color(144,144,144);

Textfield SavePresetName;

public void ControlP5Controls(ControlP5 cp5, int points, int factor, float strokeWeightVal, int radius, int rotationInt) {
  cp5 = new ControlP5(this);
    
  cp5.addNumberbox("points")
     .setPosition(50,50)
     .setSize(200,28)
     .setRange(0,300)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(points)
     ;
     
   cp5.addNumberbox("factor")
     .setPosition(50,100)
     .setSize(200,28)
     .setRange(0,100)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(factor)
   ;
   
   cp5.addNumberbox("strokeWeightVal")
     .setPosition(50,150)
     .setSize(200,28)
     .setRange(0,100)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(strokeWeightVal)
   ;
   
   cp5.addNumberbox("radius")
     .setPosition(50,200)
     .setSize(200,28)
     .setRange(0,550)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(radius)
   ;
   
   cp5.addNumberbox("rotationInt")
     .setPosition(50,250)
     .setSize(200,28)
     .setRange(0,360)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(rotationInt)
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
