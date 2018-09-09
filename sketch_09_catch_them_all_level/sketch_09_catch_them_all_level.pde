/*
Object : understand how to use an arraylist and instanciate aa / use for loops / use conditions to keep agent in the frame
 
 
 */

ArrayList <Agent> agents;
ArrayList <Level> levels;
int currentLevelID = 0;
Level currentLevel;
Ball balle;
int agentNumber = 0;
int enemyNumber = 0;
int score = 0;

PFont f;

void setup() {
  size(800, 800); 
  background(0);
  
  agents = new ArrayList<Agent>();
  levels = new ArrayList<Level>();
  // level 1
  levels.add(new Level(1,25,5,25,2,new float[]{2, 6}));
  // level 2
  levels.add(new Level(2,25,10,50,5,new float[]{4,8}));
  currentLevel = levels.get(currentLevelID);
 // for (int i = 0 ; i < 60; i = i +1){
    agents.add(new Agent(width/2, height/2, random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]),false));
 // }
  
  balle = new Ball(mouseX,mouseY);
  f = createFont("Arial",16,true); 
}


int posX = width /2;
int posY = height/2;
int speed = 7;


void draw() {
  fill(255);
  textFont(f); 
  textAlign(LEFT);
  text("Score : "+score,10,20); 

  println(currentLevelID);

  motionBlur(10);
  

  
  // game over
  if(score < 0 ){
    // Open an other sketch with game over screen
  }
  
  if(keyPressed)
  {
      if(isUp){
        posY = posY-speed;
      }
      if(isDown){
        posY = posY+speed;
      }
      if(isRight){
        posX = posX+speed;
      }
      if(isLeft){
        posX = posX-speed;
      }
  }

  
  
  balle.update(posX,posY, 0.015);
  balle.display();
  
  for (int i = 0 ; i < agents.size(); i = i +1){
    Agent agent = (Agent) agents.get(i);
    agent.update();
    agent.display();
    agent.wrap();
    
    if (dist(balle.xpos, balle.ypos, agent.xpos, agent.ypos) < balle.diam/2){
      if(!agent.isEnemy){
        score++;
        agentNumber--;
      }else{
        score -= currentLevel.enemyDamages;
      }
      agents.remove(i);
    }
  }
  
  if((frameCount% 25 ==0) && (agentNumber < currentLevel.agentNumber) ){
    agents.add(new Agent(random(width), random(height), random(0.5, 2),false));  
    agentNumber++;
  }
  
  if((frameCount% 50 ==0) && (agentNumber < currentLevel.enemyNumber)){
    agents.add(new Agent(random(width), random(height), random(0.5, 2),true));
    enemyNumber++;
  }


  if(agentNumber == 0 ){
    nextLevel();
  }
  
}

void nextLevel(){
  currentLevelID++;
  
  if(currentLevelID <= (levels.size()-1)){
    currentLevel = levels.get(currentLevelID++);
  }else{
    // go to win sketch
  }
}
 
  
void motionBlur(int transparency) {
  noStroke();
  fill(0, transparency);
  rect(0, 0, width, height);
}

class Level{
  
  public int agentNumber;
  public int agentRatePop;
  public int enemyNumber;
  public int enemyRatePop;
  public int enemyDamages;
  public float[] agentSpeedRange;
  
  public Level(int agentNumber,int agentRatePop, int enemyNumber,int enemyRatePop, int enemyDamages, float[] agentSpeedRange){
    this.agentNumber = agentNumber;
    this.agentRatePop = agentRatePop;
    this.enemyNumber = enemyNumber;
    this.enemyRatePop = enemyRatePop;
    this.enemyDamages = enemyDamages;
    this.agentSpeedRange = agentSpeedRange;
  }
  
}



class Agent {
  float xpos;
  float ypos;
  float speed;
  
  float counter;
  float seed;
  float diam = 15;
  
  boolean isEnemy = false;
 
  Agent(float xpos, float ypos, float speed,boolean isEnemy) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.speed = speed;
    this.isEnemy = isEnemy;
    seed = random(500);
    counter = 0;
  }

 float move(float offset){
   counter += 0.05;
   return ((noise(counter, seed + offset) * 2) - 1)*speed;
 }
  
  void update(){
     xpos = xpos + move(15);
     ypos = ypos + move(55);
  }
  
  void display(){
    if(isEnemy){
      fill(255,0,0);
    }else{
      fill(255);
    }
    
    ellipse(xpos, ypos, diam, diam);
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



class Ball {
  float xpos;
  float ypos;
  float diam = 30;

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

// Multikey input

boolean isLeft, isRight, isUp, isDown; 

void keyPressed() {
  setMove(keyCode, true);
}
 
void keyReleased() {
  setMove(keyCode, false);
}
 
boolean setMove(int k, boolean b) {
  switch (k) {
  case UP:
    return isUp = b;
 
  case DOWN:
    return isDown = b;
 
  case LEFT:
    return isLeft = b;
 
  case RIGHT:
    return isRight = b;
 
  default:
    return b;
  }
}
