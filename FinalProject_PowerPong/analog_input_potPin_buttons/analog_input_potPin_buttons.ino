#include <LiquidCrystal.h>

#include <Boards.h>
#include <Firmata.h>
#include <FirmataConstants.h>
#include <FirmataDefines.h>
#include <FirmataMarshaller.h>
#include <FirmataParser.h>

LiquidCrystal lcd(1, 2, 4, 5, 6, 7);

/*byte Skull[8] = {
0b00000,
0b01110,
0b10101,
0b11011,
0b01110,
0b01110,
0b00000,
0b00000
}; */

const int potPin = A0;
const int BUTTON1 = 12;
const int BUTTON2 = 13;
const int LED1 = 11;
int BUTTON1val = 0;
int BUTTON2val = 0;

int val = 0;
int inByte = 0;


void setup() {
  pinMode(potPin, INPUT);
  pinMode(BUTTON1, INPUT);
  pinMode(BUTTON2, INPUT);
  //lcd.begin(16, 2);
  //lcd.createChar(6, Skull);
  //lcd.clear();

  Serial.begin(9600);
  establishContact();
}

void loop() {

 if (Serial.available() > 0) {
  inByte = Serial.read();
 
  val = analogRead(potPin);
  val = val / 4 ;
  
  BUTTON1val = digitalRead(BUTTON1);
  delay(10);
  BUTTON2val = digitalRead(BUTTON2);
  delay(10);

  val = analogRead(potPin);
  val = val / 4 ;
 
  //use Serial.write to send data to Processing
  Serial.write(BUTTON1val);
  Serial.write(BUTTON2val);
  Serial.write(val);
  //delay(20);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(10);
  }
}
