import processing.serial.*;

PImage imagen;   //Cargar la imagen como fondo de pantalla
Serial Puerto;


// Posicion de los botones ////////////////// 
int AD1X =465;  //Canal Analógico 1  
int AD1Y =96;

int AD2X = 505;  //Canal Analógico 2 
int AD2Y = 96;

int D1X =  562; // Canal digital 1
int D1Y =  96;

int D2X = 594;  //Canal digital 2
int D2Y = 96;

int TD1X = 492;  //time/div +
int TD1Y = 174;

int TD2X = 460; //time/div -
int TD2Y = 174;

int VD1X = 586; // volt/div +
int VD1Y = 174;

int VD2X = 554; //volt/div -
int VD2Y = 174;
/////////////////////////////////////////////

int diametro = 10;

//int w =25;
//int h =20; 
boolean A1ON = false;
boolean A2ON = false;
boolean D1ON = false;
boolean D2ON = false;
///////////////////////////////////////////////

//color rectColor, circolor, basecolor;
//boolean rectover = false;



void setup(){
  size(688,364); // Tamaño de la imagen(H,V)
  //rectColor = color(150);
  //circolor =  color(255);
  //basecolor= color(102);
  ellipseMode(CENTER);
  
  imagen = loadImage("osciloscopio3.png");
  background(0);
  
  noStroke(); // elimina circulos generado por el click
}


void draw(){
  clear();
  image(imagen,0,0);
  leds();
  
  
  //background(imagen); //fondo de pantalla 

  //// Configuracion del mouse
 //rect(mouseX,mouseY,5,5); //tamaño y forma del click del mouse
 // println(mouseX,mouseY); //para saber la posicion del click
// ellipse (mouseX,mouseY,20,20);

 println(mouseX,mouseY);
 
 /* funciona si trabajamos con un recuadro
 if (mousePressed&&boton){
   background(255);
 }
 else {
   background(imagen);
 }
fill(20);
rect(x,y,w,h);*/

/* Funciona pero se tendria que hacer con cada boton 
float d =dist(mouseX,mouseY,AD1X,AD1Y);
if(d<radio){
  background(0);
}
*/

}



boolean overCircle(int x, int y, int diameter){
  float dx = x-mouseX;
  float dy = y-mouseY;
  if(sqrt(sq(dx)+sq(dy))< diameter/2){
    return true;
  }
  else {return false;}
}


void mousePressed(){
  if(overCircle(AD1X,AD1Y,diametro)){
    if(A1ON == true){
      A1ON = false;
    }
    else {A1ON = true;}
    }
    
  else if(overCircle(AD2X,AD2Y,diametro)) {
    if(A2ON == true){
      A2ON = false;
  }
  else {A2ON = true;}
  }
  else if(overCircle(D1X,D1Y,diametro)){
    if(D1ON == true){
      D1ON = false;
    }
    else {D1ON = true;}
    }
   else if(overCircle(D2X,D2Y,diametro)){
    if(D2ON == true){
      D2ON = false;
    }
    else {D2ON = true;}
    }

}


void leds(){
 if(A1ON){
 fill(#A04949);
 stroke(0);
 ellipse(AD1X,AD1Y,5,5);
 }
 else if(A2ON){
 fill(#784BCE);
 stroke(1);
 ellipse(AD2X,AD2Y,5,5);
 
 }
 
}







/*
void mousePressed(){

  
  if( (mouseX>x)&&(mouseX < x+w) &&(mouseY>y)&&(mouseY<y+h)){
  if(boton){
    boton = false;
  }
  }
  else {
    boton = true;
  }
  
}*/
