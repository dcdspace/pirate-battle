class Ball {
  PVector position;
  color ballColor;
  PVector v;
  float accel = .2;
  PVector translation;
  boolean fired;
  boolean visible;
  boolean flipped;
  float launchAngle;
  float power = 12;
  Ball (PVector startPosition, PVector startVelocity, PVector ballTranslation, boolean isFlipped) {
    position = startPosition;
    v = startVelocity;
    translation = ballTranslation;
    visible = true;
    flipped = isFlipped; //see if it is the second player's
    draw();
  }
  void draw() {
    fill(252, 10, 39);
    if (visible) {
      if (!fired) {
        pushMatrix(); //keep ball fixed to cannon while rotating
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
      } 
      if (!fired) {
        popMatrix();
      }
    }
    if (fired) {
      ellipse(position.x, position.y, 30, 30);
      move();
    }
    if (keyPressed) { //adjust velocity and acceleration of ball with keys
      if (keyCode == UP && power < 22) {
        power += 0.5;
      }
      if (keyCode ==DOWN && power > 0) {
        power -= 0.5;
      }
      if (keyCode == LEFT && accel > .1) {
        accel -= 0.05;
      }
      if (keyCode == RIGHT && accel < .5) {
        accel += 0.05;
      }
    }
  }

  void fire(float angle) {
    launchAngle = angle;

    if (flipped) {
      position = originalVector(position, translation, PI - launchAngle); //get the untranslated/rotated coordinates of ball
    } else {
      position = originalVector(position, translation, 2*PI - launchAngle);
    }
    v.x=abs(power*cos(2*PI - launchAngle)); //get initial x velocity based on launch angle
    v.y=abs(power*sin(2*PI -launchAngle)); //get initial y velocity based on launch angle
    fired = true; //ball has been fired from cannon and is now in play
  }

  void move() {
    //println("p.y = " + position.y);
    v.y -= accel; //downwards gravitational acceleration acting on y component of velocity
    //println(" xv: " + v.x + " yv: " + v.y);
    if (flipped) { //either add x if going right or subtract for left
      position.x -= v.x;
    } else {
      position.x += v.x;
    }
    position.y -= v.y; // add y velocity to position, accounting for acceleration

    if (abs(position.y) > height) { //ball hit water
      visible = false;
      fired = false;
      splash.trigger();
      game.nextTurn();
    }
  }
}