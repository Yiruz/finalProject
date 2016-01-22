abstract class Weapon{
  int damage;
  int speed;
  int ammo;
  String name;
  
  Weapon(int damage, int speed){
      this.damage = damage;
      this.speed = speed;
  }
  abstract Ammo createAmmo(float x, float y, int dir);
}