class Hero
{
  //hero specs
  int health;
  int lives;
  boolean weapon, attack;
  float vx,vy;

  
  Hero(float x, float y, int health, int lives){
      x = xpos;
      y = ypos;
      this.health = health;
      this.lives = lives;
      vx = 0;
      vy = 0;
      direction = 0;
  }
  void placeHero(){/*
    if(w1 && !w2 && !w3){
      xpos = width - 30;
      ypos = height/2;
    }else if(w1 && w2 && !w3){
      xpos = 250;
      ypos = 30;
    }else if(w1 && w2 && w3){
      xpos = 30;
      ypos = height/2;
    }*/
      if(!space && direction == 3){
      img = loadImage("zelda.gif");
      image(img, xpos, ypos, 30, 30);
      }else if(space && millis() >= timer && Key == 1 && direction == 2){
      img = loadImage("AttackR.png");
      image(img, xpos, ypos, 40, 30);
      }else if(space && millis() >= timer && Key == 1 && direction == 4){
      img = loadImage("AttackL.png");
      image(img, xpos, ypos, 40, 30);
      }else if(!space && direction == 1){
      img = loadImage("LinkU.png");
      image(img, xpos, ypos, 30, 30);
      }else if(!space && direction == 2){
      img = loadImage("LinkR.png");
      image(img,xpos,ypos,30,30);
      }else if(!space && direction == 4){
      img = loadImage("LinkL.png");
      image(img, xpos, ypos, 30, 30);
      }else if(space && millis() >= timer && Key == 1 && direction == 1){
      img = loadImage("AttackU.png");
      image(img, xpos, ypos, 33, 45);
      }else if(space && millis() >= timer && Key == 1 && direction == 3){
      img = loadImage("AttackD.png");
      image(img, xpos, ypos, 33, 45);
      }else{
      img = loadImage("zelda.gif");
      image(img, xpos, ypos, 30, 30);
      }
  }
 

  void update() {
    if(moveLeft&&!moveRight&&!moveUp&&!moveDown) xpos -= speed;
    if(moveRight&&!moveLeft&&!moveUp&&!moveDown) xpos += speed;
    if(moveUp&&!moveDown&&!moveLeft&&!moveRight) ypos -= speed;
    if(moveDown&&!moveUp&&!moveRight&&!moveLeft) ypos += speed;
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