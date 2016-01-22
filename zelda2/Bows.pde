class Bows extends Weapon {

  Bows(int damage, int speed) {
    super(20, speed);
    name = "Bow";
  }

  Ammo createAmmo(float X, float Y, int dir) {
      Ammo a = new Ammo(X, Y, dir);
      return a;
  }
}