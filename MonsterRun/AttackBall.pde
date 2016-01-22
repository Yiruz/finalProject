class AttackBall{
  boolean moveLeft, moveRight, moveUp, moveDown;
  PImage img;
  float xpos;
  float ypos;
  
  AttackBall(){
    img = loadImage("ball.png");
    xpos = width / 2;
    ypos = height / 2;
  }
  
  PImage getImg(){
    return img;
  }
  
  float getXpos(){
    return xpos;
  }
  
  float getYpos(){
    return ypos;
  }
  
  void setXpos(float x){
    xpos = x;
  }
  
  void setYpos(float y){
    ypos = y; 
  }



}