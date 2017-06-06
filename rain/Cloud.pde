class Cloud {
  float cloudBoundWidth = 120;
  float cloudBoundHeight = 80;
  float x = (width / 2) - (cloudBoundWidth / 2);
  float y = height / 7;
  
  float cloudX, cloudY, cloudWidth, cloudHeight;
  
  Cloud() {
    cloudReset();
  }
  
  void fade() {
    cloudWidth = cloudWidth - random(1);
    cloudHeight = cloudHeight - random(1);
    cloudX = cloudX + random(1);
    cloudY = cloudY + random(1);
    
    if (cloudWidth < 0 || cloudHeight < 0) {
      cloudReset();
    }

  }
  
  void show() {
    fill(250, 200);
    noStroke();
    rect(cloudX, cloudY, cloudWidth, cloudHeight);
  }
  
  void cloudReset() {
    cloudX = random(x - cloudBoundWidth / 2, x + cloudBoundWidth / 2);
    cloudY = random(y, y + cloudBoundHeight);
    cloudWidth = random(cloudBoundWidth / 4, cloudBoundWidth);
    cloudHeight = random(cloudBoundHeight / 4, cloudBoundHeight);    
  }
}