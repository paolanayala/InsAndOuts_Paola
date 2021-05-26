import cc.arduino.*;
import org.firmata.*;

//import processing.sound.*;
import processing.serial.*;
//SoundFile bell;

Serial myPort;
int val;
int BUTTON1val;
int BUTTON2val;
int potVal;

PImage redball;
float fade = 2;
float fall = 10;
float y = 0;
String gameState;
int PaddleL = 350;
int PaddleR = 0;
float ballX = width/2;
float ballY = height;
float moveBallHorz = random(3, 8);
float moveBallVert = random(3, 8);
int scoreP1 = 0;
int scoreP2 = 0;
boolean bounceRight = true;
boolean bounceLeft = true;

int[] serialInArray = new int[3];    // Create array to store incoming bytes
int serialCount = 0;   

color colorP1 = color(11, 102, 35);
color colorP2 = color(196, 85, 8);
color colorBall = color(219, 32, 2);

boolean firstContact;


PFont font;


void setup() {
  size(600,600);
  String[] portList = Serial.list();
  printArray(portList);
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  
  gameState = "START";
  font = loadFont("Optima-Bold-48.vlw");
  redball = loadImage("redball.png");
  //bell = new SoundFile(this,"bell.wav");
}


void draw() {
  background(225, 179, 28);
    if ( myPort.available() > 0) {
   val = myPort.read(); 
  
  if (firstContact == false) {
    if (val == 'A') {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
  } else {
     serialInArray[serialCount] = val;
    serialCount++; 
    if (serialCount > 2) {
        BUTTON1val = serialInArray[0];
        BUTTON2val = serialInArray[1];
        potVal = int (map (serialInArray[2], 0, 255, 0, 500));
        serialCount = 0;
        myPort.write('A');
    }
  }
 }
    
  if (gameState == "START") {
    startGame();
  } else if (gameState == "PLAY") {
    playGame();
  } else if (gameState == "WIN") {
    winGame();
  } else if (gameState == "AGAIN"){
    playAgain();
  } 
}


void startGame() {
  textAlign(CENTER);
  textSize(40);
  fill(255, 0, 0);
  text("POWER PONG!", width/ 2, 70);
  textSize(18);
  fill(255);
  text("Player 1 use W and S keys to move left paddle up and down", 263, 120);
  text("Player 2 use potentiometer to move right paddle up and down", 275, 150);
  text("P1 press 'C' key or '1' key to use powerups.", 240, 178);
  text("P2 click buttons to use powerups.", 200, 205);
  text("First player to 10 wins!", 103, 250);
  text("Click anywhere to start", 300, height/2);
  
  if (mousePressed == true){
   gameState = "PLAY"; 
  }
}


void playGame() {
    if (gameState == "PLAY") {
      playingField();
      playerMoves();
      ballMovements();
      powerups();
    }

if ((scoreP1 == 10) || (scoreP2 == 10)) {
  gameState = "WIN";
  }
}

void playingField() {
  textFont(font);
  stroke(5);
  line(300, 0, 300, 600);
  
  
  fill(0);
  //text("Score", 252, 35);
  
  fill(colorP1);
  rect(20, PaddleL, 30, 100);
  text(scoreP1, 130, 35);

  
  fill(colorP2);
  rect(550, potVal, 30, 100);
  text(scoreP2, 450, 35);
  
  fill(colorBall);
  noStroke();
  ellipse(ballX, ballY, 40, 40);
}


void playerMoves() {
  
  println(PaddleL);
  
 if (keyPressed == true && key == 'w' && PaddleL <= height) {
   PaddleL = PaddleL - 12; 
   } else
if (keyPressed == true && key == 's' && PaddleL <= 600) {
   PaddleL = PaddleL + 12; 
   }
   
   PaddleR = potVal;
}


void powerups() {
  
  if (BUTTON1val == 1) {
    fill(colorBall);
    noStroke();
    if (frameCount % 5 == 0) rect(0,0, 300, 600);
      } else {
        BUTTON1val = 0;
    } 
  if (BUTTON2val == 1) {
    for (int x=0; x<=width/2; x+=50) {
      ellipse (x, y, 50, 50);
    ellipse (x, y+50, 50, 50);
    ellipse (x, y+100, 50, 50);
    } 
    y++;
       if (y>=height+50) 
    y=-150;
  }
    else {
      BUTTON2val = 0;
    }

      if (keyPressed == true && key == 'c' && ballX > width/2) {
     image(redball, width/2, fall++);
      } 
      if (keyPressed == true && key == '1' && ballX > width/2) {
        colorBall = color(225, 179, 28);
    } else {
      colorBall = color(219, 32, 2);
      }
      
      println ("BUTTON1val: " + BUTTON1val);
      println ("BUTTON2val: " + BUTTON2val);
      println ("val: " + potVal); 
  }

  

void ballMovements() {   
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

  if (ballY <= 10) {
    bounceLeft = true;
    moveBallVert = random(4, 7);
    }
  if (ballX <= 10) {
    bounceRight = true;
    moveBallHorz = random(3, 8);
    }
  if (ballY >= 595) {
    bounceLeft = false;
    }
  if (ballX >= 595) {
    bounceRight = false;
    }
    
    
  if ((ballX >= 595)  || (ballX >= width)) {
    scoreP1++;
    ballX = width / 2 + moveBallHorz;
    ballY = height / 2;
  }
  
  if ((ballX <= 10) || (ballX <= -width)) {
    scoreP2++;
    ballX = width / 4 + moveBallVert;
    ballY = height /2 + height / 4;
  }
  
  if (ballX <= 70 && ballY + 5 > PaddleL && ballY < (PaddleL + 110)) {
    bounceRight = true;
  }
  if (ballX >= 530 && ballY + 5 > PaddleR && ballY < (PaddleR + 110)) {
    bounceRight = false;
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
   if (mousePressed== true){
     gameState = "AGAIN";
    }
  }


 // maybe create button that will take the game state back to "START"
void playAgain() {
  if (mousePressed == true){ 
     gameState = "START";
  } 
 } 
