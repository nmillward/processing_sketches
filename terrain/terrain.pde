int cols, rows;
int scale = 20;
int w = 600;
int h = 600;
float flying = 0;

float[][] terrain;

void setup() {
  size(1000, 1000, P3D); 
  
  //strokeWeight(6);

  cols = w / scale;
  rows = h / scale;

  terrain = new float[cols][rows];
}

void draw() {
  background(50);

  flying -= 0.01;

  float yoff = flying;

  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  stroke(90, 255, 116, 80);
  noFill();

  translate(width / 2, height / 2);
  rotateX(PI / 3);
  rotateZ(-PI / 7);

  translate(-w / 2, -h / 2);

  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP); //TRIANGLE_STRIP, TRIANGLE_FAN, POINTS
    for (int x = 0; x < cols; x++) {

      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, (y+1) * scale, terrain[x][y+1]);
    }
    endShape();
  }
}