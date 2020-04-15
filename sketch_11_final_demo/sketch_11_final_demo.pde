/*
final demo
 x seperate into tabs
 x add bonus / malus
 x repulse hero when touching enemy
 - add sounds - track and effects
 - audio reactive background
 
 */


import processing.sound.*;
SoundFile backtrack;
Amplitude amp;
SoundFile eat;
SoundFile error;
SoundFile winner;
SoundFile gameover;
SoundFile powerup;
SoundFile powerdown;

Ball balle;
float sensitivity = 0.075;
ArrayList <Agent> agents;
ArrayList <Level> levels;
ArrayList <Bonus> bonuses;


int currentLevelID = 0;
Level currentLevel;

int agentNumber = 0;
int enemyNumber = 0;

boolean stopAgentPop = false;
boolean stopEnemyPop = false;

int score = 0;

boolean win = false;
boolean loose = false;

PFont f, f2;

void setup() {
  size(800, 800); 
  background(0);

  agents = new ArrayList<Agent>();
  levels = new ArrayList<Level>();
  bonuses = new ArrayList<Bonus>();
  // level 1 : int agentNumber,int agentRatePop, int enemyNumber,int enemyRatePop, int enemyDamages, float[] agentSpeedRange)
  levels.add(new Level(4, 25, 10, 75, 1, new float[]{1, 2})); 
  // level 2
  levels.add(new Level(10, 50, 20, 50, 2, new float[]{2, 6}));
  levels.add(new Level(15, 75, 35, 15, 3, new float[]{5, 8}));
  currentLevel = levels.get(currentLevelID);
  // for (int i = 0 ; i < 60; i = i +1){
  agents.add(new Agent(width/2, height/2, random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), false));
  agentNumber++;
  // }

  balle = new Ball(mouseX, mouseY);
  f = createFont("Arial", 16, true); 
  f2 = createFont("Arial", 100, true);

  backtrack = new SoundFile(this, "backtrack_242550__foolboymedia__ch-ode-to-dub-step.wav");
  backtrack.amp(0.5);
  backtrack.loop();
  amp = new Amplitude(this);
  amp.input(backtrack);

  eat = new SoundFile(this, "eat_277215__thedweebman__8-bit-coin.wav");
  eat.amp(0.35);
  error = new SoundFile(this, "error_325113__fisch12345__error.wav");
  error.amp(0.35);

  winner = new SoundFile(this, "win_341627__projectsu012__fast-paced-achievement.wav");
  winner.amp(0.4);
  gameover = new SoundFile(this, "gameover_390539__burghrecords__dystopian-future-fx-sounds-81.wav");
  gameover.amp(0.4);

  powerup = new SoundFile(this, "bonus_344307__musiclegends__powerup13.wav");
  powerdown = new SoundFile(this, "powerdown_320439__n-audioman__powerdown.wav");
}


int posX = width /2;
int posY = height/2;
int speed = 7;
int nagentsEaten = 0;


