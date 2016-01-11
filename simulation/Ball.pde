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
  float power = 13;
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
      if (!fired) {
        pushMatrix();
        translate(translation.x, translation.y);
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
          //rotate((-launchAngle + PI));
          //position = originalVector(position, translation, -launchAngle + PI);
        } else {
          //rotate(launchAngle);
        }
      }
      if (!fired) {
        popMatrix();
      }
    }
    if (fired) {
      ellipse(position.x, position.y, 30, 30);
      move();
    }
    if (keyPressed) {
      if (keyCode == UP && power < 22) {
        power++;
      }
      if (keyCode ==DOWN && power > 0) {
        power--;
      }
    }
  }

  void fire(float angle) {
    launchAngle = angle;

    println("p.xi = " + position.x);
    if (flipped) {
      position = originalVector(position, translation, PI - launchAngle);
      print("new position: " + position);
    } else {
      position = originalVector(position, translation, 2*PI - launchAngle);
    }
    print("angle: " + int(degrees(2*PI - launchAngle)));
    v.x=abs(power*cos(2*PI - launchAngle));
    println("v.x = " + v.x);
    v.y=abs(power*sin(2*PI -launchAngle));
    //print(" angle: " + degrees(launchAngle));
    fired = true;
  }

  void move() {
    println("p.x = " + position.x);

    v.y -= .2;
    println(" xv: " + v.x + " yv: " + v.y);

    if (flipped) {
      position.y -= v.y;
      position.x -= v.x;
    } else {
      position.y -= v.y;
      position.x += v.x;
    }
    //println(position.y);
    //pushMatrix();
    //translate(position.x, position.y);
    if (abs(position.y)-300 > height) {
      //print("off screen");
      visible = false;
      fired = false;
      game.nextTurn();
    }
    //popMatrix();
  }
}