
float maxSpeed = 2.0;
float maxForce = 0.03;

class Unit {  
  PVector position, velocity, acceleration;
  float radius; 

  Unit(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0);
    radius = 3.0;
  }

  void run(ArrayList<Unit> units) {
    flock(units);
    updatePosition();
    screenEdge();
    render();
  }

  void updatePosition() {
    // update velocity & set limit
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);

    // reset acceleration to 0 after each cycle
    acceleration.mult(0);
  }

  void render() {
    // draw Unit shape in direction of velocity
    float theta = velocity.heading() + radians(90);
    noFill();
    stroke(200);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);

    beginShape(QUADS);
    vertex(-radius*2, -radius*2);
    vertex(-radius*2, radius*2);
    vertex(radius*2, radius*2);
    vertex(radius*2, -radius*2);
    endShape();

    popMatrix();
  }

  void flock(ArrayList<Unit> units) {
    //PVector separation = separate(units);
    PVector alignment = align(units);
    PVector separation = separate(units);
    PVector cohesiveness = cohesion(units);

    alignment.mult(4.0);
    separation.mult(20.0);
    cohesiveness.mult(5.0);

    applyForce(alignment);
    applyForce(separation);
    applyForce(cohesiveness);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void screenEdge() {
    if (position.x < -radius) position.x = width + radius;
    if (position.y < -radius) position.y = height + radius;
    if (position.x > width + radius) position.x = -radius;
    if (position.y > height + radius) position.y = -radius;
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);

    desired.normalize();
    desired.mult(maxSpeed);
    
    //Steering = Desired - Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    
    return steer;
  }

  PVector separate(ArrayList<Unit> units) {
    float separationDist = 20.0;
    PVector steer = new PVector(0, 0);
    int count = 0;

    for (Unit neighbor : units) {
      float distance = PVector.dist(position, neighbor.position);
      if ((distance > 0) && (distance < separationDist)) {
        PVector difference = PVector.sub(position, neighbor.position);
        difference.normalize();
        difference.div(distance);
        steer.add(difference);
        count++;
      }
    }

    if (count > 0) {
      steer.div((float) count);
      steer.normalize();
      steer.mult(maxSpeed);
      steer.sub(velocity);
      steer.limit(maxForce);
    }

    return steer;
  }

  PVector align(ArrayList<Unit> units) {
    float neighborDist = 25.0;
    PVector steer = new PVector();
    int count = 0;

    for (Unit neighbor : units) {
      float d = PVector.dist(position, neighbor.position);
      if ((d > 0) && (d < neighborDist)) {
        steer.add(neighbor.velocity);
        count++;
      }
    }

    if (count > 0) {
      steer.div((float)count);
      // Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxSpeed);
      steer.sub(velocity);
      steer.limit(maxForce);
    }
    return steer;
  }

  PVector cohesion(ArrayList<Unit> units) {
    float neighborDist = 40.0;
    PVector sum = new PVector(0, 0);
    int count = 0;
    
    for (Unit neighbor : units) {
      float d = PVector.dist(position, neighbor.position);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(neighbor.position);
        count++;
      }
    }
    
    if (count > 0) {
      sum.div((float) count);
      return seek(sum);
    }
     
    return sum;
  }
}