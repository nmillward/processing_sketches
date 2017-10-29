float t;
int numOfLines = 50;

void setup() {
  size(800, 800);
  //background(50);
}

void draw() {
  background(50);
  strokeWeight(4);
  translate(width / 2, height / 2);

  //point(x(t), y(t));

  for (int i = 0; i < numOfLines; i++) {
    line(x(t + i), y(t + i), x2(t + i), y2(t + i));
    //line(-x2(t + i), -y2(t + i), x(t + i), y(t + i));
    stroke(200, 200 - (i * 5));
  }

  t-= 0.4;
}

//Parametric Equations
float x(float t) {
  return sin(t / 30) * 150 + sin(t / 15) * 100;
}

float y(float t) {
  return cos(t / 15) * 150 + cos(t / 15) * 200;
}

float x2(float t) {
  return sin(t / 10) * 100 + sin(t / 20) * 200;
}

float y2(float t) {
  return cos(t / 15) * 100 + cos(t / 15) * 200;
}