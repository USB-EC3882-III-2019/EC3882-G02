class Ring {
  
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the ring
  boolean on = false; // Turns the display on and off
  
  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    on = true;
    diameter = 1;
  }
  
  void grow() {
    if (on == true) {
      diameter += 3;
      if (diameter > 100) {
        diameter = 0.0;
      }
    }
  }
  
  void display() {
    if (on == true) {
      noFill();
      strokeWeight(5);
      stroke(155, 153);
      ellipse(x, y, diameter*0.25, diameter*0.25);
    }
    if (on == true) {
      noFill();
      strokeWeight(5);
      stroke(155, 153);
      ellipse(x, y, diameter*1.25, diameter*1.25);
    }
    if (on == true) {
      noFill();
      strokeWeight(5);
      stroke(155, 153);
      ellipse(x, y, diameter*2.25, diameter*2.25);
    }
    if (on == true) {
      noFill();
      strokeWeight(5);
      stroke(155, 153);
      ellipse(x, y, diameter*3.25, diameter*3.25);
    }
    if (on == true) {
      noFill();
      strokeWeight(5);
      stroke(155,153);
      ellipse(x, y, diameter*4.25, diameter*4.25);
    }
  }
}
