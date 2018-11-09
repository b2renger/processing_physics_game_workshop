/*
Object : understand how to use an arraylist and instanciate aa / use for loops / use conditions to keep agent in the frame
 
 
 */

ArrayList <Agent> agents;


void setup() {
  size(400, 400,P3D); 
  background(0);
  
  agents = new ArrayList<Agent>();
  lights();
  for (int i = 0 ; i < 60; i = i +1){
    agents.add(new Agent(width/2, height/2, random(0.5, 2)));
  }
}



void draw() {

  motionBlur(10);
  
  for (int i = 0 ; i < agents.size(); i = i +1){
    Agent agent = (Agent) agents.get(i);
    agent.update();
    agent.display();
    agent.wrap();
  }
 
}


void motionBlur(int transparency) {
  noStroke();
  fill(0, transparency);
  rect(0, 0, width, height);
}


class Agent {
  float xpos;
  float ypos;
  float speed;
  
  float counter;
  float seed;
  float diam = 15;
 

  Agent(float xpos, float ypos, float speed) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.speed = speed;
    
    seed = random(500);
    counter = 0;
  }

 float move(float offset){
   counter += 0.05;
  // return ((noise(counter, seed + offset) * 2) - 1)*speed;
  println(((noise(counter, offset+seed)*2)-1)*speed);
   return ((noise(counter, offset+seed)*2)-1)*speed;
 }
  
  void update(){
     xpos = xpos + move(15);
     ypos = ypos + move(55);
  }
  
  void display(){
    noFill();
    stroke(255);
    pushMatrix();
    translate(xpos,ypos,random(0,10));
    rotateZ(10);
    box(diam);
    popMatrix();
  }
  
  void wrap(){
    if (xpos < -diam/2) {
      xpos = width+diam/2;
    }
    if (xpos > width + diam/2){
      xpos = -diam/2;
    }
    if (ypos < -diam/2) {
      ypos = height+diam/2;
    }
    if (ypos > height +diam/2) {
      ypos = -diam/2;
    }
  }
  
}
