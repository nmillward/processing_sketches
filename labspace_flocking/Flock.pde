class Flock {
  ArrayList<Unit> units;
  
  Flock() {
    units = new ArrayList<Unit>(); 
  }
  
  void run() {
    for(Unit unit : units) {
      unit.run(units); 
    }
  }
  
  void addUnit(Unit unit) {
    units.add(unit); 
  }
  
}