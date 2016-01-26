class Map2 extends map {
  Monster m;
  Monster m1;
  //Monster m2;
  AttackBall b;
  AttackBall b1; 
  //AttackBall b2;

  
  Map2() {
  }
  void setup() {
    placeHero();
    m = new Monster();
    m.setXpos(width/1.2);
    m.setYpos(height/2);
    m1 = new Monster();
    m1.setXpos(width/2.08);
    m1.setYpos(height/2);
    //m2 = new Monster();
    //m2.setXpos(width/3);
    //m2.setYpos(height/2);
    b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10); 
    b1 = new AttackBall(m1.getXpos() + 10, m1.getYpos() + 10); 
    //b2 = new AttackBall(m2.getXpos() + 10, m2.getYpos() + 10); 


  }
  void draw() {
    blockade();
    rock();
    restart();
    goal();
    takeTriforce();
    triforce();
    monsterSetup(m, b);
    monsterSetup(m1, b1);
    //monsterSetup(m2, b2);
    
  }
  
  void monsterSetup(Monster m, AttackBall b){
    image(m.getImg(), m.getXpos(), m.getYpos(), 30, 30);
    if (m.toAttack(xpos, ypos)){
      if(m.getToCreateBall()){
        b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10); 
        m.setToCreateBall(false);
      }
      m.setToChase(true);
      image(b.getImg(), b.getXpos(), b.getYpos(), 10, 10);
      if(b.getXpos() > xpos + 10){
        b.setXpos(b.getXpos() - 1.5);
      }
      if(b.getXpos() < xpos + 10){
        b.setXpos(b.getXpos() + 1.5);
      }
      if(b.getYpos() < ypos + 10){
        b.setYpos(b.getYpos() + 1.5);
      }
      if(b.getYpos() > ypos + 10){
        b.setYpos(b.getYpos() - 1.5);
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
      b = null;
      //Do damage to hero
      b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10);
    }    
  } 
  
  
  void blockade() {
    //wall
    //top
    x=110;
    y=45;
    w=220;
    h=90;
    createWall();
    block();
    x=600;
    w=600;
    createWall();
    block();
    //bottom
    x=width/2;
    y=height-45;
    w=width;
    createWall();
    block();
    //left
    x=15;
    y=height/2;
    w=30;
    h=height;
    createWall();
    block();
    //right
    x=width-15;
    y=height/4-30;
    w=30;
    h=height/2-60;
    createWall();
    block();
    y=height*3/4+30;
    createWall();
    block();
    //to goal
    x=width-30;
    y=height/2-45;
    w=60;
    h=30;
    createWall();
    block();
    y=height/2+45;
    createWall();
    block();

    //rock
    //1
    x=205;
    y=height/2;
    w=30;
    h=300;
    rockGround();
    block();
    //2
    x=360;
    y=height*3/4-60;
    h=240;
    rockGround();
    block();
    //3
    x=width/2+60;
    y=height/2-60;
    h=height/2;
    rockGround();
    block();
    //4
    x=width*3/4-15;
    y=height/2-30;
    h=height/2-60;
    rockGround();
    block();
    //3-4
    x=585;
    y=405;
    w=width/4-45;
    h=30;
    rockGround();
    block();
  }
  void rock() {
    //1
    for (int Ypos=165; Ypos<height-150; Ypos+=30) {
      image(rock, 205, Ypos, 30, 30);
    }
    //2
    for (int Ypos=285; Ypos<height-90; Ypos+=30) {
      image(rock, 360, Ypos, 30, 30);
    }
    //3
    for (int Ypos=105; Ypos<height*3/4-30; Ypos+=30) {
      image(rock, 510, Ypos, 30, 30);
    }
    //4
    for (int Ypos=165; Ypos<height*3/4-30; Ypos+=30) {
      image(rock, width*3/4-15, Ypos, 30, 30);
    }
    //3-4
    for (int Xpos=540; Xpos<width*3/4; Xpos+=30) {
      image(rock, Xpos, height*3/4-45, 30, 30);
    }
  }
  void placeHero() {
    xpos=250;
    ypos=30;
  }
  void goal() {
    if (getTriforce == true) {
      if (xpos>=width-5) {
        MapNum = 3;
        three.setup();
        getTriforce = false;
      }
    } else if (getTriforce == false) {
      fill(0);
      x=width-10;
      y=height/2;
      w=20;
      h=60;
      rect(x, y, w, h);
      block();
      if (collide(xpos, ypos, x-5, y, w, h)) {
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
    if (collide(xpos, ypos, 550, 360, 30, 30)) {
      getTriforce = true;
    }
  }
  void triforce() {
    if (getTriforce == false) {
      image(triforce, 550, 360, 30, 30);
    } else if (getTriforce == true) {
      image(triforce, 550, 360, 0, 0);
    }
  }
}