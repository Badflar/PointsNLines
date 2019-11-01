public void ControlP5Controls(ControlP5 cp5) {
  color red = color(144,0,0);
  color green = color(0,144,0);
  
  
  cp5 = new ControlP5(this);
    
  cp5.addNumberbox("points")
     .setPosition(50,50)
     .setSize(200,28)
     .setRange(0,300)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(100)
     ;
     
   cp5.addNumberbox("factor")
     .setPosition(50,100)
     .setSize(200,28)
     .setRange(0,100)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(2)
   ;
   
   cp5.addNumberbox("strokeWeightVal")
     .setPosition(50,150)
     .setSize(200,28)
     .setRange(0,100)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(.25)
   ;
   
   cp5.addNumberbox("radius")
     .setPosition(50,200)
     .setSize(200,28)
     .setRange(0,550)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(300)
   ;
   
   cp5.addNumberbox("rotationInt")
     .setPosition(50,250)
     .setSize(200,28)
     .setRange(0,360)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(180)
   ;
   
   cp5.addButton("reset")
     .setPosition(1400,100)
      .setSize(38,38)
      .setColorBackground(red);
   
   cp5.addButton("finish")
     .setPosition(1400,1000)
     .setSize(400,38)
     .setColorBackground(green)
   ;
}

public void reset() {
  // Make the variables a class that way they can be reset with a new class named "default"...
}

public void finish() {
  generating = true;
}
