class Bows extends Weapon {

  Bows(int damage, int speed) {
    super(20, speed);
    name = "Bow";
  }

  Ammo createAmmo(float X, float Y, int dir) {
    //if (dir == 0) {
      Ammo a = new Ammo(X, Y, 0.0, -10.0, dir);
      return a;
    //}
  }
}