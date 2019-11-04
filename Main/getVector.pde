PVector getVector(int index, int points, float radius, int rotationInt) {
  // Change point index to a point in TWO_PI
  float angle = map(index % points, 0, points, 0, TWO_PI);
  float rotation = map(rotationInt, 0, 360, 0, TWO_PI);
  // Get the x and y from angle using a PVector (add PI to angle to flip the circle)
  PVector v = PVector.fromAngle(angle + rotation);
  // Make the new PVector match the radius of the circle
  v.mult(radius);
  
  return v;
}
