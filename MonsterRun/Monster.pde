class Monster{
 int health;
 int speed;
 int strength;
 float attackspeed;
 int range;
 PImage img;
 float xpos, ypos;
 boolean moveLeft, moveRight, moveUp, moveDown;
 
 Monster(){
   xpos = width/4;
   ypos = height/4;
   speed = 2;
   health = 100;
   strength = 8;
   attackspeed = 1;
   range = 2;
   img = loadImage("enemy1.png");
 }
 
 void setXpos(float num){
   xpos = num;
 }
 
 void setMoveLeft(boolean b){
   moveLeft = b;
 }
 
  void setMoveRight(boolean b){
   moveRight = b;
 }
 
 void setMoveUp(boolean b){
   moveUp = b;
 }
 
 void setMoveDown(boolean b){
   moveDown = b;
 }

 
 boolean getMoveLeft(){
   return moveLeft;
 }
 
  boolean getMoveRight(){
   return moveRight;
 }

 boolean getMoveUp(){
   return moveUp;
 }

 boolean getMoveDown(){
   return moveDown;
 }
}