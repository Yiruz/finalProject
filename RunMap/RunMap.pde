Map1 one;

void setup() {
  size(900, 600);
  smooth();
  noStroke();
  xPos = width-30;
  yPos = height/2;
  speed = 2;
  moveLeft = moveRight = moveUp = moveDown = false;
  rock = loadImage("rocks.png");
  hero = loadImage("zelda.gif");
  one = new Map1();
}

void draw() {
  background(255, 222, 173);
  one.blockade();
  one.rock();
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