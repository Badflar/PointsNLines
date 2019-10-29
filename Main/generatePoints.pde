public void generatePoints(int points, int radius) {
  
  for (int i = 0; i < points; i++) { 
     PVector v = getVector(i, points, radius);
     
     fill(255);
     circle(v.x, v.y, 16);
     
  }
}


PVector getVector(int index, int points, float radius) {
  // Change point index to a point in TWO_PI
  float angle = map(index % points, 0, points, 0, TWO_PI);
  // Get the x and y from angle using a PVector (add PI to angle to flip the circle)
  PVector v = PVector.fromAngle(angle + PI);
  // Make the new PVector match the radius of the circle
  v.mult(radius);
  
  return v;
}
