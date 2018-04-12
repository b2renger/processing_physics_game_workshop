
/*
Object : understand setup / draw / coordinates / ellipse / global variables defined by processing / fill and stroke
1 - draw an ellipse that follows the mouse
    => search the documentation to understand how ellipse works
2 - draw four symetric ellipses
3- play with fill and stroke



- curly brackets enclose chunks of code that is read and executed sequentially.
- each instruction ends with a semi-colon.
- processing uses pre-coded functions that are part of a drawing api.
- proocessing also defines global variables that are usable anywhere in the programm by the user.
- a variable is a space of computer memory which holds a value, this space is defined by a name to access it and its data
- you can comment using '//' 


*/

// the setup runs only once : it executes every line of code sequentially
void setup(){
  
  
  size(400,400); // set the size of our window
  //size(800,800);
}


// the draw runs at every frame :
void draw(){
  
  ellipse(mouseX, mouseY, 15, 15);
  ellipse(width -mouseX, mouseY, 15, 15);
  ellipse(width - mouseX, height - mouseY, 15, 15);
  ellipse(mouseX, height - mouseY, 15, 15);
  
}
