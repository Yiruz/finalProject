class Bows extends Weapon {
  ArrayList<Ammo> A = new ArrayList<Ammo>();
  
  
  Bows(int damage) {
    super(damage);
    name = "Bow";
  }

  ArrayList<Ammo> newAmmo(float X, float Y, int dir) {
      A.removeAll(A);
      if(dir == 1){
        Ammo a = new Ammo(X+3, Y, 0, -5, damage, dir);
        A.add(a);
        return A;
      }else if(dir == 2){
        Ammo a = new Ammo(X+28,Y,5,0,damage,dir);
        A.add(a);
        return A;
      }else if(dir == 3){
        Ammo a = new Ammo(X+10 ,Y+30,0,5,damage,dir);
        A.add(a);
        return A;
      }else if(dir == 4){
        Ammo a = new Ammo(X,Y,-5,0,damage,dir);
        A.add(a);
        return A;
      }else{
        Ammo a = new Ammo(X,Y,-5,0,damage,dir);
        A.add(a);
        return A;
      }
  }
}