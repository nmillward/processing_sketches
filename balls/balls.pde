float goldenRatio = (1 + sqrt(5) / 2);
ArrayList<Ball> balls;
static final float BALL_SIZE = 14;
int counter = 0;

void setup() {
  size(800, 800);
  noStroke();

  balls = new ArrayList<Ball>();
  balls.add(new Ball(BALL_SIZE, 0));
}

void draw() {
  background(50);

  for (int i = balls.size() - 1; i >= 0; i--) {
    balls.get(i).shift(i, balls);
    balls.get(i).show(i);
    
    if(balls.get(i).hasGoneTooFar()) {
      balls.remove(i); 
    }
  }

  counter++;
  
  balls.add(new Ball(BALL_SIZE - (counter % 400)/40, counter * radians(137.5)));
  //balls.add(new Ball(BALL_SIZE - (counter % 400)/40, counter * goldenRatio * PI));
}