void draw() { 


  fill(255);
  textFont(f); 
  textAlign(LEFT);
  text("Score : "+score, 10, 20);
  textAlign(RIGHT);
  text("Level : "+(currentLevelID+1), 780, 20);
  text("to next level : "+agentNumber, 780, 50);

  println(currentLevelID);

  motionBlur(15);

  // game over
  if (score < 0 ) {
    loose = true;
  }



  sensitivity = constrain(sensitivity, 0, 1);
  //balle.diam = 50;
  balle.update(mouseX, mouseY, sensitivity);
  balle.display();

  for (int i = 0; i < agents.size(); i = i +1) {
    Agent agent = (Agent) agents.get(i);
    agent.update();
    agent.display();
    agent.wrap();

    if (dist(balle.xpos, balle.ypos, agent.xpos, agent.ypos) < balle.diam/2) {
      if (!agent.isEnemy) {
        score++;
        agentNumber--;

        eat.play();
      } else {

        if (random(1)> 0.5) mouseX += 250;
        else mouseX -= 250;
        if (random(1)> 0.5) mouseY += 250;
        else mouseY -= 250;
        error.play();

        score -= currentLevel.enemyDamages;
      }
      agents.remove(i);
    }
  }

  for (int i = 0; i < bonuses.size(); i = i +1) {
    Bonus bonus = (Bonus) bonuses.get(i);
    bonus.update();
    bonus.display();
    bonus.wrap();

    if (dist(balle.xpos, balle.ypos, bonus.xpos, bonus.ypos) < balle.diam/2) {
      if (bonus.isBonus) {
        powerup.play();
        if (random(1)> 0.5) {
          sensitivity += ( 0.03);
        } else {
          int numRemoved = 0;
          while (numRemoved < 5) {
            int id = int(random(agents.size()));
            Agent a = agents.get(id);
            if (a.isEnemy == true) {
              agents.remove(id);
              numRemoved ++;
            }
          }
        }
      } else {
        powerdown.play();
        if (random(1)> 0.5) {
          sensitivity -= ( 0.03);
        } else {
          agents.add(new Agent(width/2, height/2, random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), true));
          agents.add(new Agent(width/2, height/2, random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), true));
          agents.add(new Agent(width/2, height/2, random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), true));
          agents.add(new Agent(width/2, height/2, random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), true));
          agents.add(new Agent(width/2, height/2, random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), true));
        }
      }
      bonuses.remove(i);
    }
  }

  if ((frameCount% currentLevel.agentRatePop ==0) && (agentNumber < currentLevel.agentNumber) && !stopAgentPop) {
    agents.add(new Agent(random(width), random(height), random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), false));  
    agentNumber++;
  } else if (!(agentNumber < currentLevel.agentNumber)) {
    stopAgentPop = true;
  }

  if ((frameCount% currentLevel.enemyRatePop ==0) && (enemyNumber < currentLevel.enemyNumber) && !stopEnemyPop) {
    agents.add(new Agent(random(width), random(height), random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), true));
    enemyNumber++;
  } else if (!(enemyNumber < currentLevel.enemyNumber)) {
    stopEnemyPop = true;
  }

  if (frameCount% 500 ==0) {
    bonuses.add(new Bonus(random(width), random(height), random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), true));
  }

  if ((frameCount + 250)% 500 ==0) {
    bonuses.add(new Bonus(random(width), random(height), random(currentLevel.agentSpeedRange[0], currentLevel.agentSpeedRange[1]), false));
  }

  if ((frameCount% currentLevel.agentRatePop ==0) && agentNumber == 0 && !win) {
    nextLevel();
  }

  // Win 
  if (win) {
    fill(255);
    textFont(f2); 
    textAlign(CENTER);
    text("YOU WIN !", 400, 400);
    if (!winner.isPlaying()) {
      winner.play();
      backtrack.stop();
    }
  }

  // Loose
  if (loose) {
    fill(255);
    textFont(f2); 
    textAlign(CENTER);
    text("GAME OVER !", 400, 400);
    if (!gameover.isPlaying()) {
      gameover.play();
      backtrack.stop();
    }
  }

  /*
  if (keyPressed)
   {
   if (isUp) {
   posY = posY-speed;
   }
   if (isDown) {
   posY = posY+speed;
   }
   if (isRight) {
   posX = posX+speed;
   }
   if (isLeft) {
   posX = posX-speed;
   }
   }*/
}

void nextLevel() {
  currentLevelID++;
  if (currentLevelID < (levels.size())) {
    currentLevel = levels.get(currentLevelID);
    stopAgentPop = false;
    stopEnemyPop = false;
  } else {
    win = true;
  }
}


void motionBlur(int transparency) {
  noStroke();
  println(amp.analyze()*100000);
  colorMode(HSB,255,255,255);
  fill(120,125,amp.analyze()*1000+10,transparency);
  rect(0, 0, width, height);
   colorMode(RGB,255,255,255);
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
