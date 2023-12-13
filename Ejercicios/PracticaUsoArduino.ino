#include <Servo.h>

int NO_LINEA = LOW; 
int LINEA = HIGH; 

int TURN_AROUND_TIME = 1700;
int QUARTER_BACK_TIME = 400;
int EXTRA_FORWARD_TIME = 225;
int x0 = 1;


Servo servoIzq;
Servo servoDer;

int pinIrIzqIzq = 10;
int pinIrIzq = 2;
int pinIrDer = 3;
int pinIrDerDer = 11;

int pinServoDer = 9;
int pinServoIzq = 8;

int irSensorValues[] = {LOW, LOW, LOW, LOW};


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
	forwardMotor();
}
  else if (irSensorValues[0] == LINEA )
  {
	turnLeft();

	}
 else if ( irSensorValues[3] == LINEA)
  {
	turnRight();
}
 else if (irSensorValues[0] == NO_LINEA && irSensorValues[1] == NO_LINEA && irSensorValues[2] == NO_LINEA && irSensorValues[3] == NO_LINEA)
  {
	
	turnRandom();
}
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

void turnRandom() {
	int a = 75;
	int c = 74;
	int m = 65537;
	x0 = (a*x0 + c) % m;
	if (x0 % 2 == 0){
		Serial.println("Right");
		turnRight();
		forwardMotor(400);
	} else {
		Serial.println("Left");
		turnLeft();	
		forwardMotor(400);
	}
	


}




//Explique con palabras como se hace girar el coche a la izquierda y a la derecha, según el código del fichero
//siguelineas.ino. Diga como se hace para leer los pines de digitales de los sensores, explicando que valores
//son los que se utilizan para detectar linea en el suelo

//Para girar a la izquierda se utiliza el método de turnleft() el cual modifica el valorde los servo's 
//para hacer el giro, en este caso primer se da un tiempo en el que sigue adelante, luego se modifican los dos servos
//para que vayan hacia adelante los dos (valor 180), ya que los cada servo esta invertido al otro. De la misma manera
//se hace el giro a la derecha pero con el valor 0 en cada uno. Para leer los pines simplemente se mira el valor que 
//toman esos pines, en este caso solo pueden tomar el valor LINEA y NO_LINEA, que muestran si el sensor está en la 
//en el circuito o no respectivamente.

