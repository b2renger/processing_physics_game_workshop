/*
Object : understand how to write and use a function with a return value
 
 - a function is a code block that executes a series of instructions sequentially
 - a function can be void so it just manipulates variables or drawing function
 OR it can calculate a new variable and return the result
 - you can pass arguments to a function
 
 */

// global variable available in our whole programm
float xpos;
float ypos;

void setup() {
  size(400, 400); 
  background(0);
  xpos = 0;
  ypos = 0;
}



void draw() {

  motionBlur(5);

  xpos = attract(mouseX, xpos, 0.015);
  ypos = attract(mouseY, ypos, 0.015);

  fill(255);
  ellipse(xpos, ypos, 15, 15);
}


void motionBlur(int transparency) {
  noStroke();
  fill(0, transparency);
  rect(0, 0, width, height);
}

float attract(float target, float position, float sensitivity) {
  position = (target - position) * sensitivity + position;
  return position;
}
