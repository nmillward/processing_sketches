class Sun {
 
  float x;
  float y;
  float radius;
  float expandRate = 1;
  
  Sun(float radius) {
    this.radius = radius;
  }
  
  void pulse() {
    if (radius < 150) {
      fill(255, 220, 0, 255 - (expandRate * 10));
      radius = radius + expandRate;
    } else {
      radius = 100; 
    }
    
  }
  
  void show() {
    fill(255, 220, 0, 255);
    ellipse(width / 2, height / 5, radius * 2, radius * 2);
  }
  
}