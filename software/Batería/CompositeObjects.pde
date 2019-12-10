/**
 * Composite Objects
 * 
 * An object can include several other objects. Creating such composite objects 
 * is a good way to use the principles of modularity and build higher levels of 
 * abstraction within a program.
 */

import processing.serial.*;        //se inicializa el puerto serial
import processing.sound.*;        //se inicializa el puerto serial
EggRing er1, er2,er3;


byte lectura_datos[];
int [] canal;
int [] analog1;     // arreglo respectivo al canal analogico 1
int [] analog2;     // arreglo respectivo al canal analogico 2
int [] digital1;    // arreglo respectivo al canal digital 1
int [] digital2;    // arreglo respectivo al canal digital 2
int i=0,j=0,k=0;

Serial myPort;  // Crea un objeto de clase serial

PImage screen;
SoundFile platillo;
SoundFile bajo;
SoundFile redoble;
//boolean play = true;
boolean play = false;
//Delay delay;

//SinOsc platillo1;
//SqrOsc tambor1;

int voltajeprevX_0 = 0;
int voltajeactX_0 = 0;
int voltajeprevY_1 = 0;
int voltajeactY_1 = 0;
int aux_X = 0;
//int m  = millis();


void setup() {
  //platillo1 = new SinOsc (this);
  size(1280, 800);
  er1 = new EggRing(width*0.45, height*0.5, 0.1, 120);
  er2 = new EggRing(width*0.65, height*0.8, 0.05, 180);
  er3 = new EggRing(width*0.25, height*0.4, 0.02, 90);
  
  //delay = new Delay(this);
  
  platillo = new SoundFile (this, "platillo.mp3");
  bajo = new SoundFile (this, "bajo.mp3");
  redoble = new SoundFile (this, "redoble.mp3");
  
  lectura_datos = new byte[5];  
  canal = new int[10];
  analog1 = new int[10];
  analog2 = new int[10];
  digital1 = new int[10];
  digital2 = new int[10]; 
  
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 115200);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  myPort.buffer(10);
}

void draw() {
  background(86,7,12);
  texto();
  time();
  textSize(25);
  fill(255);
  text(canal[0], 30, 30);
  textSize(25);
  
/*   if (canal[1]>800){
    er1.transmit(); //bajo
    bajo.play();
    println(canal[0]);
  } 
  if ( canal[0] > 1200 && aux_X > 200){
   platillo1.play(1,1);
    platillo1.stop(10,15);
    
    er2.transmit(); //redoble  
    delay(1500);
   }
   
   if ( canal[0] > 1500 && aux_X > 50 && play){
     redoble.play();
     er2.transmit(); //redoble  
     for(int t = 0; t < 1000000; t++){
      for(int ti = 0; ti < 1000; ti++){
        
        play = false;
      }
      play = true;
    }
    delay(1500);
   }*/
   
   if(canal[0] < 1400){
       play = true;   
   }
   if (canal[0] > 1500){
     er2.transmit();
     if (play){
       bajo.play();
       play = false;
     }
   }
   /*if ( canal[0] > 1500 && play){
     redoble.play();
    // er2.transmit(); //redoble  
     for(int t = 0; t < 1000000; t++){
      for(int ti = 0; ti < 1000; ti++){
        
        play = false;
      }
      play = true;
    }
         
    delay(300);
   }
   if ( canal[0] > 1500 && canal[0] <1800)
   {
     er2.transmit();   
   }*/
   
  //if ( canal[2]>1000  && canal[2]<1500){
     // er3.transmit(); //platillo
    // platillo.play();
      //println(canal[0]);
  //}
  
  if (j == 1){
    myPort.clear();               // Limpieza del buffer del puerto serial
    i = 0;                        // Reset de los arreglos que guardan los datos desempaquetados
    j = 0;                        // Variable de control que activa la recepcion de datos y deshabilita la opcion de graficar 
  
}
}

void time(){
  
  voltajeactX_0 = canal[0];
  int m = millis();
  if(m % 200 == 0){
    aux_X = (voltajeactX_0 - voltajeprevX_0);
    //aux_X = (voltajeactX_0 - voltajeprevX_0)*5;
    voltajeprevX_0 = voltajeactX_0;
    //println(aux_X);
  }
  
}



void texto()
{
  textSize(75);
  fill(255);
  text("DRUMS", 800, 200);
  textSize(25);
  fill(255);
  text("Platillo", 280, 350);
  textSize(25);
  fill(255);
  text("Bajo", 545, 420);
  textSize(25);
  fill(255);
  text("Redoble", 780, 640);
}

void serialEvent(Serial myPort){
 if ((myPort.available() > 0) && (j == 0)) {
    do {
    lectura_datos[0] = byte(myPort.read());
    } while (int(lectura_datos[0]) < 255);
    lectura_datos[1] = byte(myPort.read());
    lectura_datos[2] = byte(myPort.read());
    lectura_datos[3] = byte(myPort.read());
    lectura_datos[4] = byte(myPort.read());
 } 
 if (j == 0){
    desempaquetado();
    //print(" ( "+ int(lectura_datos[0]) + " "+ int(lectura_datos[1]) +" "+ int(lectura_datos[2]) +" "+ int(lectura_datos[3]) +" ) ");
    
 } 
 }

void desempaquetado(){
  int[] aux = new int[2];
 
  aux[0] = lectura_datos[1] & 15;
  aux[0] = aux[0] << 8;
  aux[1] = lectura_datos[2] & 255;
  canal[0] = (aux[0] + aux[1]);       // Canal Analogico 1 Listo
  
  aux[0] = lectura_datos[3] & 15;
  aux[0] = aux[0] << 8;
  aux[1] = lectura_datos[4] & 255;
  canal[1] = (aux[0] + aux[1]);     // Canal Analogico 2 Listo
  
  aux[0] = lectura_datos[1] & 16;
  canal[2] = aux[0];                  // Canal Digital 1 listo
  
  aux[0] = lectura_datos[3] & 16;
  canal[3] = aux[0];                  // Canal Digital 2 listo
 //print(" ( "+ aux[0]);
 
  analog1[i] = canal[0];                 // Guardo los datos desempaquetados en sus respectivas variables para graficar 
  analog2[i] = canal[1]; 
  digital1[i] = canal[2]; 
  digital2[i] = canal[3]; 
  i = i + 1;
  //println(int(canal[0]));
  
  if (i > 9) {                         // Condicion que define cuando ya este lleno el vector para graficar
     j = 1;                              // Variable de control que me permite graficar en pantalla los canales activos y detiene la recepcion de datos 
   }
   println(" ( "+ int(canal[0]) + " "+ int(canal[1]) +" "+ int(canal[2]) +" "+ int(canal[3]) +" ) ");
}
