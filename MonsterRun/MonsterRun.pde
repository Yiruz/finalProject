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
  if(m.getMoveRight()) m.setXpos(m.getXpos() + m.getSpeed());
  if(m.getMoveUp()) m.setYpos(m.getYpos() - m.getSpeed());
  if(m.getMoveDown()) m.setYpos(m.getYpos() + m.getSpeed());
  image(m.getImg(), m.getXpos(), m.getYpos(), 30, 30);
}

void keyPressed() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       m.setMoveLeft(true);
     } else if(keyCode == RIGHT) {
       m.setMoveRight(true);
     } else if(keyCode == UP) {
       m.setMoveUp(true);
     } else if(keyCode == DOWN) {
       m.setMoveDown(true);
     }
  }
}
 
void keyReleased() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       m.setMoveLeft(false);
     } else if(keyCode == RIGHT) {
       m.setMoveRight(false);
     } else if(keyCode == UP) {
       m.setMoveUp(false);
     } else if(keyCode == DOWN) {
       m.setMoveDown(false);
     }
  }
}