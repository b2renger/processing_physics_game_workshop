
class Ball {
  float xpos;
  float ypos;
  float diam = 50;

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
    stroke(255);
    noFill();
    ellipse(xpos, ypos, diam, diam);
  }
}
