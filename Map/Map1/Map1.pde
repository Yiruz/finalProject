PImage rock, hero;
float xPos, yPos;
float speed;
boolean moveLeft, moveRight, moveUp, moveDown;

void setup(){
  size(750, 500);
  smooth();
  noStroke();
  xPos = width-30;
  yPos = height/2;
  speed = 2;
  moveLeft = moveRight = moveUp = moveDown = false;
  rock = loadImage("rocks.png");
  hero = loadImage("zelda.gif");
}

void draw(){
  background(65,188,55);
  rect(200,50,width-250,height-100);
  rect(width-50,height/2-50,50,100);
  ellipse(200,height/2,380,height-100);
  rect(215,height-50,100,50);
  fill(255,222,173);
  imageMode(CENTER);
  image(hero,xPos,yPos,30,30);
  for(int rockPosY=65; rockPosY<height-150; rockPosY+=30){
    image(rock,550,rockPosY,30,30);
  }
  for(int rockPosY=height-65; rockPosY>150;rockPosY-=30){
      image(rock,400,rockPosY,30,30);
  }
  for(int rockPosY=65; rockPosY<height/2-30;rockPosY+=30){
      image(rock,200,rockPosY,30,30);
  }
  for(int rockPosY=height-65; rockPosY>height/2+40;rockPosY-=30){
    image(rock,200,rockPosY,30,30);
  }
  
    if(moveLeft) xPos -= speed;
    if(moveRight) xPos += speed;
    if(moveUp) yPos -= speed;
    if(moveDown) yPos += speed;
    
    if(boundary()){
      if(keyCode == LEFT){
        moveLeft = false;
        xPos += speed;
      }
      if(keyCode == RIGHT){
        moveRight = false;
        xPos -= speed;
      }
      if(keyCode == UP){
        moveUp = false;
        yPos += speed;
      }
      if(keyCode == DOWN){
        moveDown = false;
        yPos -= speed;
      }
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

boolean boundary(){
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
}