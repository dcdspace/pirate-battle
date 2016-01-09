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
  int power = 10;
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