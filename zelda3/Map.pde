abstract class map {
  map() {
  }
  abstract void blockade();
  abstract void rock();
  abstract void placeHero();
  abstract void goal();
  abstract void restart();

  void block() {
    if (collide(xpos, ypos, x, y, w, h)) {
      if (keyCode == LEFT) {
        xpos += speed;
        moveLeft = false;
      }
      if (keyCode == RIGHT) {
        xpos -= speed;
        moveRight = false;
      }
      if (keyCode == UP) {
        ypos += speed;
        moveUp = false;
      }
      if (keyCode == DOWN) {
        ypos -= speed;
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