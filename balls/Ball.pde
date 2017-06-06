class Ball {

  PVector worldCenter, ballPosition, direction;
  float size;

  Ball(float diam, float angle) {
    this.size = diam;

    worldCenter = new PVector(width / 2, height / 2);
    ballPosition = worldCenter.copy();
    direction = new PVector(cos(angle), sin(angle));
    
  }

  void show(int index) {
    fill(map(index, 0, 255, 250, 90), 255, 116, 255); //map(index, 0, 255, 20, 255)
    ellipse(ballPosition.x, ballPosition.y, size, size); //rect
  }

  void shift(int index, ArrayList<Ball> balls) {
    for (int i = index + 1; i < balls.size() -1; i++) {
      if (PVector.dist(ballPosition, balls.get(i).ballPosition) < 14) {
        ballPosition.add(direction);
      }
    }
  }

  boolean hasGoneTooFar() {
    if (PVector.dist(ballPosition, worldCenter) > width / 3) {
      return true;
    }
    return false;
  }
}