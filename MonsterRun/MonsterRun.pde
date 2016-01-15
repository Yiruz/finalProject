Monster m;

void setup(){
  size(650, 650);
  smooth();
  noStroke();
  m = new Monster();
}

void draw(){
  background(0);
  if(m.getMoveLeft()) m.setXpos(m.getXpos() - m.getSpeed());
  if(m.getMoveRight()) xpos += speed;
  if(m.getMoveUp()) ypos -= speed;
  if(m.getMoveDown()) ypos += speed;
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