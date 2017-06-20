float maxSpeed = 1.0;

class Unit {  
  PVector position, velocity, acceleration;
  float radius; 
  
  Unit(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0);
    radius = 2.0;
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
  }
  
  void screenEdge() {
     
  }
  
  //PVector seek() {
    
  //}
  
  //PVector separate() {
    
  //}
  
  //PVector align() {
    
  //}
  
  //PVector cohesion() {
    
  //}
  
  
  
}