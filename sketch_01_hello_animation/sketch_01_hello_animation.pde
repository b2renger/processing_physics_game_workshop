/*
Object : understand variables and their scope / frame by frame animation

1 - draw an ellipse that is attracted by the mouse
2 - build a simple motion blur effect with accumulative drawing and transparency


- global variables are defined outside setup or draw they are available everywhere in our programm
- local variables are defined in a code block (in between curly brackets) and are available only in this code block
- an animation is made frame by frame, by changing a value a little bit at each frame we can create an illusion of continuous animation

*/

// global variable available in our whole programm
float xpos;
float ypos;

void setup(){
  size(400,400); 
  background(0);
  xpos = 0;
  ypos = 0;
}



void draw(){
  background(0);
  /*
   noStroke();
   fill(0,5);
   rect(0,0, width,height);*/
  
  // local variables available only in the 'loop' code block
  float xtarget = mouseX;
  float ytarget = mouseY;
  
  xpos = lerp(xpos,xtarget,0.5);
  ypos = lerp(ypos,ytarget,0.5);
  //xpos = (xtarget - xpos)*0.015 + xpos;
  //ypos = (ytarget - ypos)*0.015 + ypos;
  
  fill(255);
  ellipse(xpos, ypos, 15, 15);
  
}
