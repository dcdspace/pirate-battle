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
        } else {
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
        if (angle < radians(360) && angle != 0) {
          angle += radians(1);
          rotate(angle);
          println("angle1: " + angle);
        } else {
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