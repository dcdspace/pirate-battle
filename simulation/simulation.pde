//GLOBALS
GameController game;
int shipWidth = 250;
int shipHeight = 175;
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
  img3.resize(width/2, 150);
  image(img3, 0, 450);

  img4.resize(width/2, 150);
  image(img3, width/2, 450);
  game.drawBoard();
}

void mousePressed() {
  println("x: " + mouseX + " y: " + mouseY);
}


void keyPressed() {
  if (key == ' ') {
    game.fire();
  }
}