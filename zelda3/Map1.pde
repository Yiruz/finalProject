class Map1 extends map {
  Monster m;
  Monster m1;
  Monster m2;
  Monster m3;
  Monster m4;
  Monster m5;
  AttackBall b;
  

  Map1() {
  }
  void setup(){
    placeHero();
    m = new Monster();
    m.setXpos(width/1.33);
    m.setYpos(height/2);
    m1 = new Monster();
    m1.setXpos(width/1.85);
    m1.setYpos(height/2);
    m2 = new Monster();
    m2.setXpos(width/3);
    m2.setYpos(height/2);
    m4 = new Monster();
    m4.setXpos(width/2.41);
    m4.setYpos(height/1.15);
    m5 = new Monster();
    m5.setXpos(width/1.85);
    m5.setYpos(height/9);
    b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10); 
  }
  void draw() {
  background(255, 222, 173);
    blockade();
    rock();
    goal();
    restart();
    image(m.getImg(), m.getXpos(), m.getYpos(), 30, 30);
    image(m1.getImg(), m1.getXpos(), m1.getYpos(), 30, 30);
    image(m2.getImg(), m2.getXpos(), m2.getYpos(), 30, 30);
    image(m4.getImg(), m4.getXpos(), m4.getYpos(), 30, 30);
    image(m5.getImg(), m5.getXpos(), m5.getYpos(), 30, 30);
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
      clear();
      background(255, 222, 173);
      blockade();
      rock();
      goal();
      restart();
      image(m.getImg(), m.getXpos(), m.getYpos(), 30, 30);
      image(m1.getImg(), m1.getXpos(), m1.getYpos(), 30, 30);
      image(m2.getImg(), m2.getXpos(), m2.getYpos(), 30, 30);
      image(m4.getImg(), m4.getXpos(), m4.getYpos(), 30, 30);
      image(m5.getImg(), m5.getXpos(), m5.getYpos(), 30, 30);
      //Do damage to hero
      b = new AttackBall(m.getXpos() + 10, m.getYpos() + 10);
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
    fill(0);
    x=260;
    y=height-10;
    w=75;
    h=20;
    rect(x, y, w, h);
    if (collide(xpos, ypos, x, y, w, h)) {
      MapNum = 2;
      mapChange = true;
      two.setup();
    }
  }
    void restart() {
    if (xpos<0 || xpos>width || ypos<0 || ypos>height) {
      setup();
    }
  }
}