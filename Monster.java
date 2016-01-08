public abstract class Monster{
    private int health;
    private int range;
    private int speed;
    private int attackspeed;

    //Constructors
    public Monster(int hp, int rng, int spd, int atkspd){
	health = hp;
        range = rng;
	speed = spd;
	attackspeed = atkspd;
    }

}