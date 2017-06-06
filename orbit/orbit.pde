ArrayList<Point> points = new ArrayList<Point>();

void setup() {
  size(800, 600);
  //background(20);
  noStroke();
  fill(90, 255, 116, 255);
  
  for(int i = 0; i < 20; i++) {
    points.add(new Point());
  }

}


void draw() {
  background(50);
  
  for(Point point : points) {
    point.update();
    point.checkEdges();
    point.display();
  }
  
}

class Point {
 
  PVector location, velocity, acceleration;
  float topspeed;
  
  Point(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = 8;
  }
  
  void update() {
    
    PVector mouse = new PVector(mouseX, mouseY);
    //PVector mouse = new PVector(width / 2, height / 2);
    PVector direction = PVector.sub(mouse, location);
    direction.normalize();
    direction.mult(.25);
    acceleration = direction;
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    noStroke();
    //fill(random(255), random(255), random(255), 255);
    //fill(200);
    ellipse(location.x, location.y, 10, 10);
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }
}