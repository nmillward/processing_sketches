int originCircleSize = -800;
int circleOffset = 20;
int circleCount = 200;

boolean growing = false;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);

  //if (growing) {
  //  originCircleSize += 2;
  //  if (originCircleSize > 0) growing = false;
  //} else {
  //  originCircleSize -=2;
  //  if (originCircleSize < -800) growing = true;
  //}

  println(originCircleSize);

  for (int i = 0; i < circleCount; i++) {
    noFill();
    stroke(200, 200 - (i * 3));
    //stroke(200, 200);
    //stroke(90, 255, 116, 100);
    strokeWeight(3);
    rectMode(CENTER);
    ellipse(width / 2, height / 2, originCircleSize + i * circleOffset + mouseX, originCircleSize + i * circleOffset + mouseY);
  }
}