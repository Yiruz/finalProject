PImage rock, hero, princess, keys;
float xPos, yPos;
float speed;
boolean moveLeft, moveRight, moveUp, moveDown;
float x, y, w, h;
Map1 one;
Map2 two;
Map3 three;
Map4 four;
int MapNum = 1;
String s = "END";

void setup() {
  size(900, 600);
  smooth();
  noStroke();
  speed = 2;
  moveLeft = moveRight = moveUp = moveDown = false;
  rock = loadImage("rocks.png");
  hero = loadImage("zelda.gif");
  princess = loadImage("princess.png");
  keys = loadImage("KeyMagical3.png");
  one = new Map1();
  two = new Map2();
  three = new Map3();
  four = new Map4();
  //one.setup();
  four.setup();
}

void draw() {
  background(255, 222, 173);
  /*switch(MapNum) {
   case 1:
   one.draw();
   break;
   case 2:
   two.draw();
   break;
   case 3:
   three.draw();
   break;
   }*/
  four.draw();

  imageMode(CENTER);
  image(hero, xPos, yPos, 30, 30);


  if (moveLeft) xPos -= speed;
  if (moveRight) xPos += speed;
  if (moveUp) yPos -= speed;
  if (moveDown) yPos += speed;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      moveLeft = true;
    } else if (keyCode == RIGHT) {
      moveRight = true;
    } else if (keyCode == UP) {
      moveUp = true;
    } else if (keyCode == DOWN) {
      moveDown = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      moveLeft = false;
    } else if (keyCode == RIGHT) {
      moveRight = false;
    } else if (keyCode == UP) {
      moveUp = false;
    } else if (keyCode == DOWN) {
      moveDown = false;
    }
  }
}