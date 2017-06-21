PVector center;
Flock flock;

void setup() {
  size(1200, 800);
  center = new PVector(width / 2, height / 2);
  flock = new Flock();
  for (int i = 0; i < 1; i++) {
    flock.addUnit(new Unit(width / 2, height / 2)); 
  }
  smooth();
}

void draw() {
  background(50);
  flock.run();
  
  if (mousePressed) {
    flock.addUnit(new Unit(mouseX, mouseY)); 
  }
  
}