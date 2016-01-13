int health;
int speed;
int strength;
float attackspeed;
int range;
PImage img;
float xpos, ypos;
boolean moveLeft, moveRight, moveUp, moveDown;
  
void setup(){
  size(650, 650);
  smooth();
  noStroke();
  xpos = width/4;
  ypos = height/4;
  speed = 2;
  health = 100;
  strength = 8;
  attackspeed = 1;
  range = 2;
  img = loadImage("Monster.gif");
}

void draw(){
  background(0);
  if(moveLeft) xpos -= speed;
  if(moveRight) xpos += speed;
  if(moveUp) ypos -= speed;
  if(moveDown) ypos += speed;
  image(img, xpos, ypos, 30, 30);
}

void keyPressed() {
  if (key == CODED) {
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