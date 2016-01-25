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
  PImage bomb;
  
  Ammo(float x, float y, float vx, float vy, int direction, float damage){
    this.x = x;
    this.y = y;
    this.vx= vx;
    this.vy = vy;
    this.direction=direction;
    this.damage = damage;
  }

  void drawAmmo(){
    fill(0);
    ellipse(x, y, 3, 10);
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