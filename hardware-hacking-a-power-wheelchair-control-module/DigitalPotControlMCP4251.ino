/*
  Digital Pot Control for Microchip 4251 dual 10k digital pot (SPI control)
  Darby Hewitt -- 7/11/2016

 based on example code created 10 Aug 2010
 by Tom Igoe
*/

#define W0ADDR 0x00
#define W1ADDR 0x01
#define WRITE  0x00
#define INCR   0x01
#define DECR   0x02
#define READ   0x03
#define WRITE124

// include the SPI library:
#include <SPI.h>


// set pin 10 as the slave select for the digital pot:
const int slaveSelectPin = 10;

void setup() {
  // set the slaveSelectPin as an output:
  pinMode (slaveSelectPin, OUTPUT);
  // initialize SPI:
  
  SPI.begin();
  //Test to find 5V, 6V, 7V
  //digitalPotWrite((W0ADDR<<12)|(WRITE<<8)|226); //5.02 V
    //digitalPotWrite((W0ADDR<<12)|(WRITE<<8)|144); //6.00 V
    //digitalPotWrite((W0ADDR<<12)|(WRITE<<8)|30); //6.95 V
}

void loop() {
  //write 255, 127, 63, 31, 15, 7, 3, 1, (reverse) on each channel

  for(int i=255; i>0; i=i-10){
    digitalPotWrite((W0ADDR<<12)|(WRITE<<8)|i);
    digitalPotWrite((W1ADDR<<12)|(WRITE<<8)|i);
//    delay(10);
  }
  for(int i=0; i<255; i=i+10){
    digitalPotWrite((W0ADDR<<12)|(WRITE<<8)|i);
    digitalPotWrite((W1ADDR<<12)|(WRITE<<8)|i);
//    delay(10);
  }
  /*
  digitalPotWrite((W0ADDR<<12)|(WRITE<<8)|255);
  delay(5000);

  digitalPotWrite((W0ADDR<<12)|(WRITE<<8)|127);
  delay(5000);

  digitalPotWrite((W0ADDR<<12)|(WRITE<<8)|0);
  delay(5000);  
  */
}

void digitalPotWrite(int value) {
  // take the SS pin low to select the chip:
  digitalWrite(slaveSelectPin, LOW);

  SPI.beginTransaction(SPISettings(1000000, MSBFIRST, SPI_MODE0));
  //  send in the address and value via SPI:
  //SPI.transfer(address);
  SPI.transfer(value>>8);
  //delay(5);
  SPI.transfer(value);
  SPI.endTransaction();
  // take the SS pin high to de-select the chip:
  digitalWrite(slaveSelectPin, HIGH);
  
}
