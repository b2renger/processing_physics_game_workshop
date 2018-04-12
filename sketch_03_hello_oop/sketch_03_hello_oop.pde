/*
Object : understand how to write and use a a class
 
 
 */

Ball balle;

void setup() {
  size(400, 400); 
  background(0);
  
  balle = new Ball(width/2, height/2);
}



void draw() {

  motionBlur(5);
  
  balle.update(mouseX, mouseY, 0.015);
  balle.display();
 
}


void motionBlur(int transparency) {
  noStroke();
  fill(0, transparency);
  rect(0, 0, width, height);
}


class Ball {
  float xpos;
  float ypos;

  Ball(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  float attract(float target, float position, float sensitivity) {
    position = (target - position) * sensitivity + position;
    return position;
  }
  
  void update(float xtarget, float ytarget, float sensitivity){
     xpos = attract(xtarget, xpos, sensitivity);
     ypos = attract(ytarget, ypos, sensitivity);
  }
  
  void display(){
    fill(255);
    ellipse(xpos, ypos, 15, 15);
  }
}
