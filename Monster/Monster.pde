int xpos, ypos;


abstract class Monster{
  int health;
  int speed;
  int strength;
  float attackspeed;
  int range;
  PImage img;
  
  Monster(int hp, int spd, int str, float atkspd, int rng, PImage i){
    health = hp;
    speed = spd;
    strength = str;
    attackspeed = atkspd;
    range = rng;
    img = i;
  }
    
  abstract void attack();
}

class MeleeMonster extends Monster{
  MeleeMonster(){
   super(10, 2, 3, .75, 1, loadImage("Melee.gif"));
  }
  
  void attack(){}
}