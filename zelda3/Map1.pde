boolean getTriforce = false;
ArrayList<Monster> monster = new ArrayList<Monster>();

class Map1 extends map {
  Monster m;
  Monster m1;
  //Monster m2;
  //Monster m4;
  //Monster m5;
  AttackBall b;
  AttackBall b1;
  //AttackBall b2;
  //AttackBall b4;
  //AttackBall b5;
  

  Map1() {
  }
  void setup() {
    placeHero();
    m = new Monster();
    m.setXpos(width/1.33);
    m.setYpos(height/2);
    m1 = new Monster();
    m1.setXpos(width/1.85);
    m1.setYpos(height/2);
    monster.add(m);
    monster.add(m1);
    //m2 = new Monster();
    //m2.setXpos(width/3);
    //m2.setYpos(height/2);
    //m4 = new Monster();
    //m4.setXpos(width/2.41);
    //m4.setYpos(height/1.15);
    //m5 = new Monster();
    //m5.setXpos(width/1.85);
    //m5.setYpos(height/9);
    b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10); 
    b1 = new AttackBall(m1.getXpos() + 10, m1.getYpos() + 10); 
    //b2 = new AttackBall(m2.getXpos() + 10, m2.getYpos() + 10); 
    //b4 = new AttackBall(m4.getXpos() + 10, m4.getYpos() + 10); 
    //b5 = new AttackBall(m5.getXpos() + 10, m5.getYpos() + 10); 
    
  }
  void draw() {
    background(255, 222, 173);
    blockade();
    rock();
    goal();
    restart();
    takeTriforce();
    triforce();
    monsterSetup(m, b);
    monsterSetup(m1, b1);
    
    if(myHero.lives <= 0){
      clear();
      textSize(50);
      fill(255);
      text("LINK HAS NO MORE LIVES!", width/6, height/2);
    }

    //monsterSetup(m2, b2);
    //monsterSetup(m4, b4);
    //monsterSetup(m5, b5);
    if(Key == 1 && space && abs(xpos - m.getXpos()) <= 10 && abs(ypos - m.getYpos()) <= 10){
      m.takeDamage(10);
    }
    if(Key == 1 && space && abs(xpos - m1.getXpos()) <= 10 && abs(ypos - m1.getYpos()) <= 10){
      m1.takeDamage(10);
    }
    if(Key == 2 && space && abs(ax - m.getXpos()) <= 10 && abs(ay - m.getYpos()) <= 10){
      m.takeDamage(20);
    }
    if(Key == 2 && space && abs(ax - m1.getXpos()) <= 10 && abs(ay - m1.getYpos()) <= 10){
    if(Key == 2 && abs(ax - m.getXpos()) <= 10 && abs(ay - m.getYpos()) <= 10){
      m.takeDamage(20);
    }
    if(Key == 2 && abs(ax - m1.getXpos()) <= 10 && abs(ay - m1.getYpos()) <= 10){
      m1.takeDamage(20);
    } else {}
    }
    
    
 
    
    

  }
  
  void monsterSetup(Monster m, AttackBall b){
    monster.add(m);
    image(m.getImg(), m.getXpos(), m.getYpos(), 30, 30);
    if (m.toAttack(xpos, ypos)){
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
      myHero.takeDamage(5);
      b = null;
      b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10);
    }    
    if(m.isDead()){
      clear();
      background(255, 222, 173);
      blockade();
      rock();
      goal();
      restart();
      takeTriforce();
      triforce();
    }
  }
    
    
  void blockade() {
    //wall
    //top
    x=width/2;
    y=15;
    w=width;
    h=30;
    block();
    createWall();
    //left
    x=30;
    y=height/2;
    w=60;
    h=height;
    createWall();
    block();
    //left middle bar
    x=75;
    y=height/2;
    w=150;
    h=60;
    createWall();
    block();
    //bottom
    x=110;
    y=height-15;
    w=220;
    h=30;
    createWall();
    block();
    x=600;
    w=600;
    createWall();
    block();
    //right
    x=width-30;
    y=height/4-15;
    w=60;
    h=height/2-30;
    createWall();
    block();
    y=height*3/4+15;
    createWall();
    block();

    //rock
    //1
    x=205;
    y=height/4;
    w=30;
    h=height/2-60;
    rockGround();
    block();
    x=205;
    y=height*3/4;
    rockGround();
    block();
    //2
    x=375;
    y=height/2;
    h=330;
    rockGround();
    block();
    //3
    x=585;
    y=height/2+30;
    h=480;
    rockGround();
    block();
    //4
    x=width-135;
    y=height/2-30;
    h=480;
    rockGround();
    block();  

    rock();
  }
  void rock() {
    //1
    for (int rockPosY=45; rockPosY<height/2-30; rockPosY+=30) {
      image(rock, 205, rockPosY, 30, 30);
    }
    for (int rockPosY=height-45; rockPosY>height/2+30; rockPosY-=30) {
      image(rock, 205, rockPosY, 30, 30);
    }
    //2
    for (int rockPosY=height/2-150; rockPosY<=height/2+150; rockPosY+=30) {
      image(rock, 375, rockPosY, 30, 30);
    }
    //3
    for (int rockPosY=height-45; rockPosY>90; rockPosY-=30) {
      image(rock, 585, rockPosY, 30, 30);
    }
    //4
    for (int rockPosY=45; rockPosY<height-90; rockPosY+=30) {
      image(rock, width-135, rockPosY, 30, 30);
    }
  }
  void placeHero() {
    xpos = width-30;
    ypos = height/2;
  }
  void goal() {
    if (getTriforce == true) {
      if (xpos>=height-5) {
        MapNum = 2;
        two.setup();
        getTriforce = false;
      }
    } else if (getTriforce == false) {
      fill(0);
      x=260;
      y=height-10;
      w=75;
      h=20;
      rect(x, y, w, h);
      block();
      if (collide(xpos, ypos, x, y-5, w, h)) {
        textSize(20);
        text(exit, 250, 300);
      }
    }
  }
  void restart() {
    if (xpos<0 || xpos>width || ypos<0 || ypos>height) {
      setup();
    }
  }

  void takeTriforce() {
    if (collide(xpos, ypos, 90, 60, 30, 30)) {
      getTriforce = true;
    }
  }
  void triforce() {
    if (getTriforce == false) {
      image(triforce, 90, 60, 30, 30);
    } else if (getTriforce == true) {
      image(triforce, 90, 60, 0, 0);
    }
  }
}