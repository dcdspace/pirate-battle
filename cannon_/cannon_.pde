void setup() {
  size(700, 700);
}


void draw() {
  //base of cannon
  rectMode(CENTER);
  fill(0);
  rect(350, 350, 300, 50);


  //left wheel of cannon 
  ellipseMode(CENTER);
  noStroke();
  fill(150);
  ellipse(250, 380, 40, 40);


  //right wheel of cannon 
  ellipseMode(CENTER);
  noStroke();
  fill(150);
  ellipse(430, 380, 40, 40);


  //bottom of cannon shaft
  
  rotate(-PI/10);
  arc(260, 290, 80, 80, PI/2, (3*PI)/2, OPEN);
  
  
  //cannon shaft 
  
  rectMode(CENTER);
  fill(150);
  rect(410, 290, 300, 80);
  
  
  //fire point of cannon
  ellipseMode(CENTER);
  noStroke();
  fill(150);
  stroke(0);
  ellipse(555, 290, 40, 80);
  
  
}