//SS4_InteractiveSunGrid

float r = 80; // r value for backgrnd rgb
float colorFade = 8; // for incrementing the R value
float b = 50;

void setup () {
  size (540, 550);
  rectMode(CENTER);
  
}
void draw () {
  background(r, 100, 200);
  
  if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY > height/2-50 && mouseY > height/2+50);
    if (mousePressed) { // is mouse pressed?
      r+=colorFade;
        if (r + colorFade > 250 || r + colorFade < 0) {
         colorFade = -colorFade; 
        }
    }
    for (int y=30; y<height; y +=60) { // first for loop
      for (int x=30; x<width+29; x+=60) {
        for (int i = 0; i < 30; i ++) {
           fill(252, 209, 42);
           ellipse(x, y, i, i);
         if (keyPressed) {
           i += i;
         }
       }
      }
      
      
    }
  
 // fill(130, 80, 255);
   // rect (width/2, height/2, 100, 100);
}
