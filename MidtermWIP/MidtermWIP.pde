int PaddleL = 350;
int PaddleR = 250;
int ballX = width/2;
int ballY = height/2;
int speedBallHorz = 2;
int speedBallVert = 3;
boolean bounceRight = true;
boolean bounceLeft = true;

void setup() {
  size(600,600);
 
}


void draw() {
  background(225, 179, 28);
  stroke(5);
  line(300, 0, 300, 600);
  
  fill(219, 32, 2);
  ellipse(ballX, ballY, 40, 40);
  
  fill(11, 102, 35);
  rect(20, PaddleL, 30, 100);
  
  fill(196, 85, 8);
  rect(530, PaddleR, 30, 100);

if (keyPressed == true && key == 'w') {
   PaddleL = PaddleL - 10; 
   }
if (keyPressed == true && key == 's') {
   PaddleL = PaddleL + 10;
   }
if (keyPressed == true && key == 'k') {
   PaddleR = PaddleR - 10;
   }
if (keyPressed == true && key == 'm') {
   PaddleR = PaddleR + 10;
   }
   
if (bounceRight == true) {
  ballX = ballX - speedBallHorz;
   } 
  else{
  ballX = ballX + speedBallHorz; 
  }

}
