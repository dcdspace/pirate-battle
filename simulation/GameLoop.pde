class GameController {
  Ball mainBall;
  ArrayList<Ship> ships = new ArrayList<Ship>();
  GameController(Ship ship1, Ship ship2) {
    ships.add(ship1);
    ships.add(ship2);
  }

  void drawBoard() {
    for (Ship ship : ships) {
      ship.draw();
    }
  }
  
  void fire() {
    ships.get(0).cannon.fire();
  }
}