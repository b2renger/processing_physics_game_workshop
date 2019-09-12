float step = 5;
int score = 0;
float radius = 100;

void setup() {
  size(600, 600);
  background(180);
}

void draw() {
  background(180);
  noStroke();
  fill(255, 180, 180);
  ellipse(width/2, height/2, radius, radius);
  if (key == 'a') {
    radius += step;
  } else if (key == 'z') {
    radius -=step;
  }
  if (radius > 350 && radius < 500){
   score ++; 
  }
  else{
   score--; 
  }
  noFill();
  stroke(0);
  ellipse(width/2,height/2, 350, 350);
  ellipse(width/2,height/2, 500, 500);
  textSize(36);
  fill(0);
  text("score : " + score,20, 40);
}
