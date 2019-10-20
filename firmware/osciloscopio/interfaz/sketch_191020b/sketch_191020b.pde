
PImage imagen;   //Cargar la imagen como fondo de pantalla

void setup(){
  size(688,364); // Tamaño de la imagen(H,V)
  imagen = loadImage("osciloscopio3.png");
  image(imagen,0,0); //posicion de la imagen en el sketch
  
  noStroke(); // desaparezca rectangulos del click sobredibujados
}

void draw(){
  background(imagen); //fondo de pantalla 
  
  //// Configuracion del mouse
  rect(mouseX,mouseY,10,10); //tamaño y forma del click del mouse
  println(mouseX,mouseY); //para saber la posicion del click
  boton(); //Funcion 
}

void boton(){
 // if(mousePressed==1){
    
}
