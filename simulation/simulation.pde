//GLOBALS
GameController game;
int shipWidth = 250;
int shipHeight = 175;
boolean firstShot = false;
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  size(1000, 600);
  Ship ship1 = new Ship(new PVector (0, height - shipHeight), 200, 425, 10, 425, 30, 525, 120, 525, false);
  Ship ship2 = new Ship(new PVector (width-250, height - shipHeight), 800, 425, 990, 425, 970, 525, 880, 525, true);
  game = new GameController(ship1, ship2);
  cursor(CROSS);
  img = loadImage("skulls.png");
  img3 = loadImage("waves2.png");
  img4 = loadImage("waves2.png");
}

void draw() {
  background(28, 158, 255);
  game.drawBoard();
  img3.resize(width/2, 150);
  image(img3, 0, 450);

  img4.resize(width/2, 150);
  image(img3, width/2, 450);
  
  if(!firstShot){
    textSize(30);
    textAlign(CENTER);
    text("Instructions:", width/2, (height/2)-20);
    textSize(20);
    text("Use Mouse to alter firing angle", width/2, (height/2));
    textSize(20);
    text("Use UP and Down arrows to alter initial velocity", width/2, (height/2)+20);
  }
}

float truncate(float x) {
    return round( x * 100.0f ) / 100.0f;
}

PVector originalVector (PVector rotated, PVector translate, float rotateAngle) {
return new PVector(translate.x + cos(rotateAngle) * rotated.y, (translate.y + sin(rotateAngle) * rotated.y));
}

void mousePressed() {
  println("x: " + mouseX + " y: " + mouseY);
}


void keyPressed() {
  if (key == ' ') {
    game.fire();
    firstShot = true;
  }
}