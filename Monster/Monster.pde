int xpos, ypos;

abstract class Monster{
  int health;
  int speed;
  int strength;
  int attackspeed;
  int range;
  
  Monster(int hp, int spd, int str, int atkspd, int rng){
    health = hp;
    speed = spd;
    strength = str;
    attackspeed = atkspd;
    range = rng;
  }
    
  abstract void attack();
}