//GLOBALS
GameController game;
int shipWidth = 250;
int shipHeight = 175;

void setup() {
  size(1000, 600);
  Ship ship1 = new Ship(0, height - shipHeight);
  Ship ship2 = new Ship(width-shipWidth, height - shipHeight);
  game = new GameController(ship1, ship2);
}

void draw() {
  background(28, 158, 255);
  game.drawBoard();
}