class Map1 extends map {
  Map1() {
  }
  void blockade() {
    //wall
    //top
    x=width/2;
    y=15;
    w=width;
    h=30;
    block();
    createWall(x, y, w, h);
    //left
    x=30;
    y=height/2;
    w=60;
    h=height;
    createWall(x, y, w, h);
    block();
    //left middle bar
    x=75;
    y=height/2;
    w=150;
    h=60;
    createWall(x, y, w, h);
    block();
    //bottom
    x=110;
    y=height-15;
    w=220;
    h=30;
    createWall(x, y, w, h);
    block();
    x=600;
    w=600;
    createWall(x, y, w, h);
    block();
    //right
    x=width-30;
    y=height/4-15;
    w=60;
    h=height/2-30;
    createWall(x, y, w, h);
    block();
    y=height*3/4+15;
    createWall(x, y, w, h);
    block();

    //rock
    //1
    x=205;
    y=height/4;
    w=30;
    h=height/2-60;
    rockGround(x, y, w, h);
    block();
    x=205;
    y=height*3/4;
    rockGround(x, y, w, h);
    block();
    //2
    x=375;
    y=height/2;
    h=330;
    rockGround(x, y, w, h);
    block();
    //3
    x=585;
    y=height/2+30;
    h=480;
    rockGround(x, y, w, h);
    block();
    //4
    x=width-135;
    y=height/2-30;
    h=480;
    rockGround(x, y, w, h);
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
}