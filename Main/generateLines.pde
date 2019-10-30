public void generateLines(int points, int radius, int factor, float stokeWeight) {
  for (int i = 0; i < points; i++) {
    PVector a = getVector(i, points, radius);
    PVector b = getVector(i  * factor, points, radius); 
    
    strokeWeight(stokeWeight / 25);
    stroke(255);
    line(a.x, a.y, b.x, b.y);
  }
}
