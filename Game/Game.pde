PImage rock, hero;
float xPos, yPos;
float speed;
boolean moveLeft, moveRight, moveUp, moveDown;
float x, y, w, h;
Monster m;
Monster m1;
Monster m2;
Monster m3;
Monster m4;
Monster m5;

void setup(){
  size(900, 600);
  smooth();
  noStroke();
  xPos = width-30;
  yPos = height/2;
  speed = 2;
  moveLeft = moveRight = moveUp = moveDown = false;
  rock = loadImage("rocks.png");
  hero = loadImage("zelda.gif");
  m = new Monster();
  m.setXpos(width/1.33);
  m.setYpos(height/2);
  m1 = new Monster();
  m1.setXpos(width/1.85);
  m1.setYpos(height/2);
  m2 = new Monster();
  m2.setXpos(width/3);
  m2.setYpos(height/2);
  m3 = new Monster();
  m3.setXpos(width/2.4);
  m3.setYpos(height/2);
  m4 = new Monster();
  m4.setXpos(width/2.41);
  m4.setYpos(height/1.15);
  m5 = new Monster();
  m5.setXpos(width/1.85);
  m5.setYpos(height/9);



}

void draw(){
  background(255,222,173);
  //wall
  //top
  x=width/2;
  y=15;
  w=width;
  h=30;
  block();
  createWall(x, y, w, h);
  //left
  x=30;
  y=height/2;
  w=60;
  h=height;
  createWall(x,y,w,h);
  block();
  //left middle bar
  x=75;
  y=height/2;
  w=150;
  h=60;
  createWall(x,y,w,h);
  block();
  //bottom
  x=110;
  y=height-15;
  w=220;
  h=30;
  createWall(x,y,w,h);
  block();
  x=600;
  w=600;
  createWall(x,y,w,h);
  block();
  //right
  x=width-30;
  y=height/4-15;
  w=60;
  h=height/2-30;
  createWall(x,y,w,h);
  block();
  y=height*3/4+15;
  createWall(x,y,w,h);
  block();
  
  //rock
  //1
  x=205;
  y=height/4;
  w=30;
  h=height/2-60;
  rockGround(x,y,w,h);
  block();
  x=205;
  y=height*3/4;
  rockGround(x,y,w,h);
  block();
  //2
  x=375;
  y=height/2;
  h=330;
  rockGround(x,y,w,h);
  block();
  //3
  x=585;
  y=height/2+30;
  h=480;
  rockGround(x,y,w,h);
  block();
  //4
  x=width-135;
  y=height/2-30;
  h=480;
  rockGround(x,y,w,h);
  block();
  image(m.getImg(), m.getXpos(), m.getYpos(), 30, 30);
  image(m1.getImg(), m1.getXpos(), m1.getYpos(), 30, 30);
  image(m2.getImg(), m2.getXpos(), m2.getYpos(), 30, 30);
  image(m3.getImg(), m3.getXpos(), m3.getYpos(), 30, 30);
  image(m4.getImg(), m4.getXpos(), m4.getYpos(), 30, 30);
  image(m5.getImg(), m5.getXpos(), m5.getYpos(), 30, 30);

  
  
  
  
  
    rock();

  imageMode(CENTER);
  image(hero,xPos,yPos,30,30);
  
    if(moveLeft) xPos -= speed;
    if(moveRight) xPos += speed;
    if(moveUp) yPos -= speed;
    if(moveDown) yPos += speed;
    
    /*if(boundary()){
      if(keyCode == LEFT){
       xPos += speed;
        moveLeft = false;
      }
      if(keyCode == RIGHT){
        xPos -= speed;
        moveRight = false;
      }
      if(keyCode == UP){
       yPos += speed;
        moveUp = false;
      }
      if(keyCode == DOWN){
        yPos -= speed;
        moveDown = false;
      }
    }*/
}
  void block(){
    if(collide(xPos, yPos, x, y, w, h)){
       if(keyCode == LEFT){
       xPos += speed;
        moveLeft = false;
      }
      if(keyCode == RIGHT){
        xPos -= speed;
        moveRight = false;
      }
      if(keyCode == UP){
       yPos += speed;
        moveUp = false;
      }
      if(keyCode == DOWN){
        yPos -= speed;
        moveDown = false;
      }
    }
  }

void createWall(float x, float y, float w, float h){
  rectMode(CENTER);
  fill(0,255,0);
  rect(x,y,w,h);
}
/*void walls(){
  createWall(0,0,50,height);
  createWall(0,0,width,50);
  createWall(0,height-50,225,50);
  createWall(275,height-50,width-275,50);
  //rect(
  //fill(0,255,0);
}*/
void rockGround(float x, float y, float w, float h){
  rectMode(CENTER);
  fill(198,161,36);
  rect(x,y,w,h);
}

void rock(){
  //1
  for(int rockPosY=45; rockPosY<height/2-30;rockPosY+=30){
      image(rock,205,rockPosY,30,30);
  }
  for(int rockPosY=height-45; rockPosY>height/2+30;rockPosY-=30){
    image(rock,205,rockPosY,30,30);
  }
  //2
  for(int rockPosY=height/2-150; rockPosY<=height/2+150;rockPosY+=30){
    image(rock,375,rockPosY,30,30);
  }
  //3
  for(int rockPosY=height-45; rockPosY>90;rockPosY-=30){
    image(rock,585,rockPosY,30,30);
  }
  //4
  for(int rockPosY=45; rockPosY<height-90; rockPosY+=30){
    image(rock,width-135,rockPosY,30,30);
  }
}
void keyPressed(){
    if(key == CODED){
      if (keyCode == LEFT) {
       moveLeft = true;
     } else if(keyCode == RIGHT) {
       moveRight = true;
     } else if(keyCode == UP) {
       moveUp = true;
     } else if(keyCode == DOWN) {
       moveDown = true;
     }
  }
}

void keyReleased() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = false;
     } else if(keyCode == RIGHT) {
       moveRight = false;
     } else if(keyCode == UP) {
       moveUp = false;
     } else if(keyCode == DOWN) {
       moveDown = false;
     }
  }
}
boolean collide(float xPos, float yPos, float x, float y, float w, float h){
  if(xPos+15 >= x-w/2 && xPos-15 <= x+w/2 && yPos+15 >= y-h/2 && yPos-15 <= y+h/2){
    return true;
  }
  return false;
}
/*boolean boundary(){
  //right margin
  if(xPos >= width-50 && (yPos <= height/2-50 || yPos >= height/2+50)){
    return true;
  }
  if(xPos == width){
    return true;
  }
  //bottom
  if(xPos >= 310 && yPos >= height-50){
    return true;
  }
  //top
  if(xPos >= 200 && yPos < 50){
    return true;
  }
  return false;
}*/