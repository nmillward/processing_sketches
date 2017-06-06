int numOfArc = 20;
float step, speed, offset, arcEnd;

void setup() {
  size(1000, 800);
  step = 20;
  fill(90, 255, 116, 50);
  noStroke();
}

void draw() {
  background(50);
  translate(width / 2, height / 2);
  
  for(int i = 1; i < numOfArc; i++) {
    offset = TWO_PI / numOfArc * i;
    arcEnd = map(sin(offset + speed), -1, 1, PI, TWO_PI);
    arc(0, 0, i * step, i * step, PI, arcEnd, PIE); //CHORD, PIE
  }
  
  speed += .025;
}