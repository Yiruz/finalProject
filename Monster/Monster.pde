int health;
int speed;
int strength;
float attackspeed;
int range;
PImage img;
float xpos, ypos;
boolean moveLeft, moveRight, moveUp, moveDown;
  
void setup(){
  size(600, 600);
  smooth();
  noStroke();
  xpos = width/4;
  ypos = height/4;
  speed = 2;
  health = 100;
  strength = 8;
  attackspeed = 1;
  range = 2;
  img = img;
}