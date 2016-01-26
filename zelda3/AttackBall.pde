class AttackBall{
  boolean moveLeft, moveRight, moveUp, moveDown;
  PImage img;
  float xpos;
  float ypos;
  
  AttackBall(float x, float y){
    img = loadImage("Ball.png");
    xpos = x;
    ypos = y;
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