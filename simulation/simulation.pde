import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//GLOBALS
GameController game;
int shipWidth = 250;
int shipHeight = 175;
boolean firstShot = false;
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage background;

Minim minim;
AudioPlayer pearl;
AudioPlayer shotSound;

void setup() {
  size(1000, 600);
  Ship ship1 = new Ship(new PVector (0, height - shipHeight), 200, 425, 10, 425, 30, 525, 120, 525, false);
  Ship ship2 = new Ship(new PVector (width-250, height - shipHeight), 800, 425, 990, 425, 970, 525, 880, 525, true);
  game = new GameController(ship1, ship2);
  cursor(CROSS);
  img = loadImage("skulls.png");
  img3 = loadImage("waves2.png");
  img4 = loadImage("waves2.png");
  background = loadImage("storm.jpg");
  minim = new Minim(this);
  pearl = minim.loadFile("pirates.mp3");
  pearl.loop();
}

void draw() {
  background.resize(width, height);
  background(28, 158, 255);
  image(background, 0, 0);
  game.drawBoard();
  img3.resize(width/2, 150);
  image(img3, 0, 450);

  img4.resize(width/2, 150);
  image(img3, width/2, 450);




  if (!firstShot) {
    textSize(30);
    textAlign(CENTER);
    text("Instructions:", width/2, (height/2)-80);
    textSize(20);
    text("Use Mouse to alter firing angle", width/2, (height/2)-60);
    textSize(20);
    text("Use UP and DOWN arrows to alter initial velocity", width/2, (height/2) - 40);
    text("Use LEFT and RIGHT arrows to alter downward acceleration", width/2, (height/2) - 20);
    text("Press SPACE to fire", width/2, (height/2));
    textSize(15);
    text("Press \"r\" to restart", width/2, (height/2)+20);
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
    
  pearl = minim.loadFile("cannon sound.mp3");
  pearl.play();
    firstShot = true;
  } else if (key == 'r') {
    game.restart();
  }
}