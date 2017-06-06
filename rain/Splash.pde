class Splash {
  
  float x, y;
  float radius = 10;
  float speed = 5;
  
  
  void splashes() {
    radius += 3;
  }
 
  void show(float x, float y) {
    fill(250, 0);
    stroke(250);
    ellipse(x, y, radius, 3);
  }
  
}