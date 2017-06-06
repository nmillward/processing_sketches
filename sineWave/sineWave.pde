int spacing = 16;

float waveHeight = 50.0;
float period = 200.0;
float dx;
float[] waveHeights;

void setup() {
  size(600, 400);
  
  dx = (TWO_PI / period) * spacing;
  waveHeights = new float[(width + 16) / spacing];
}

void draw() {
  background(50);
  renderWave();
}

void calculateWave() {
  
}

void renderWave() {
 fill(90, 255, 116, 255);
 noStroke();
 for(int i = 0; i < 20; i++) {
   ellipse(i * spacing, height / 2, 16, 16);
 }
}