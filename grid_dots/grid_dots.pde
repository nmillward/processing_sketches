int margin = 50;
int dotCount = 25;
float dotSize = 10;
int dotSpacing;

void setup() {
  size(800, 800);
  dotSpacing = (width - 2 * margin) / dotCount;
}

void draw() {
  background(50);
  noStroke();
  
  dotSize = mouseX / 10.0;
  
  for (int i = 0; i < dotCount; i++) {
    for (int n = 0; n < dotCount; n++) {
       fill(200, 150 - dotSize);
       ellipse(n * dotSpacing + margin, i * dotSpacing + margin, dotSize, dotSize);
    }
  }
}