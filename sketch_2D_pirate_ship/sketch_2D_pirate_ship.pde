PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  size(1000, 600);
  img = loadImage("skulls.png");
  img3 = loadImage("waves2.png");
  img4 = loadImage("waves2.png");
}


void draw() {
  fill(0);
  quad(200, 425, 10, 425, 30, 525, 120, 525);


  rectMode(CENTER);
  fill(155);
  rect(80, 356, 10, 140);


  fill(0);
  triangle(40, 375, 78, 280, 116, 375);


  img.resize(100, 50);
  image(img, 65, 250);
  
  //img2.resize(width/8, 150);
  //image(img2, 300, 250);
  
  img3.resize(width/2, 150);
  image(img3, 0, 450);
  
  img4.resize(width/2, 150);
  image(img3, width/2, 450);
}