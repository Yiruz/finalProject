class Mines extends Weapon{
  ArrayList<Ammo> A = new ArrayList<Ammo>();
  
  Mines(int damage) {
    super(damage);
    name = "Mines";
  }
  
  ArrayList<Ammo> newAmmo(float X, float Y, int dir) {
      A.removeAll(A);
        Ammo a = new Ammo(X+14, Y-15, 0, 0, damage, dir);
        A.add(a);
        return A;
  }
}