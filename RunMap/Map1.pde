class Map1 extends map {
  Map1() {
  }
  void setup(){
    placeHero();
  }
  void draw() {
  background(255, 222, 173);
    blockade();
    rock();
    goal();
    restart();
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
    xPos = width-30;
    yPos = height/2;
  }
  void goal() {
    fill(0);
    x=260;
    y=height-10;
    w=75;
    h=20;
    rect(x, y, w, h);
    if (collide(xPos, yPos, x, y, w, h)) {
      MapNum = 2;
      two.setup();
    }
  }
    void restart() {
    if (xPos<0 || xPos>width || yPos<0 || yPos>height) {
      setup();
    }
  }
}