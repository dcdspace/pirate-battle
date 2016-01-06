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
  Ship(int x, int y) {
    position = new PVector(x, y);
  }
  void draw() {
    rect(position.x, position.y, shipWidth, shipHeight);
  }
}

class Cannon {
  PVector position;
  Ball ball;
  Cannon(int x, int y, Ball cannonBall) {
    position = new PVector(x, y);
    ball = cannonBall;
  }
  void draw() {
    
  }
}

class Player {
  int accuracy;
  int score;
  Ball myBall;
  int lives;
}