import processing.sound.*;
SoundFile bell;

PImage redball;
float fade = 2;
float fall = 1;
String gameState;
int PaddleL = 350;
int PaddleR = 250;
float ballX = width/2;
float ballY = height/2;
float moveBallHorz = 6;
float moveBallVert = 5;
int scoreP1 = 0;
int scoreP2 = 0;
boolean bounceRight = true;
boolean bounceLeft = true;
int x, y;

color colorP1 = color(11, 102, 35);
color colorP2 = color(196, 85, 8);
color colorBall = color(219, 32, 2);

PFont font;


void setup() {
  size(600,600);
  gameState = "START";
  font = loadFont("Optima-Bold-48.vlw");
  redball = loadImage("redball.png");
  //bell = new SoundFile(this,"bell.wav");
}


void draw() {
  background(225, 179, 28);
  if (gameState == "START") {
    startGame();
  } else if (gameState == "PLAY") {
    playGame();
  } else if (gameState == "WIN") {
    winGame();
  }
}


void startGame() {
  textAlign(CENTER);
  textSize(40);
  fill(255, 0, 0);
  text("XTREME PONG!", width/ 2, 70);
  textSize(18);
  fill(255);
  text("Player 1 use W and S keys to move left paddle up and down", 263, 120);
  text("Player 2 use K and M keys to move right paddle up and down", 270, 150);
  text("First player to 10 wins!", 103, 180);
  text("Click anywhere to start", 300, height/2);
  
  if (mousePressed == true){
   gameState = "PLAY"; 
  }
}


void playGame() {
  textFont(font);
  stroke(5);
  line(300, 0, 300, 600);
  
  
  fill(0);
  //text("Score", 252, 35);
  
  fill(colorBall);
  ellipse(ballX, ballY, 40, 40);
  
  fill(colorP1);
  rect(20, PaddleL, 30, 100);
  text(scoreP1, 130, 35);

  
  fill(colorP2);
  rect(530, PaddleR, 30, 100);
  text(scoreP2, 450, 35);
  

if (keyPressed == true && key == 'w' && ballX < width / 2) {
   PaddleL = PaddleL - 12; 
   }
if (keyPressed == true && key == 's' && ballX < width / 2) {
   PaddleL = PaddleL + 12; 
   }
if (keyPressed == true && key == 'k' && ballX > width / 2) {
   PaddleR = PaddleR - 12;
   }
if (keyPressed == true && key == 'm' && ballX > width / 2) {
   PaddleR = PaddleR + 12;
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
  moveBallVert = random(4, 7);
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
  scoreP1++;
  ballX = width / 2;
  ballY = height / 2;
}

if (ballX <= 15) {
  scoreP2++;
  ballX = width / 4;
  ballY = height /2 + height / 4;
  
}

if (ballX <= 60 && ballY + 10 > PaddleL && ballY < (PaddleL + 110)) {
  bounceRight = true;
}

if (ballX >= 515 && ballY + 10 > PaddleR && ballY < (PaddleR + 110)) {
  bounceRight = false;
  }
  
  
if ((scoreP1 == 10) || (scoreP2 == 10)) {
  gameState = "WIN";
}
  
  if (mousePressed == true && ballX < width/2) {
    for(int x = 0; x <= width/2; x+= 37) {
      for(int y = 0; y <= height; y+=37) {
      fill(colorBall);
      ellipse(x, y+50, 40, 40);
      }
    }  
  } else if (mousePressed == true && ballX > width/2) {
     image(redball, width/2, fall
      }
    }
  }
}

void winGame() {
 background(0);
 fill(100, 120, 40);
 textSize(32);
 
   if (scoreP1 == 10) {
     text("Player 1 Wins!", width/2, height/2);
   } else if (scoreP2 == 10) {
     text("Player 2 Wins!", width/2, height/2);
   }
 }
