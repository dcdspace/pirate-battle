class GameController {
  Ball mainBall;
  Player player1;
  Player player2;
  Player currentPlayer;
  ArrayList<Ship> ships = new ArrayList<Ship>();
  GameController(Ship ship1, Ship ship2) {
    ships.add(ship1);
    ships.add(ship2);
    player1 = new Player();
    player2 = new Player();
    player1.ship = ship1;
    player2.ship = ship2;
    currentPlayer = player1;
  }

  void drawBoard() {
    for (Ship ship : ships) {
      ship.draw();
    }
    if (currentPlayer.ship.cannon.loaded == false) {
      currentPlayer.ship.cannon.load();
    }
  }

  void fire() {
    currentPlayer.ship.cannon.fire();
  }

  void nextTurn() {
    currentPlayer.active = false;
    currentPlayer.ship.cannon.loaded = false;

    if (currentPlayer == player1) {
      currentPlayer = player2;
    } else {
      currentPlayer = player1;
    }
    currentPlayer.ship.cannon.loaded = false;
    currentPlayer.active = true;
  }
}


class Player {
  int accuracy;
  int score;
  Ball myBall;
  int lives;
  boolean active;
  Ship ship;
  Player() {
    active = false;
  }
}