class Map3 extends map {
  Map3() {
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
    x=width/2;
    y=15;
    w=width;
    h=30;
    createWall();
    block();
    //bottom
    y=height-15;
    createWall();
    block();
    //left
    x=30;
    y=height/4;
    w=60;
    h=240;
    createWall();
    block();
    y=height*3/4;
    createWall();
    block();
    //right
    x=width-30;
    createWall();
    block();
    y=height/4;
    createWall();
    block();

    //rock
    //1
    x=165;
    y=height/2;
    w=30;
    h=390;
    rockGround();
    block();
    //3
    x=405;
    h=270;
    rockGround();
    block();
    //4
    x=525;
    rockGround();
    block();
    //5
    x=705;
    h=390;
    rockGround();
    block();
    //2
    x=285;
    y=height/4+30;
    h=150;
    rockGround();
    block();
    y=height*3/4-30;
    rockGround();
    block();
    //2-5
    x=495;
    y=90;
    w=390;
    h=30;
    rockGround();
    block();
    y=height-90;
    rockGround();
    block();
  }
  void rock() {
    //1
    for (int Ypos=120; Ypos<=height-120; Ypos+=30) {
      image(rock, 165, Ypos, 30, 30);
    }
    //2
    for (int Ypos=120; Ypos<270; Ypos+=30) {
      image(rock, 285, Ypos, 30, 30);
    }
    for (int Ypos=height-120; Ypos>330; Ypos-=30) {
      image(rock, 285, Ypos, 30, 30);
    }
    //3
    for (int Ypos=180; Ypos<=height-180; Ypos+=30) {
      image(rock, 405, Ypos, 30, 30);
    }
    //4
    for (int Ypos=180; Ypos<=height-180; Ypos+=30) {
      image(rock, 525, Ypos, 30, 30);
    }
    //5
    for (int Ypos=120; Ypos<=height-120; Ypos+=30) {
      image(rock, 705, Ypos, 30, 30);
    }
    //2-5
    for (int Xpos=315; Xpos<705; Xpos+=30) {
      image(rock, Xpos, 90, 30, 30);
    }
    for (int Xpos=315; Xpos<705; Xpos+=30) {
      image(rock, Xpos, height-90, 30, 30);
    }
  }
  void placeHero() {
    xPos=30;
    yPos=height/2;
  }
  void goal() {
    if (getTriforce == true) {
      if (collide(xPos, yPos, x, y, w, h)) {
        MapNum = 4;
        four.setup();
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
    if (collide(xPos, yPos, 650, 300, 30, 30)) {
      getTriforce = true;
    }
  }
  void triforce() {
    if (getTriforce == false) {
      image(triforce, 650, 300, 30, 30);
    } else if (getTriforce == true) {
      image(triforce, 650, 00, 0, 0);
    }
  }
}