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

int diametro = 10; //diametro del click

////////////////////////////////////////////
int tiempo = 0;
int voltaje = 0;
int control = 0;
int a1vd = 5;
int a2vd = 5;
int d1vd = 5;
int d2vd = 5;
/////////////////////////////////////////////
///  indica si esta encendido o no los botones
boolean A1ON = false;
boolean A2ON = false;
boolean D1ON = false;
boolean D2ON = false;
boolean TD1on= false;
boolean TD2on = false;
boolean VD1on = false;
boolean VD2on = false;
///////////////////////////////////////////////
/// Indicativo si el puntero esta en los botones
/*
boolean A1over = false;
boolean A2over = false;
boolean D1over = false;
boolean D2over = false;
boolean TD1Xover= false;
boolean TD2Yover = false;
boolean VD1Xover = false;
boolean VD2Yover = false;*/
/////////////////////////////////////






//color rectColor, circolor, basecolor;
//boolean rectover = false;

int valor;

void setup(){
  size(688,364); // Tamaño de la imagen(H,V)
  ellipseMode(CENTER);
  imagen = loadImage("osciloscopio3.png");
  background(0);
  noStroke(); // elimina circulos generado por el click
}


void draw(){
  clear();
 
  image(imagen,0,0);
  indicador();
 
  
  pantalla();
  


 //println(mouseX,mouseY);
 
}



// Detector de pulsación de botones
void mousePressed(){
// Detector de pulsacion de canal
  if(overCircle(AD1X,AD1Y,diametro)){
    if(A1ON == true && A2ON == false && D1ON == false && D2ON == false){
      A1ON = false;
    }
    else {A1ON = true; A2ON = false; D1ON = false; D2ON = false;}
    }
    
  else if(overCircle(AD2X,AD2Y,diametro)) {
    if(A2ON == true && A1ON == false && D1ON == false && D2ON == false){
      A2ON = false;
  }
    else {A2ON = true; A1ON = false; D1ON = false; D2ON = false;}
  }
  else if(overCircle(D1X,D1Y,diametro)){
    if(D1ON == true && A1ON == false && A2ON == false && D2ON == false){
      D1ON = false;
    }
    else {D1ON = true; A2ON = false; A1ON = false; D2ON = false;}
    }
  else if(overCircle(D2X,D2Y,diametro)){
    if(D2ON == true && A1ON == false && D1ON == false && A2ON == false){
      D2ON = false;
    }
    else {D2ON = true; A2ON = false; D1ON = false; A1ON = false;}
    }
    
    
  // Detector de pulsacion de tiempo +
  else if(overCircle(TD1X,TD1Y,diametro)){
      if(TD1on == true && TD2on == false){
        //TD1on = false;
        if(tiempo == -3){
          tiempo = -2;
        println(tiempo);
      }
          else if (tiempo == -2){
          tiempo = -1;
          println(tiempo);
        }
         else if (tiempo == -1){
          tiempo = 0;
          println(tiempo);
        }
         else if (tiempo == 0){
          tiempo = 1;
          println(tiempo);
        }
         else if (tiempo == 1){
          tiempo = 2;
          println(tiempo);
        }
         else if (tiempo == 2){
          tiempo = 3;
          println(tiempo);
        }
          else if(tiempo == 3){
           // tiempo = 0;
            TD1on = false;  
        }
      }
      else {TD1on=true; TD2on = false;}
  }
  // Detector de pulsacion de tiempo -
  else if(overCircle(TD2X,TD2Y,diametro)){
      if(TD2on == true && TD1on == false){
        //TD1on = false;
        if(tiempo == 3){
          tiempo = 2;
        println(tiempo);
      }
          else if (tiempo == 2){
          tiempo = 1;
          println(tiempo);
        }
         else if (tiempo == 1){
          tiempo = 0;
          println(tiempo);
        }
         else if (tiempo == 0){
          tiempo = -1;
          println(tiempo);
        }
         else if (tiempo == -1){
          tiempo = -2;
          println(tiempo);
        }
         else if (tiempo == -2){
          tiempo = -3;
          println(tiempo);
        }
          else if(tiempo == -3){
           // tiempo = 0;
            TD2on = false;  
        }
      }
      else {TD2on=true; TD1on = false;}
  }
/*else if(overCircle(TD1X,TD1Y,diametro)){
      if(TD1on == true){
        if(tiempo != 3){
        tiempo = tiempo + 1;
        println(tiempo);
        TD2on = false;
        } else TD1on = false;
      }
  }
  else if(overCircle(TD2X,TD2Y,diametro)){
      if(TD2on == true){
        if(tiempo != -3){
        tiempo = tiempo - 1;
        println(tiempo);
        TD2on = false;
        } else TD2on = false;
      }
  }
  */
   // Detector de pulsacion de Voltaje +
   else if(overCircle(VD1X,VD1Y,diametro)){
      if(VD1on == true){
        //TD1on = false;
        if(voltaje == 1){
          voltaje = 2;
        println(voltaje);
      }
          else if (voltaje == 2){
          voltaje = 3;
          println(voltaje);
        }
          else if(voltaje == 3){
            voltaje = 1;
            VD1on = false;  
        }
      }
      else {VD1on=true;}
  }
  // Detector de pulsacion de Voltaje -
    else if(overCircle(VD2X,VD2Y,diametro)){
      if(VD2on == true){
        //TD1on = false;
        if(voltaje == 1){
          voltaje = 2;
        println(voltaje);
      }
          else if (voltaje == 2){
          voltaje = 3;
          println(voltaje);
        }
          else if(voltaje == 3){
            voltaje = 1;
            VD2on = false;  
        }
      }
      else {VD2on=true;}
  }
}



