public void generatePoints(int points, int radius) {
  
  for (int i = 0; i < points; i++) { 
     PVector v = getVector(i, points, radius);
     
     fill(255);
     circle(v.x, v.y, 16);
     
  }
}
