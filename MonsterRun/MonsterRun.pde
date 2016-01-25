Monster m;
Monster m1;
AttackBall b;
PImage Hero;
float xpos, ypos;

boolean toAttack(){
  if((sqrt((pow(m.getYpos() - ypos, 2)) + (pow(m.getXpos() - xpos, 2)))) <= 80){
    return true;
  } else {
    return false;
  }
}


void setup(){
  size(650, 650);
  smooth();
  noStroke();
  m = new Monster();
  b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10);
  Hero = loadImage("Monster.gif");
  xpos = width/2;
  ypos = height/2;
  m1 = new Monster();
}

void draw(){
  background(0);
  if(m.getMoveLeft()) m.setXpos(m.getXpos() - m.getSpeed());
  if(m.getMoveRight()) m.setXpos(m.getXpos() + m.getSpeed());
  if(m.getMoveUp()) m.setYpos(m.getYpos() - m.getSpeed());
  if(m.getMoveDown()) m.setYpos(m.getYpos() + m.getSpeed());
  image(m.getImg(), m.getXpos(), m.getYpos(), 30, 30);
  image(Hero, xpos, ypos, 30, 30);
  if(m.getXpos() == 300){
    m.takeDamage(100);
  }
  if (toAttack()){
    m.setToChase(true);
    image(b.getImg(), b.getXpos(), b.getYpos(), 10, 10);
    b.setXpos(b.getXpos() + 2);
    b.setYpos(b.getYpos() + 2);
  }
  if(m.getToChase()){
    m.setXpos(m.getXpos() + m.getSpeed());
    m.setYpos(m.getYpos() + m.getSpeed());
  }
  if(m.isDead()){
    clear();
    image(Hero, xpos, ypos, 30, 30);
  }
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