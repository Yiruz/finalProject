class Hero
{
  //hero specs
  int health;
  int lives;
  boolean weapon, attack;
  float xpos,ypos,vx,vy;
  
  Hero(float xpos, float ypos, int health, int lives){
      this.xpos = xpos;
      this.ypos = ypos;
      this.health = health;
      this.lives = lives;
      vx = 0;
      vy = 0;
      direction = 0;
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
  ArrayList<Ammo> shoot(Weapon w){
    return w.newAmmo(xpos, ypos, direction);
  }
  
  void takeDamage(int dmg){
    health-=dmg;
  }
}