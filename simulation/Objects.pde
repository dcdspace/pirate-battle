class Ball {
  int radius;
  PVector position;
  color ballColor;
  PVector initialV;
  PVector finalV;
  PVector accel;
  Ball(int ballRadius, int x, int y, PVector startVelocity) {
    radius = ballRadius;
    position = new PVector(x, y);
    initialV = startVelocity;
  }
  void draw() {
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
    rectMode(CORNER);
    rect(position.x, position.y, shipWidth, shipHeight);
    cannon.draw();
  }
}

class Cannon {
  PVector position;
  Ball ball;
  boolean flipped;
  Cannon(int x, int y, boolean isFlipped) {
    position = new PVector(x, y);
    flipped = isFlipped;
  }
  void draw() {
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
  }
}

class Player {
  int accuracy;
  int score;
  Ball myBall;
  int lives;
}