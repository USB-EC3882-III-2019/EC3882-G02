import processing.serial.*; //Libreria 


String ListaPuerto[];
Serial Puerto; // Creacion objeto tipo serial


byte[] lectura;
int [] canal;
int [] A1;
int A2[];
int D1[];
int D2[];


void setup(){
  println(Serial.list()); //indique la lista de puertos

  ListaPuerto=Serial.list();
  println(ListaPuerto[0]);
  
  Puerto = new Serial(this, ListaPuerto[0],9600);
  println(Puerto); //verificar si esta correcto
  //Puerto.buffer(500);
  
  //lectura = new byte[5]; //  leer los 5 bytes del entramado
 /* canal = new int[4];   // donde se guardaran los canales analogico y digital 
  A1 = new int[1000]; // 1000 veces por segundo
  A2 = new int[1000];
  D1 = new int[1000];
  D2 = new int[1000];
  */
  ///////////////////////////////
  

};

void draw(){
//Dato = Puerto.read();
 

}

//void serialEvent(Serial Puerto){
 
  //lectura[0] = byte(Puerto.read());
/*lectura[1] = byte(Puerto.read());
  lectura[2] = byte(Puerto.read());
  lectura[3] = byte(Puerto.read());
  lectura[4] = byte(Puerto.read());*/
//}
