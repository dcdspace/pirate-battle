//GLOBALS
Ball playerBall;

void setup() {
  size(700, 500);
}

void draw() {
  //my edit
  
}

class Ball {
  int radius;
  Location position;
  color ballColor;
  Velocity initialV;
  Velocity finalV;
  Ball(int ballRadius, int x, int y, Velocity startVelocity) {
    radius = ballRadius;
    position = new Location(x, y);
    initialV = startVelocity;
  }
}

class Ship {
  Location position;
  int health;
}

class Player {
  int accuracy;
  int score;
  Ball myBall;
  int lives;
  
}

class Location {
  int x;
  int y;
  Location(int startX, int startY) {
    x = startX;
    y = startY;
  }
}

class Velocity {
  int x;
  int y;
  float a = -9.8;
  float angle;
}