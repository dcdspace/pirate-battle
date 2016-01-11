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
    currentPlayer.active = true;
  }

  void drawBoard() {
    for (Ship ship : ships) {
      ship.draw();
    }
    if (currentPlayer.ship.cannon.loaded == false) {
      currentPlayer.ship.cannon.load();
    }
    checkCollisions();

    //score board
    textSize(30);
    textAlign(LEFT);
    if (player1.active) {
      fill(42, 255, 15);
    } else {
      fill(255);
    }
    text("Player 1", 10, 40);
    fill(255);
    textSize(20);
    text("Score: " + player1.score, 10, 75);
    textSize(30);
    textAlign(RIGHT);
    if (player2.active) {
      fill(42, 255, 15);
    } else {
      fill(255);
    }
    text("Player 2", width-10, 40);
    fill(255);
    textSize(20);
    text("Score: " + player2.score, width - 10, 75);

    textAlign(CENTER);
    int angle = int(360 - degrees(currentPlayer.ship.cannon.angle));
    if (angle == 360) {
      angle = 0;
    }
    if (currentPlayer.ship.cannon.loaded) {
      float velocity = truncate(currentPlayer.ship.cannon.ball.v.mag());
      float accel = truncate(currentPlayer.ship.cannon.ball.accel);

      if (currentPlayer.ship.cannon.ball.fired == false) {
        velocity = currentPlayer.ship.cannon.ball.power;
      }
      text("Acceleration: " + accel, width/2, 20);
      text("Velocity: " + velocity, width/2, 40);
      text("Angle: " + angle + "˚", width/2, 60);
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

  void restart() {
    player1.score = 0;
    player2.score = 0;
    currentPlayer.active = false;
    currentPlayer.ship.cannon.loaded = false;
    currentPlayer = player1;
    currentPlayer.active = true;
    firstShot = false;
  }

  void checkCollisions() {
    Ball currentBall = currentPlayer.ship.cannon.ball;
    //println("ball position: " + currentBall.position);
    PVector translation;
    Ship currentShip;
    if (currentPlayer == player1) {
      currentShip = player2.ship;
      if (currentBall.position.x >= currentShip.x1 && currentBall.position.y >= currentShip.y1 && currentBall.position.y <= currentShip.y1 + 20) {
        println("ball position: " + currentBall.position.y);
        currentPlayer.ship.cannon.ball.visible = false;
        currentPlayer.ship.cannon.ball.fired = false;
        currentPlayer.score ++;
        nextTurn();
      }
    } else {
      currentShip = player1.ship;
      if (currentBall.position.x <= currentShip.x1 && currentBall.position.y >= currentShip.y1 && currentBall.position.y <= currentShip.y1 + 20) {
        println("ball position: " + (-currentBall.position.y));
        println("ship position: " + currentShip.y1);
        currentPlayer.ship.cannon.ball.visible = false;
        currentPlayer.ship.cannon.ball.fired = false;
        currentPlayer.score ++;
        nextTurn();
      }
    }
  }
}


class Player {
  int accuracy;
  int score;
  int lives;
  boolean active;
  Ship ship;
  Player() {
    active = false;
  }
}