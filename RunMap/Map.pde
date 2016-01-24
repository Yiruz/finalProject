PImage rock, hero;
float xPos, yPos;
float speed;
boolean moveLeft, moveRight, moveUp, moveDown;
float x, y, w, h;

abstract class map {
  map() {
  }
  abstract void blockade();
  abstract void rock();
  abstract void placeHero();
  abstract void goal();
  abstract void restart();

  void block() {
    if (collide(xPos, yPos, x, y, w, h)) {
      if (keyCode == LEFT) {
        xPos += speed;
        moveLeft = false;
      }
      if (keyCode == RIGHT) {
        xPos -= speed;
        moveRight = false;
      }
      if (keyCode == UP) {
        yPos += speed;
        moveUp = false;
      }
      if (keyCode == DOWN) {
        yPos -= speed;
        moveDown = false;
      }
    }
  }

  void createWall() {
    rectMode(CENTER);
    fill(46, 178, 48);
    rect(x, y, w, h);
  }
  void rockGround() {
    rectMode(CENTER);
    fill(250, 200, 150);
    rect(x, y, w, h);
  }

  boolean collide(float xPos, float yPos, float x, float y, float w, float h) {
    if (xPos+15 >= x-w/2 && xPos-15 <= x+w/2 && yPos+15 >= y-h/2 && yPos-15 <= y+h/2) {
      return true;
    }
    return false;
  }
  
}