Table table;
String species[] = new String[0];
HashMap<String, Float> uniqueTreeType = new HashMap<String, Float>();

int totalTrees;
int iterator = 0;

int innerRadius = 100;
int lineWeight = 10;
int lineSpace = 20;

void setup() {
  size(1000, 1000);

  table = loadTable("ManhattanTrees.csv", "header");
  for (TableRow row : table.rows()) {
    species = append(species, row.getString("SPECIES"));
  }
  
  totalTrees = species.length / 5;

  for (String type : species) {
    if (!uniqueTreeType.containsKey(type)) {
      uniqueTreeType.put(type, 10.0);
    } else {
      uniqueTreeType.put(type, uniqueTreeType.get(type) + 1.0);
    }
  }

  println(uniqueTreeType);
}


void draw() {
  background(50);

  for (HashMap.Entry type : uniqueTreeType.entrySet()) {
  //for (int i = 0; i < uniqueTreeType.size(); i++) {
     strokeWeight(lineWeight);
     noFill();
     
     float acpl = map((float) type.getValue(), 0, totalTrees, 0, TWO_PI);
     stroke(200);
     strokeCap(SQUARE);
     arc(width / 2, height / 2, innerRadius + iterator * lineSpace, innerRadius + iterator * lineSpace, 0.0 - HALF_PI, acpl - HALF_PI);
     
     iterator++;
  }
  
  iterator = 0;
} 