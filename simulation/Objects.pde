class Ball {
  PVector position;
  color ballColor;
  PVector v;
  PVector accel;
  PVector translation;
  boolean fired;
  boolean visible;
  boolean flipped;
  float launchAngle;
  int power = 7;
  Ball (PVector startPosition, PVector startVelocity, PVector ballTranslation, boolean isFlipped) {
    position = startPosition;
    v = startVelocity;
    translation = ballTranslation;
    visible = true;
    flipped = isFlipped;
    draw();
  }
  void draw() {
    fill(252, 10, 39);
    if (visible) {
      pushMatrix();
      translate(translation.x, translation.y);
      if (!fired) {
        if (mouseY < 277) {
          if (flipped) {
            launchAngle = abs(radians((277)));
          } else {
            launchAngle = abs(radians(-(277)));
          }
        } else if (mouseY >= 359) {
          launchAngle = 0;
        } else {
          launchAngle = abs(radians(-(mouseY)));
        }
        if (flipped) {
          rotate(-launchAngle + PI);
        } else {
          rotate(launchAngle);
        }
      } else {
        if (flipped) {
          rotate((-launchAngle + PI));
        } else {
          rotate(launchAngle);
        }
      }
      ellipse(position.x, position.y, 30, 30);
      popMatrix();
    }
    if (fired) {
      move();
    }
  }

  void fire(float angle) {
    launchAngle = angle;
    v.x=abs(power*cos(2*PI - launchAngle));
    v.y=-abs(power*sin(2*PI - launchAngle));
    print(" angle: " + degrees(launchAngle));
    println(" xv: " + v.x + " yv: " + v.y);
    fired = true;
  }

  void move() {
    if (flipped) {
      position.x += v.x;
    } else {
      position.x += v.x;
    }
    v.y += .3;
    if (flipped) {
      position.y -= v.y;
    } else {
      position.y += v.y;
    }
    println(position.y);
    pushMatrix();
    translate(position.x, position.y);
    if (abs(position.y)-300 > height) {
      //print("off screen");
      visible = false;
      fired = false;
      game.nextTurn();
    }
    popMatrix();
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
  float angle;
  Cannon(int x, int y, boolean isFlipped) {
    position = new PVector(x, y);
    flipped = isFlipped;
    loaded = false;
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
      translate(920, 392);
      if (loaded) {
        if (mouseY < 277) {
          angle = abs(radians((277)));
        } else if (mouseY >= 359) {
          rotate(0);
          angle = 0;
        } else {
          angle = abs(radians(-(mouseY)));
        }
      } else {
        if (angle < radians(360) && angle != 0) {
          angle += radians(1);
          //rotate(angle);
          println("angle2: " + degrees(angle));
        }
        else {
          rotate(0);
        }
      } 
      rotate(-angle + PI);
      arc(0, 0, 30*.8, 24.5, PI/2, (3*PI)/2, OPEN);

      //cannon shaft 

      rectMode(CENTER);
      fill(150);
      rect(50, 0, 98 + 10, 15 + 10);

      //firing point
      rotate(PI);
      ellipseMode(CENTER);
      noStroke();
      fill(150);
      stroke(0);
      ellipse(-100, 0, 12, 24);
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
      pushMatrix();
      translate(79, 393);
      if (loaded) {
        if (mouseY < 277) {
          rotate(abs(radians(-(277))));
          angle = abs(radians(-(277)));
        } else if (mouseY >= 359) {
          rotate(0);
          angle = 0;
        } else {
          rotate(abs(radians(-(mouseY))));
          angle = abs(radians(-(mouseY)));
        }
      } else {
        if (angle < radians(360)) {
          angle += radians(1);
          rotate(angle);
          println("angle1: " + angle);
        }
        else {
          rotate(0);
        }
      }
      //print("rotating " + (degrees(angle)));

      arc(0, 0, 30*.8, 24.5, PI/2, (3*PI)/2, OPEN);

      //cannon shaft 
      rectMode(CENTER);
      fill(150);
      rect(50, 0, 98 + 10, 15 + 10);

      //fire point of cannon
      ellipseMode(CENTER);
      noStroke();
      fill(150);
      stroke(0);
      ellipse(100, 0, 12, 24);
      popMatrix();
    }
    if (loaded) {
      ball.draw();
    }
  }

  void load() {
    int v = 4;
    //print("loading");
    if (flipped) {
      //print("flipped ball");
      ball = new Ball(new PVector(100, 0), new PVector(v, 0), new PVector(920, 392), true);
    } else {
      ball = new Ball(new PVector(100, 0), new PVector(v, 0), new PVector(79, 393), false);
    }
    loaded = true;
  }

  void fire() {
    if (ball.fired == false) {
      ball.fire(angle);
    }
  }
}

class Player {
  int accuracy;
  int score;
  Ball myBall;
  int lives;
  boolean active;
  Ship ship;
  Player() {
    active = false;
  }
}