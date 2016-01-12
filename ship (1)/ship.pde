void setup(){
  size(1000,600);
}

void draw(){
  //front top
  line(30,500,50,450);
  line(30,500,80,480);
  
  //front bottom
  line(30,500,50,530);
  
  //bottom point
  line(50,530,90,510);
  
  //far side
  line(50,450,110,400);
  
  //near side
  line(80,480,145,430);
  
  //back
  line(110,400,145,430);
  
  //line bottom 
  line(90,510,160,460);
  
  //back wall
  line(145,430,153,445);
  
  //drop down near
  line(153,445,220,395);
  
  //drop down far
  line(127,415,190,365);
  
  //back up 
  line(190,365,180,354);
  
  //back of ship far
  line(180,354,230,310);
}