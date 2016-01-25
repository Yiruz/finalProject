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
  Hero = loadImage("Monster.gif");
  b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10); 
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
    if(m.getToCreateBall()){
      b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10); 
      m.setToCreateBall(false);
    }
    m.setToChase(true);
    image(b.getImg(), b.getXpos(), b.getYpos(), 10, 10);
    if(b.getXpos() > xpos + 10){
      b.setXpos(b.getXpos() - 2);
    }
    if(b.getXpos() < xpos + 10){
      b.setXpos(b.getXpos() + 2);
    }
    if(b.getYpos() < ypos + 10){
      b.setYpos(b.getYpos() + 2);
    }
    if(b.getYpos() > ypos + 10){
      b.setYpos(b.getYpos() - 2);
    }   
  }
  if(m.getToChase()){
    if(m.getXpos() > xpos){
      m.setXpos(m.getXpos() - m.getSpeed());
    }
    if(m.getXpos() < xpos){
      m.setXpos(m.getXpos() + m.getSpeed());
    }
    if(m.getYpos() > ypos){
      m.setYpos(m.getYpos() - m.getSpeed());
    }
    if(m.getYpos() < ypos){
      m.setYpos(m.getYpos() + m.getSpeed());
    }
  }
  if(b.getXpos() < xpos + 20 && b.getXpos() > xpos && b.getYpos() < ypos + 20 && b.getYpos() > ypos){
    clear();
    image(m.getImg(), m.getXpos(), m.getYpos(), 30, 30);
    image(Hero, xpos, ypos, 30, 30);
    //Do damage to hero
    //b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10);
    b = new AttackBall(250, 250);
  }

  //if(m.isDead()){
    //clear();
    //image(Hero, xpos, ypos, 30, 30);
  //}
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