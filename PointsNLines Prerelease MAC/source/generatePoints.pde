public void generatePoints(int points, int radius, int rotationInt) {
  
  for (int i = 0; i < points; i++) { 
     PVector v = getVector(i, points, radius, rotationInt);
     
     fill(255);
     circle(v.x, v.y, 16);
     
  }
}
