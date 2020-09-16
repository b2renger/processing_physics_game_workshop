float ellipseSize;
float lowSize;
float offset;
float speed;
int score;
boolean isWin = false;
int stepID = 0;

void setup() {
  size(800, 600);
  textAlign(CENTER);
  initGame();
}

void draw() {
  // Page blanche
  background(255);
  noFill();
  // Rouge
  stroke(255, 0, 0);
 
  // dessine la petite ellipse
  ellipse(width/2, height/2, lowSize, lowSize);
 
  // dessine la grande ellipse
  ellipse(width/2, height/2, lowSize+offset, lowSize+offset);
  // dessine l'ellipse
  // en rose
  stroke(255, 100, 100);
  ellipse(width/2, height/2, ellipseSize, ellipseSize);
  // fait varier la taille de l'ellipse
  ellipseSize += speed;
  ellipseSize = constrain(ellipseSize,0,width);
  // Calcul du score
  // Si la taille de l'ellipse est plus petite que la petite ellipse 
  // ou plus grande que la grande ellipse
  // alors le score diminue
  if(ellipseSize < lowSize || ellipseSize > (lowSize+offset)){
      score--;
  }

  // condition de défaite
  if(score<=0 && isWin == false){
    gameOver();
  }
  
  // Affichage du score
  displayScore();
  
  // passage au niveau 1
  // jouer plus de 30s
  // alors on multiplie la speed par 2
  if(millis() > 30000 && stepID == 0){
    speed *= 2; 
    stepID = 1;
  }
  
  // passage au niveau 2
  // au bout de 60s, on divise l'offset par 2
  if(millis() > 60000 && stepID == 1){
    offset *= 0.5;
    stepID = 2;
  }
  
  // passage au niveau 3
  // on augmente la speed
  if(millis() > 90000 && stepID ==2 ){
    speed *= 1.5;
    stepID = 3;
  }
  
  // pendant le niveau 3 
  // l'offset diminue progressivement
  if(stepID == 3){
    offset -= 0.05;
    offset = constrain(offset, 10, 500);
  }
  
  // Condition de victoire 
  // On gagne si notre score est encore > 0 au bout de 120000 millisecondes (2 minutes) 
  if(millis() > 120000 && score > 0){
    win();
  }
  
  displayTimer();
}

void keyPressed(){
  // On inverse la vitesse lorsqu'on tape une touche.
  speed *= -1;
}

void displayScore(){
  fill(0);
  textSize(32);
  text("score : "+score, width/2, 50); 
}

// Affichage du timer, avec millis()
void displayTimer(){
  fill(0);
  textSize(32);
  text("Timer : "+(int) millis()/1000, width/2, height-50); 
}

void gameOver(){
  background(255,0,0);
  fill(0);
  textSize(40);
  text("Game Over !", width/2,height/2);
}

void win(){
  isWin = true;
  background(255);
  fill(0);
  textSize(40);
  text("You win !", width/2,height/2);
  if (keyPressed) {
      initGame();
  }
}

// Initialisation des variables du jeu.
void initGame(){
  score = 400;
  speed = 1;
  ellipseSize = 250;
  lowSize = 200;
  offset = 100;
  isWin = false;
}
