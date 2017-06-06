float yOffset = 0.0;

Blob[] blobs = new Blob[3];

void setup() {
  size(800, 800);
  noStroke();

  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob();
  }
}

void draw() {
  background(50);
  translate(width / 2, height / 2);

  for (Blob blob : blobs) {
    blob.makeBlob(150.0, 3.0, color(90, 255, 116, 255));
    blob.makeBlob(145.0, 2.0, color(255, 13, 255, 255));
    blob.makeBlob(140.0, 5.0, color(0, 139, 255, 255));
  }

  yOffset += 0.02;
}


class Blob {

  void makeBlob(float radius, float _xoffset, color bColor) {

    fill(bColor);

    beginShape();

    float xOffset = _xoffset;
    for (float i = 0; i < 50; i += 0.1) {
      float offset = map(noise(xOffset, yOffset), 0, 1, -30, 30);
      float r = radius + offset;
      float x = r * cos(i);
      float y = r * sin(i);

      vertex(x, y);

      xOffset += 0.1;
    }

    endShape();
  }
}