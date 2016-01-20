class Ammo
{
  PVector position = new PVector();
  //private Hero h;
  //private int age = 0;
  PVector vel;
  boolean present;
  int direction;
  Hero myHero;
  Ammo(float x, float y, float velX, float velY, int dir){
    x = position.x;
    y = position.y;
    velX = vel.x;
    velY = vel.y;
    dir = direction;
  }

    void update() {
  position.x += vel.x;
  position.y += vel.y;  
  }
   void drawAmmo() {
    fill(0);
    ellipse(myHero.getX(), myHero.getY(), 10, 10);
  }
}