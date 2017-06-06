Drop[] drops = new Drop[40];
Cloud[] clouds = new Cloud[100];
Sun sun = new Sun(50);

void setup() {
  size(1000, 1000);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();  
  }
  
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }
  
}

void draw() {
  background(50);
  
  sun.show();
  sun.pulse();

  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
  
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].show();
    clouds[i].fade();
  }
  
}