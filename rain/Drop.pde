class Drop {
 float cloudWidth = 100;
 float cloudHeight = 75;
 
 float x = random(width / 2 - cloudWidth / 2, width / 2 + cloudWidth / 2);
 float y = random(height / 5, height * .85);
 float z = random(0, 20);
 float len = map(z, 0, 20, 10, 20);
 float ySpeed = map(z, 0, 20, 4, 8);
 
 Splash splash = new Splash();
 
 void fall() {
   y = y + ySpeed;
   ySpeed = ySpeed + 0.05;
   
   if (y > height * .85) {
     splash.show(x, y);
     splash.splashes();
     rainReset();
   }
 }
 
 void show() {
   float thinkness = map(z, 0, 20, 1, 3);
   strokeWeight(thinkness);
   stroke(200);
   line(x, y, x, y+len);
 }
 
 void rainReset() {
   y = random(height / 5, height / 3 + cloudHeight);
   ySpeed = map(z, 0, 20, 4, 8);
 }
 
}