class Ammo
{
  //PVector position = new PVector();
  //private Hero h;
  //private int age = 0;
  //PVector vel;
  boolean present;
  float x, y, vx, vy;
  float damage;
  int dir;
  PImage bomb, bow;
  
  Ammo(float x, float y, float vx, float vy, int dir, float damage){
    this.x = x;
    this.y = y;
    this.vx= vx;
    this.vy = vy;
    this.dir=dir;
    this.damage = damage;
  }

  void drawAmmoU(){
    //fill(0);
    //ellipse(x, y, 3, 10);
      bow = loadImage("arrowU.png");
      image(bow,x,y,25,30);
  }
  
  void drawAmmoD(){
      bow = loadImage("arrowD.png");
      image(bow,x,y,25,30);
  }
  void drawAmmoL(){   
    bow = loadImage("arrowL.png");
    image(bow,x,y,25,30);
  }
  void drawAmmoR(){
      bow = loadImage("arrowR.png");
      image(bow,x,y,25,30);
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