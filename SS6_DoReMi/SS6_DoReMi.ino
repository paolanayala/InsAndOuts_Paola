//Super Mario Short Intro
//By: paola ayala

const int buttonPin = 2;
int LEDPins[ ] = {2, 3, 4, 5, 6, 9, 10, 11, 12};

int LEDState = HIGH;
int buttonState = 0; 
int lastButtonState = LOW;
int i;


void setup() {
  for (i = 0; i <= 10; i++) {
  pinMode(LEDPins[i], OUTPUT); 
  pinMode(buttonPin, INPUT);
  
  }
}

void loop () { 
  buttonState = digitalRead(buttonPin);
  delay(10);
  blinkAlternate();
  
  
}


void blinkAlternate() {
  int delayTime = 500;
  int delayBeat = 600; 
  
    for (i = 0; i <= 9; i++) {
    digitalWrite(LEDPins[i], HIGH);
    delay(delayBeat);
  }
    for (i = 10; i >= 0; i--) {
    digitalWrite(LEDPins[i], LOW);
    delay(delayTime);
    }
   
}
