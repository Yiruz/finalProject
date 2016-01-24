class Ammo
{
  //PVector position = new PVector();
  //private Hero h;
  //private int age = 0;
  //PVector vel;
  boolean present;
  float x, y, X, Y;
  int dir;
  Hero myHero;
  Ammo(float x, float y){
    this.x = x;
    this.y = y;
    //this.dir = dir;
  }

    void update() {
  x += X;
  x += Y;  
  }
   void drawAmmo(){
    fill(0);
    ellipse(x, y, 10, 10);
  }
}