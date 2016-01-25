class Ammo
{
  //PVector position = new PVector();
  //private Hero h;
  //private int age = 0;
  //PVector vel;
  boolean present;
  float x, y, vx, vy;
  float damage;
  int direction;
  PImage bomb, bow;
  
  Ammo(float x, float y, float vx, float vy, int direction, float damage){
    this.x = x;
    this.y = y;
    this.vx= vx;
    this.vy = vy;
    this.direction=direction;
    this.damage = damage;
  }

  void drawAmmo(){
    /*fill(0);
    ellipse(x, y, 3, 10);
    */
    if(direction == 1){
      bow = loadImage("arrowU.png");
      image(bow,x,y,30,30);
    }else if (direction == 2){
      bow = loadImage("arrowR.png");
      image(bow,x,y,30,30);
    }else if(direction == 3){
      bow = loadImage("arrowD.png");
      image(bow,x,y,30,30);
    }else if(direction == 4){
      bow = loadImage("arrowL.png");
      image(bow,x,y,30,30);
    }
  }
  
  void drawMines(){
    bomb = loadImage("bomb.png");
    image(bomb,x,y,10,10);
  }
  
  void update(){
    x += vx;
    y += vy;
  }

}