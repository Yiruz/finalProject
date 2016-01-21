class Ammo
{
  PVector position = new PVector();
  //private Hero h;
  //private int age = 0;
  PVector vel;
  boolean present;
  int direction;
  Hero myHero;
  Ammo(float x, float y, int dir){
    x = position.x;
    y = position.y;
    dir = direction;
  }

    void update() {
  position.x += vel.x;
  position.y += vel.y;  
  }
   void drawAmmo() {
     myHero = new Hero(myHero.getX(),myHero.getY(),100,3);
    fill(0);
    ellipse(myHero.getX(), myHero.getY(), 10, 10);
  }
}