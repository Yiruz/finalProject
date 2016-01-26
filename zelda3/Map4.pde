boolean getKey = false;

class Map4 extends map {
  Map4() {
  }
  void setup() {
    placeHero();
  }
  void draw() {
    blockade();
    rock();
    restart();
    goal();
    pickKey();
    door();
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
    x=width-15;
    y=height/2;
    w=30;
    h=height;
    createWall();
    block();
    //cage
    x=width-60;
    y=height/2-60;
    w=120;
    h=30;
    createWall();
    block();
    y=height/2+60;
    createWall();
    block();

    //rock
    //1
    x=225;
    y=height/2;
    w=30;
    h=270;
    rockGround();
    block();
    //4
    x=525;
    rockGround();
    block();

    //2
    x=375;
    y=height/4;
    h=240;
    rockGround();
    block();
    y=height*3/4;
    rockGround();
    block();
  }
  void rock() {
    //1
    for (int Ypos=180; Ypos<=height-180; Ypos+=30) {
      image(rock, 225, Ypos, 30, 30);
    }
    //2
    for (int Ypos=45; Ypos<270; Ypos+=30) {
      image(rock, 375, Ypos, 30, 30);
    }
    for (int Ypos=height-45; Ypos>330; Ypos-=30) {
      image(rock, 375, Ypos, 30, 30);
    }
    //4
    for (int Ypos=180; Ypos<=height-180; Ypos+=30) {
      image(rock, 525, Ypos, 30, 30);
    }
  }
  void placeHero() {
    xpos=30;
    ypos=height/2;
  }
  void goal() {
    x=width-60;
    y=height/2;
    w=30;
    h=30;
    image(princess, x, y, w, h);
    if (collide(xpos, ypos, x, y, w, h)) {
      textAlign(CENTER);
      textSize(50);
      fill(0);
      text(s, width/2, height/2, 20);
      noLoop();
    }
  }
  void restart() {
    if (xpos<0 || xpos>width || ypos<0 || ypos>height) {
      setup();
    }
  }
  void pickKey() {
    if (collide(xpos, ypos, width-60, 120, 15, 30)) {
      getKey=true;
    }
  }

  void door() {
    if (getKey == false) {
      image(keys, width-60, 120, 15, 30);
      fill(211, 111, 17);
      x=width-115;
      y=height/2;
      w=10;
      h=90;
      rect(x, y, w, h);
      if (collide(xpos, ypos, x-3, y, w, h)) {
        block();
        fill(0);
        textSize(20);
        text("You need to get the key to open the door", 300, 300);
      }
    } else if (getKey == true) {
      image(keys, width-60, 120, 0, 0);
      rect(width-115, height/2, 0, 0);
    }
  }
}