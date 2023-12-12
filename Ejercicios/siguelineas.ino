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


void setup(){

  pinMode(pinIrDer, INPUT);
  pinMode(pinIrIzq, INPUT);
  
  servoIzq.attach(pinServoIzq);
  servoDer.attach(pinServoDer);

  stopMotor();

  delay(500);
  // Estrategia probabilista para encontrar la línea
/*
  while (!lineaDetectada()) {
    int randomBit = generateRandomBit();
    if (randomBit == 1) {
      turnRight();
      delay(400);
      stopMotor();
    } else {
      turnLeft();
      delay(400);
      stopMotor();
    }
  }*/
  
}

void loop(){
  readIRSensor();
  
 if(irSensorValues[0] == NO_LINEA && irSensorValues[3] == NO_LINEA && (irSensorValues[1] == LINEA || irSensorValues[2] == LINEA)){ 
	forwardMotor();   
}
  else if (irSensorValues[0] == LINEA ) {
	turnLeft();
}
 else if ( irSensorValues[3] == LINEA) {
	turnRight();
}
 else if (irSensorValues[0] == NO_LINEA && irSensorValues[1] == NO_LINEA && irSensorValues[2] == NO_LINEA && irSensorValues[3] == NO_LINEA) {
	giraRandom();
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
int x0 = 1;
void giraRandom() {
  int multiplier = 75;
  int increment = 74;
  int modulus = 65537;

  x0 = (multiplier * x0 + increment) % modulus;

  if (x0 % 2 == 0) {
    Serial.println("Turn Right");
    turnRight();
    forwardMotor(400);
  } else {
    Serial.println("Turn Left");
    turnLeft();
    forwardMotor(400);
  }
}

/*
Para realizar el giro a la izquierda, el código utiliza el método turnLeft(). 
En este proceso, primero se avanza durante un periodo de tiempo determinado. 
Luego, se ajustan los valores de los servos para que ambos vayan hacia adelante con un valor de 180, 
considerando que cada servo está invertido en relación al otro. 
En el caso del giro a la derecha, se utiliza el método turnRight() y se establece un valor de 0 en ambos servos.

La lectura de los pines digitales de los sensores se lleva a cabo con las funciones digitalRead(). 
Los pines, que representan los sensores en el suelo, pueden tener dos posibles valores: LINEA y NO_LINEA. 
Estos valores indican si el sensor está sobre la línea en el suelo (LINEA) o si no está sobre la línea (NO_LINEA). 
La lógica del programa toma decisiones basadas en estas lecturas para seguir la trayectoria deseada en el circuito.
*/















