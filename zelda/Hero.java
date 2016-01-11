public class Hero{
    private String name;
    private int lives, health;
    public boolean weapon;

    public Hero(){
    }

    public Hero(String name, int health, int lives, boolean weapon){
	this.name = name;
	this.health = health;
	this.lives = lives;
	weapon = false;
    }

    public Hero(String name){
	this(name, 100, 5, false);
    }
   
    public String getName(){
	return name;
    }

    public int getHealth(){
	return health;
    }
    
    public int getLives(){
	return lives;
    }

    public boolean getWeapon(){
	return weapon;
    }

    public int takeDamage(int damage){
	health -= damage;
	return health;
    }

    public String attack(){
	return name + "attacked!";
    }

}