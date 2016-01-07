class Ball {
  PVector position;
  color ballColor;
  PVector v;
  PVector finalV;
  PVector accel;
  Ball (PVector startPosition, PVector startVelocity) {
    position = startPosition;
    v = startVelocity;
    draw();
  }
  void draw() {
    fill(252, 10, 39);
    ellipse(position.x, position.y, 30, 30);
  }

  void move() {
    v.y += .1;
    position.x += v.x;
    position.y += v.y;
  }
}

class Ship {
  PVector position;
  int health;
  Cannon cannon;
  boolean flipped;

  Ship(int x, int y, boolean isFlipped) {
    position = new PVector(x, y);
    flipped = isFlipped;
    cannon = new Cannon(int(position.x + shipWidth/2), int(position.y - 15), isFlipped);
  }

  void draw() {
    fill(255);
    rectMode(CORNER);
    rect(position.x, position.y, shipWidth, shipHeight);
    cannon.draw();
  }
}

class Cannon {
  PVector position;
  Ball ball;
  boolean flipped;
  boolean loaded;
  Cannon(int x, int y, boolean isFlipped) {
    position = new PVector(x, y);
    flipped = isFlipped;
    load();
  }
  void draw() {
    if (flipped) {
      //base of cannon
      rectMode(CENTER);
      fill(0);
      rect(position.x, position.y, 98, 15);

      //left wheel of cannon 
      ellipseMode(CENTER);
      noStroke();
      fill(150);
      ellipse(position.x - 20, position.y + 10, 15*.8, 15*.8);

      //right wheel of cannon 
      ellipseMode(CENTER);
      noStroke();
      fill(150);
      ellipse(position.x + 15, position.y + 10, 15*.8, 15*.8);

      //bottom of shaft
      pushMatrix();
      translate(position.x, position.y);
      rotate(PI);
      arc(-40, 20, 30*.8, 24.5, PI/2, (3*PI)/2, OPEN);
      popMatrix();

      //cannon shaft 
      pushMatrix();
      translate(position.x, position.y);
      rotate(PI);

      rectMode(CENTER);
      fill(150);
      rect(14, 20, 98 + 10, 15 + 10);
      popMatrix();
      
      //firing point
      pushMatrix();
      translate(position.x, position.y);
      rotate(PI);
      ellipseMode(CENTER);
      noStroke();
      fill(150);
      stroke(0);
      ellipse(65, 20, 12, 24);
      popMatrix();
      
      
      
      
    } else {
      //base of cannon
      rectMode(CENTER);
      fill(0);
      rect(position.x, position.y, 98, 15);

      //left wheel of cannon 
      ellipseMode(CENTER);
      noStroke();
      fill(150);
      ellipse(position.x - 20, position.y + 10, 15*.8, 15*.8);

      //right wheel of cannon 
      ellipseMode(CENTER);
      noStroke();
      fill(150);
      ellipse(position.x + 15, position.y + 10, 15*.8, 15*.8);

      //bottom of cannon shaft
      //rotate(-PI/10);
      arc(position.x - 40, position.y - 20, 30*.8, 24.5, PI/2, (3*PI)/2, OPEN);

      //cannon shaft 
      rectMode(CENTER);
      fill(150);
      rect(position.x + 10, position.y - 20, 98 + 10, 15 + 10);

      //fire point of cannon
      ellipseMode(CENTER);
      noStroke();
      fill(150);
      stroke(0);
      ellipse(position.x + 60, position.y - 20, 12, 24);
      ball.draw();
    }
  }

  void load() {
    ball = new Ball(new PVector(position.x + 60, position.y - 20), new PVector(5, 0));
    loaded = true;
  }

  void fire() {
    ball.move();
  }
}

class Player {
  int accuracy;
  int score;
  Ball myBall;
  int lives;
}

void keyPressed() {
  if (key == ' ') {
  }
}