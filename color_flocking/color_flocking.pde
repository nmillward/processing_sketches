int rectSize = 8;
int columns, rows;

Block[][] blocks;
ArrayList<Block> locBlocks;

Block west, east, north, south;
Block northwest, northeast, southwest, southeast;

void setup() {
  size(800, 800); 

  columns = width / rectSize;
  rows = height / rectSize;

  blocks = new Block[columns][rows];

  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < columns; x++) {
      blocks[y][x] = new Block(x * rectSize, y * rectSize, rectSize);
    }
  }
  smooth();
}

void draw() {
  background(50);

  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < columns; x++) {

      if (x > 0) west = blocks[y][x - 1];
      if (x < columns - 1) east = blocks[y][x + 1];
      if (y > 0) north = blocks[y - 1][x];
      if (y < rows - 1) south = blocks[y + 1][x];

      if ((x > 0) && (y > 0)) northwest = blocks[y - 1][x - 1];
      if ((x < columns - 1) && (y > 0)) northeast = blocks[y - 1][x + 1];
      if ((y < rows - 1) && (x > 0)) southwest = blocks[y + 1][x - 1];
      if ((y < rows - 1) && (x < columns - 1)) southeast = blocks[y + 1][x + 1];

      locBlocks = new ArrayList<Block>();

      locBlocks.add(west);
      locBlocks.add(east);
      locBlocks.add(north);
      locBlocks.add(south);
      locBlocks.add(northwest);
      locBlocks.add(northeast);
      locBlocks.add(southwest);
      locBlocks.add(southeast);

      blocks[y][x].flock(locBlocks);

      blocks[y][x].render();
      blocks[y][x].updatePosition();
    }
  }
}

void keyPressed() {
  if (key == 'b' || key == 'B') {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < columns; x++) {      
        blocks[y][x].setGrayscaleColor();
      }
    }
  } else if (key == 'c' || key == 'C') {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < columns; x++) {
        blocks[y][x].setRandomColor();
      }
    }
  }
}