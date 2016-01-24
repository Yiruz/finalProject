class Hero
{
  //hero specs
  int health;
  int lives;
  boolean weapon, attack;
  float xpos;
  float ypos;
  int direction;
  
  Hero(float x, float y, int health, int lives){
      x = xpos;
      y = ypos;
      this.health = health;
      this.lives = lives;
  }
  void drawHero(){
    img = loadImage("zelda.gif");
    image(img, xpos, ypos, 30, 30);
  }

  void update() {
    if(moveLeft) xpos -= speed;
    if(moveRight) xpos += speed;
    if(moveUp) ypos -= speed;
    if(moveDown) ypos += speed;
  }
  public float getX(){
    return xpos;
  }
  public float getY(){
    return ypos;
  }
  Ammo shoot(Weapon x){
    return x.createAmmo(xpos, ypos);
  }
}