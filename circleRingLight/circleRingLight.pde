int pointDiameter = 10;
float circleRadius = 200;
int numOfPoints = 100;
ArrayList<Point> points;
color[] colors;
int count = 0;

void setup() {
  size(500, 500);
  noStroke();
  
  float angle = TWO_PI / (float) numOfPoints;
  
  points = new ArrayList<Point>();
  // Fill Points arrayList in shape of a circle
  for(int i = 0; i < numOfPoints; i++) {
    points.add(new Point(
      width / 2 + circleRadius * sin(angle * i),
      height / 2 + circleRadius * cos(angle * i),
      pointDiameter, 
      pointDiameter
    ));
  }
 
   colors = new color[numOfPoints - 1];
  // Fill colors array, iteratively decreasing the transparancy 
  for(int i = 0; i < colors.length; i++) {
    colors[i] = color(90, 255, 116, 255 - (i*10));
  }
  
}


void draw() {
  background(50);
  
  for(Point point : points) {
    point.display();
    count = (count + 1) % colors.length;
    System.out.println(count);
  }
  
}


class Point {
  float x, y;
  int width, height;
  
  Point(float x, float y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  
  void display() {
    fill(colors[count]);
    ellipse(x, y, width, height);
  }
 
}