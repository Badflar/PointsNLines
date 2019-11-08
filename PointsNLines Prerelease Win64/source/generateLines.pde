public void generateLines(int points, int radius, int factor, float strokeWeight, int rotationInt) {
  for (int i = 0; i < points; i++) {
    PVector a = getVector(i, points, radius, rotationInt);
    PVector b = getVector(i  * factor, points, radius, rotationInt); 
    
    strokeWeight(strokeWeight / 25);
    stroke(255);
    line(a.x, a.y, b.x, b.y);
  }
}
