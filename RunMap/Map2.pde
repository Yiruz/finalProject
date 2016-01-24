class Map2 extends map {
  Map2() {
  }
  void setup(){
    placeHero();
  }
  void draw(){
    blockade();
    rock();
  }
  void blockade() {
    //wall
    //top
    x=110;
    y=45;
    w=220;
    h=90;
    createWall(x, y, w, h);
    block();
    x=600;
    w=600;
    createWall(x, y, w, h);
    block();
    //bottom
    x=width/2;
    y=height-45;
    w=width;
    createWall(x, y, w, h);
    block();
    //left
    x=15;
    y=height/2;
    w=30;
    h=height;
    createWall(x, y, w, h);
    block();
    //right
    x=width-15;
    y=height/4-30;
    w=30;
    h=height/2-60;
    createWall(x, y, w, h);
    block();
    y=height*3/4+30;
    createWall(x, y, w, h);
    block();
    //to goal
    x=width-30;
    y=height/2-45;
    w=60;
    h=30;
    createWall(x, y, w, h);
    block();
    y=height/2+45;
    createWall(x, y, w, h);
    block();

    //rock
    //1
    x=205;
    y=height/2;
    w=30;
    h=300;
    rockGround(x, y, w, h);
    block();
    //2
    x=360;
    y=height*3/4-60;
    h=240;
    rockGround(x, y, w, h);
    block();
    //3
    x=width/2+60;
    y=height/2-60;
    h=height/2;
    rockGround(x, y, w, h);
    block();
    //4
    x=width*3/4-15;
    y=height/2-30;
    h=height/2-60;
    rockGround(x, y, w, h);
    block();
    //3-4
    x=585;
    y=405;
    w=width/4-45;
    h=30;
    rockGround(x, y, w, h);
    block();
  }
  void rock() {
    //1
    for (int Ypos=165; Ypos<height-150; Ypos+=30) {
      image(rock, 205, Ypos, 30, 30);
    }
    //2
    for(int Ypos=285; Ypos<height-90;Ypos+=30){
      image(rock, 360, Ypos, 30, 30);
    }
    //3
    for(int Ypos=105;Ypos<height*3/4-30;Ypos+=30){
      image(rock, 510, Ypos, 30, 30);
    }
    //4
    for(int Ypos=165;Ypos<height*3/4-30;Ypos+=30){
      image(rock, width*3/4-15, Ypos, 30, 30);
    }
    //3-4
    for(int Xpos=540; Xpos<width*3/4;Xpos+=30){
      image(rock, Xpos, height*3/4-45, 30, 30);
    }
  }
  void placeHero() {
    xPos=250;
    yPos=30;
  }
}