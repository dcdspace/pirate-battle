class Ship {
  PVector position;
  int health;
  Cannon cannon;
  boolean flipped;
  float x1, y1, x2, y2, x3, y3, x4, y4;

  Ship(PVector shipPosition, float x1i, float y1i, float x2i, float y2i, float x3i, float y3i, float x4i, float y4i, boolean isFlipped) {
    position = shipPosition;
    flipped = isFlipped;
    x1 = x1i;
    x2 = x2i;
    x3 = x3i;
    x4 = x4i;
    y1 = y1i;
    y2 = y2i;
    y3 = y3i;
    y4 = y4i;
    cannon = new Cannon(int(position.x + shipWidth/2), int(position.y - 15), isFlipped);
  }

  void draw() {
    fill(255);
    rectMode(CORNER);
    //rect(position.x, position.y, shipWidth, shipHeight);
    fill(0);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    rectMode(CENTER);
    fill(155);
    if (flipped) {
      rect(920, 356, 10, 140);
    } else {
      rect(80, 356, 10, 140);
    }
    fill(0);
    img.resize(100, 50);
    if (flipped) {
      triangle(960, 375, 922, 280, 884, 375);

      pushMatrix();
      scale(-1, 1); 
      image(img, -935, 250);
      popMatrix();
    } else {
      triangle(40, 375, 78, 280, 116, 375);
      image(img, 65, 250);
    }


    cannon.draw();
  }
}