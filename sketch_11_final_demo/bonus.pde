
class Bonus {
  float xpos;
  float ypos;
  float speed;

  float counter;
  float seed;
  float diam = 15;

  boolean isBonus = false;

  Bonus(float xpos, float ypos, float speed, boolean isBonus) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.speed = speed;
    this.isBonus = isBonus;
    seed = random(500);
    counter = 0;
  }

  float move(float offset) {
    counter += 0.05;
    return ((noise(counter, seed + offset) * 2) - 1)*speed;
  }

  void update() {
    xpos = xpos + move(15);
    ypos = ypos + move(55);
  }

  void display() {
    noStroke();
    if (isBonus) {
      fill(255, 0, 255);
    } else {
      fill(255, 255, 0);
    }

    ellipse(xpos, ypos, diam, diam);
  }

  void wrap() {
    if (xpos < -diam/2) {
      xpos = width+diam/2;
    }
    if (xpos > width + diam/2) {
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
