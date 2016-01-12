class Ship {
  PVector position;
  int health;
  Cannon cannon;
  boolean flipped;
  float x1, y1, x2, y2, x3, y3, x4, y4, t1, t2, t3, i1;

  Ship(PVector shipPosition, float x1i, float y1i, float x2i, float y2i, float x3i, float y3i, float x4i, float y4i, boolean isFlipped, float t1i, float t2i, float t3i, float i1i) {
    position = shipPosition;
    flipped = isFlipped;
    health = 8;
    x1 = x1i;
    x2 = x2i;
    x3 = x3i;
    x4 = x4i;
    y1 = y1i;
    y2 = y2i;
    y3 = y3i;
    y4 = y4i;
    t1 = t1i;
    t2 = t2i;
    t3 = t3i;
    i1 = i1i;

    cannon = new Cannon(int(position.x + shipWidth/2), int(position.y - 15), isFlipped);
  }

  void draw() {
    fill(255);
    rectMode(CORNER);
    //rect(position.x, position.y, shipWidth, shipHeight);
    rectMode(CENTER);
    fill(155);
    if (flipped) { //mast
      rect(920, t1 - 19, 10, i1-110);
    } else {
      rect(80, t1 - 19, 10, i1-110);
    }
    fill(0);
    quad(x1, y1, x2, y2, x3, y3, x4, y4); //ship hull
    fill(255, 252, 237);
    img.resize(100, 50);
    if (flipped) {
      triangle(960, t1, 922, t2, 884, t3); //sail
      pushMatrix();
      scale(-1, 1); 
      image(img, -935, i1); //flag
      popMatrix();
    } else {
      triangle(40, t1, 78, t2, 116, t3); //sail
      image(img, 65, i1); //flag
    }


    cannon.draw();
  }
}