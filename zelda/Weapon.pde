abstract class Weapon{
  int damage;
  int speed;
  int ammo;
  int dir;
  String name;
  
  Weapon(int damage){
      this.damage = damage;
  }
  abstract ArrayList<Ammo> newAmmo(float x, float y, int dir);
}