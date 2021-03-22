import processing.sound.*;
//SoundFile ding;


int PaddleL = 350;
int PaddleR = 250;
float ballX = width/2;
float ballY = height/2;
float moveBallHorz = 4;
float moveBallVert = 3;
int scoreP1 = 0;
int scoreP2 = 0;
boolean bounceRight = true;
boolean bounceLeft = true;

PFont font;


void setup() {
  size(600,600);
  font = loadFont("Optima-Bold-48.vlw");
  //ding = new SoundFile(this,"ding.mp3");
}


void draw() {
  background(225, 179, 28);
  textFont(font);
  stroke(5);
  line(300, 0, 300, 600);
  
  fill(0);
  text("Score", 252, 35);
  
  fill(219, 32, 2);
  ellipse(ballX, ballY, 40, 40);
  
  fill(11, 102, 35);
  rect(20, PaddleL, 30, 100);
  text(scoreP1, 130, 35);

  
  fill(196, 85, 8);
  rect(530, PaddleR, 30, 100);
  text(scoreP2, 450, 35);

if (keyPressed == true && key == 'w' && ballX < width / 2) {
   PaddleL = PaddleL - 15; 
   }
if (keyPressed == true && key == 's' && ballX < width / 2) {
   PaddleL = PaddleL + 15; 
   }
if (keyPressed == true && key == 'k' && ballX > width / 2) {
   PaddleR = PaddleR - 15;
   }
if (keyPressed == true && key == 'm' && ballX > width / 2) {
   PaddleR = PaddleR + 15;
   }
   
if (bounceRight == true) {
  ballX = ballX + moveBallVert;
   } 
  else{
  ballX = ballX - moveBallHorz; 
  }
if (bounceLeft == true) {
  ballY = ballY + moveBallHorz;
}
  else{
   ballY = ballY - moveBallVert;
  }

if (ballY <= 15) {
  bounceLeft = true;
  moveBallVert = random(2, 7);
  }
if (ballX <= 15) {
  bounceRight = true;
  moveBallHorz = random(3, 7);
  }
if (ballY >= 585) {
  bounceLeft = false;
  }
if (ballX >= 585) {
  bounceRight = false;
  }
  
  
if (ballX >= 585) {
  //ding.play();
  scoreP1++;
  ballX = width / 2;
  ballY = height / 2;
}

if (ballX <= 15) {
  scoreP2++;
  ballX = width / 4;
  ballY = height /2 + height / 4;
  
}

if (ballX <= 60 && ballY + 10 > PaddleL && ballY < (PaddleL + 110)) { {
  bounceRight = true;
  }
}

if (ballX >= 515 && ballY + 10 > PaddleR && ballY < (PaddleR + 110)) {
  bounceRight = false;
  }
  
}
