class Map2 extends map {
  Map2() {
  }
  void setup() {
    placeHero();
  }
  void draw() {
    blockade();
    rock();
    restart();
    goal();
    takeTriforce();
    triforce();
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
    xPos=250;
    yPos=30;
  }
  void goal() {
    if (getTriforce == true) {
      if (collide(xPos, yPos, x, y, w, h)) {
        MapNum = 3;
        three.setup();
      }
    } else if (getTriforce == false) {
      fill(0);
      x=width-10;
      y=height/2;
      w=20;
      h=60;
      rect(x, y, w, h);
      block();
      if (collide(xPos, yPos, x-5, y, w, h)) {
        textSize(20);
        text(exit, 250, 300);
      }
    }
  }
  void restart() {
    if (xPos<0 || xPos>width || yPos<0 || yPos>height) {
      setup();
    }
  }

  void takeTriforce() {
    if (collide(xPos, yPos, 550, 360, 30, 30)) {
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