boolean overCircle(int x, int y, int diameter){
  float dx = x-mouseX;
  float dy = y-mouseY;
  if(sqrt(sq(dx)+sq(dy))< diameter/2){
    return true;
  }
  else {return false;}
}

// Coloreado de botones presionados
void indicador(){
  
// Coloreado de botones de canal
 if(A1ON){
 fill(#A04949);
 stroke(0);
 ellipse(AD1X,AD1Y,7,7);
 }
 else if(A2ON){
 fill(#784BCE);
 stroke(1);
 ellipse(AD2X,AD2Y,7,7);
 }
  else if(D1ON){
 fill(#ED1313);
 stroke(2);
 ellipse(D1X,D1Y,7,7);
 }
  else if(D2ON){
 fill(#FAEE08);
 stroke(2);
 ellipse(D2X,D2Y,7,7);
 }

// Coloreado de botones de tiempo
 if(TD1on){
   fill(#FAEE12);
   stroke(1);
   ellipse(TD1X,TD1Y,7,7);
 }
 else if(TD2on){
   fill(#FAEE10);
   stroke(1);
   ellipse(TD2X,TD2Y,7,7);
 }

// Coloreado de botones de voltaje
  if(VD1on){
   fill(#FAEE12);
   stroke(1);
   ellipse(VD1X,VD1Y,7,7);
 }
 else if(VD2on){
   fill(#FAEE10);
   stroke(1);
   ellipse(VD2X,VD2Y,7,7);
 }
}

void pantalla(){
  stroke(255); //Borde del recuadro
  fill(0);  //relleno del recuadro
  rect(60,50,300,240); //(pos x, pos y, tamaño x, tamaño y)
  
   // Dibujado lineas punteadas horizontales
   for (int y = 50; y <= 290; y += 30) {
    for (int x = 60; x <= 360; x += 6) {
      stroke(255);
      line(x,y,x,y);
      line(x,169,x,171); //Linea central
    }
   }
  
  // Dibujado lineas punteadas verticales
   for (int y = 50; y <= 290; y += 6) {
    for (int x = 60; x <= 360; x += 30) {
      stroke(255);
      line(x,y,x,y);
      line(209,y,211,y); //Linea central
    }
   }
   
}



void mouseClicked(){
  if(TD1on == true){
    valor=10;
   // println(valor);
  
  }
}
