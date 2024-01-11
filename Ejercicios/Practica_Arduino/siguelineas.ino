#include <Servo.h>

int NO_LINEA = LOW; 
int LINEA = HIGH; 

int TURN_AROUND_TIME = 1700;
int QUARTER_BACK_TIME = 400;
int EXTRA_FORWARD_TIME = 225;


Servo servoIzq;
Servo servoDer;

int pinIrIzqIzq = 10;
int pinIrIzq = 2;
int pinIrDer = 3;
int pinIrDerDer = 11;

int pinServoDer = 9;
int pinServoIzq = 8;

int irSensorValues[] = {LOW, LOW, LOW, LOW};

int x0 = 1;

void setup(){

  pinMode(pinIrDer, INPUT);
  pinMode(pinIrIzq, INPUT);
  
  servoIzq.attach(pinServoIzq);
  servoDer.attach(pinServoDer);

  stopMotor();

  delay(500);
  forward();

}

void loop(){
  readIRSensor();
  
  if(irSensorValues[0] == NO_LINEA && irSensorValues[3] == NO_LINEA && (irSensorValues[1] == LINEA || irSensorValues[2] == LINEA)){ 
   forward();
}
  else if (irSensorValues[0] == LINEA )
  {turnLeft();}
  else if ( irSensorValues[2] == LINEA)
   {turnRight();}
  else if (irSensorValues[0] == NO_LINEA && irSensorValues[2] == NO_LINEA)
   {LCG();}
}

void readIRSensor(){
  irSensorValues[0] = digitalRead(pinIrIzqIzq);
  irSensorValues[1] = digitalRead(pinIrIzq);
  irSensorValues[2] = digitalRead(pinIrDer);
  irSensorValues[3] = digitalRead(pinIrDerDer);
}

/**
 * Funcion que hace que se mantenga sobre la linea haciendo correciones y si se sale del todo, detiene el motor
 */
void forward(){
 
  if(digitalRead(pinIrIzq) == NO_LINEA && digitalRead(pinIrDer) == LINEA){
   servoIzq.write(0); 
   servoDer.write(90);
//	turnRight();
  }else if(digitalRead(pinIrIzq) == LINEA && digitalRead(pinIrDer) == NO_LINEA){
    servoIzq.write(90); 
    servoDer.write(180);
//         turnLeft();
  }else if (digitalRead(pinIrIzq) == LINEA || digitalRead(pinIrDer) == LINEA){
    forwardMotor();
  }
   else if(digitalRead(pinIrIzq) == NO_LINEA && digitalRead(pinIrDer) == NO_LINEA){
    stopMotor();}
}

void stopMotor(){
  servoIzq.write(90); 
  servoDer.write(90);
}

void forwardMotor(){
  servoIzq.write(0); 
  servoDer.write(180);
}

void forwardMotor(int xTime){
  forwardMotor();
  delay(xTime);
}



void turnAround(){
  servoIzq.write(0); 
  servoDer.write(0);
  delay(TURN_AROUND_TIME); 
  forward();
}

void turnRight(){
  forwardMotor(EXTRA_FORWARD_TIME);
  servoIzq.write(0); 
  servoDer.write(0);
  delay(QUARTER_BACK_TIME); 
  forward();
}

void turnLeft(){
  forwardMotor(EXTRA_FORWARD_TIME);
  servoIzq.write(180); 
  servoDer.write(180);
  delay(QUARTER_BACK_TIME); 
  forward();
}

void LCG(){
  int m = 514567891;
  int a = 489;
  int c = 699;

  x0 = (a * x0 + c) % m;

  if((x0 % 2) == 1) {
	servoIzq.write(0);
	servoDer.write(0);
  } else{
	servoIzq.write(180);
	servoDer.write(180);
  }
  delay(QUARTER_BACK_TIME);
  forwardMotor(QUARTER_BACK_TIME);
}











