// Paola Ayala - Obie Snax
// Click on Run to start calling the dog, keep any key pressed to watch him
// reach his favorite treat!


PImage bone;
PImage puppy;
PImage pawprint;
float fall = 1;
float fade = 2;
float opacity = 0;
String quote = "Get the Treat!";


void setup() {
  size(700, 700);
  bone = loadImage("bone.png");
  puppy = loadImage("puppy.jpeg");
  pawprint = loadImage("pawprint.png");
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(50);
  
}


void draw() {
  background(255);
  fill(opacity);
  opacity = opacity + fade;
  
    if (opacity > 255 || opacity < 0) {
      fade = -fade;
    }
  
  image(pawprint, 50, 350);
  
  if (keyPressed) {
    image(puppy, width/2 + width/4, fall);
    image(bone, (width/2)+20, height/2+280, 200, 100);

    if (fall < height/2 + height/4) {
      fall++;
      fill(opacity);
      text(quote, (width/2)+120, height/2-50);
    } 
  }
  else {
    fall = 0;
     text("Obie!", (width/2)+130, height/2);
  }
  println("fall: " + fall);
}
