class Egg {
  float x, y; // X-coordinate, y-coordinate
  float tilt; // Left and right angle offset
  float angle; // Used to define the tilt
  float scalar; // Height of the egg

  // Constructor
  Egg(float xpos, float ypos, float t, float s) {
    x = xpos;
    y = ypos;
    tilt = t*3;
    scalar = s / 100.0;
  }

  void wobble() {
    tilt = cos(angle) / 2;
    angle += 0.3;
  }

  void display() {
    /*
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(tilt);
    scale(scalar);
    beginShape();
    vertex(0, 0);
    bezierVertex(25, -100, 40, -65, 40, -40);
    bezierVertex(40, -15, 25, 0, 0, 0);
    bezierVertex(-25, 0, -40, -15, -40, -40);
    bezierVertex(-40, -65, -25, -100, 0, -100);
    endShape();
    popMatrix();*/
    fill(255,0,0);
    ellipse (320,275,70,70);
    
    fill(0,255,0);
    ellipse (575,340,80,80);
  
    fill(0,0,255);
    ellipse (832,550,100,100);
  }
  
}
