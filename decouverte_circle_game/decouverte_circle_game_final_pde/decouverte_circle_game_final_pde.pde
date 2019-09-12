
float size = 400;
float step = 1;
int score = 10;
int bestScore = 0;
boolean started = false;
boolean gameOver = false;
float innerRadius = 350;
float outerRadius = 450;
float xoff = 0;
float yoff = 1;
float time = 0;

// init 
void setup() {
  size(600, 600);
  background(0);
}


void draw() {
  if (!gameOver) {
    time = millis();
    background(0);

    // draw red circle
    noStroke();
    fill(255, 0, 0);
    ellipse(width/2, height/2, size, size);

    // draw limits
    noFill();
    stroke(255);
    ellipse(width/2, height/2, outerRadius, outerRadius);
    
    ellipse(width/2, height/2, innerRadius, innerRadius);  
    
    xoff += .01f;
    yoff += .01f;
    outerRadius = ((noise(xoff)*100))+400;
    innerRadius = ((noise(yoff)*100))+300;
    
    if (keyPressed) {
      if (key == 'a') {
        step = 1;
      } else if (key == 'z') {
        step = -1;
        // size = size - 1;
      }
    }
    
    
    if (size < 450 && size > 350) {
      score += 1;
      if(score > bestScore){
        bestScore = score;
      }
    } else {
      score -= 1;
    }
    
    size += step;
    
    fill(255);
    textAlign(CENTER, TOP);
    textSize(20);
    text("Score : "+score, width/2, 50);
  }
  if (score < 0) {
    gameOver = true;
    background(200, 0, 0);
    textSize(50);
    text("Game Over", width/2, height/3);
    text("Score : "+bestScore, width/2,(height/2)+50);
  }
}
