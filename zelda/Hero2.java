Hero myHero;
Ammo myAmmo;
Bows myBow;
//loading  character
PImage img; 
float xPos;
float yPos;
float speed;  
boolean moveLeft, moveRight, moveUp, moveDown, space;
//ArrayList bows = new ArrayList();
int k = 1;
boolean weapon, attack;
int health;
PVector bowsVelocity = new PVector(2*speed, 0);
ArrayList<Ammo> ammo = new ArrayList<Ammo>();
Weapon holstered = new Bows(2,2);
void setup(){
    size(640, 640);
    smooth();
    //to move
    speed = 5;
    moveLeft = moveRight = moveUp = moveDown = space = false;
    //zelda specs
    weapon = false;
    attack = false;
    health = 100;
    // The image file must be in the data folder of the current sketch to load
    // Load the image into the program  
    myHero = new Hero(new PVector(width/2, height/2), 100, 3);
    myBow = new Bows(20,0);
}

void draw(){
    // Displays the image at point (0, height/12) at half of its size
    background(255);
    //image(img, 0, height/12, img.width/12, img.height/12);
    /* 
    if(moveLeft) xPos -= speed;
    if(moveRight) xPos += speed;
    if(moveUp) yPos -= speed;
    if(moveDown) yPos += speed;
    */
    myHero.drawHero();
    myHero.drawGun();
    myHero.update();
    myHero.alterDirection();
    //myBows.drawBows();
    /*if(space){
        bows.add(new Bows(myHero.v1.get(), bowsVelocity));
        space = false;
    }
    //myBows.update();*/
    if(space){
	ammo.add(myHero.shoot(holstered));
    }
    for (int i = 0; i < ammo.size(); i ++) {
	ammo.get(i).drawAmmo();
	ammo.get(i).update();
    }
}

void keyPressed() {
    if (key == CODED) {
	if (keyCode == LEFT) {
	    moveLeft = true;
	    myHero.v2.x -= speed;
	} else if(keyCode == RIGHT) {
	    moveRight = true;
	    myHero.v2.x += speed;
	} else if(keyCode == UP) {
	    moveUp = true;
	    myHero.v2.y -= speed;
	} else if(keyCode == DOWN) {
	    moveDown = true;
	    myHero.v2.y += speed;
	} 
    }
    if(keyCode == 'a'){
	space = true;
    }
}
 
void keyReleased() {
    if (key == CODED) {
	if (keyCode == LEFT) {
	    moveLeft = false;
	    myHero.v2.x += 0;
	} else if(keyCode == RIGHT) {
	    moveRight = false;
	    myHero.v2.x += 0;
	} else if(keyCode == UP) {
	    moveUp = false;
	    myHero.v2.y += 0;
	} else if(keyCode == DOWN) {
	    moveDown = false;
	    myHero.v2.y += 0;
	} 
    }
    if(keyCode == 'a'){
	space = false;
    }
}

class Hero
{
    //hero specs
    int health;
    int lives;
    boolean weapon, attack;
    PVector v1 = new PVector();
    PVector v2 = new PVector();
    int direction;
  
    Hero(PVector v1, int health, int lives){
	this.v1 = v1;
	this.health = health;
	this.lives = lives;
	v2.x = 0;
	v2.y = 0;
    }
    void drawHero(){
	img = loadImage("zelda.gif");
	image(img, v2.x, v2.y, 30, 30);
    }
    void update() {
	v1.x += v2.x;
	v1.y += v2.y;
	if(v1.x <= 0){
	    v1.x = 0;
	}
	if(v1.x >= width){
	    v1.x = width;
	}
	if(v1.y <= 0){
	    v1.y = 0;
	}
	if(v1.y >= height){
	    v1.y = height;
	}
    }
    void alterDirection(){
	if(v2.y < 0){
	    direction = 0;
	}else if(v2.x > 0 && v2.y < 0){
	    direction = 1;
	}else if(v2.x > 0){
	    direction = 2;
	}else if(v2.x > 0 && v2.y > 0){
	    direction = 3;
	}else if(v2.y > 0){
	    direction = 4;
	}else if(v2.x < 0 && v2.y > 0){
	    direction = 5;
	}else if(v2.x < 0){
	    direction = 6;
	}else if(v2.x < 0 && v2.y < 0){
	    direction = 7;
	}
    }
      
    Ammo shoot(Weapon x){
	return x.createAmmo(v1, direction);
    }
  
    void drawGun(){
	if(direction == 0){
	    line(v1.x, v1.y, v1.x, v1.y - 25);
	}else if(direction == 2){
	    line(v1.x,v1.y, v1.x + 25, v1.y);
	}else if(direction == 4){
	    line(v1.x,v1.y, v1.x, v1.y + 25);
	}else if(direction == 6){
	    line(v1.x,v1.y, v1.x - 25, v1.y);
	}else if(direction == 1){
	    line(v1.x,v1.y, v1.x + 18, v1.y - 18);
	}else if(direction == 3){
	    line(v1.x, v1.y, v1.x + 18, v1.y + 18);
	}else if(direction == 5){
	    line(v1.x, v1.y, v1.x - 18, v1.y + 18);
	}else if(direction == 7){
	    line(v1.x, v1.y, v1.x - 18, v1.y - 18);
	}
    }
}

abstract class Weapon{
    int damage;
    int speed;
    int ammo;
    String name;
  
    Weapon(int damage, int speed){
	this.damage = damage;
	this.speed = speed;
    }
    abstract Ammo createAmmo(PVector G, int dir);
}
class Ammo
{
    PVector position = new PVector();
    //private Hero h;
    //private int age = 0;
    PVector vel;
    boolean present;
    int direction;
    Ammo(PVector position, float velX, float velY, int dir){
	this.position = position;
	velX = vel.x;
	velY = vel.y;
	dir = direction;
    }

    void update() {
	position.x += vel.x;
	position.y += vel.y;  
    }
    void drawAmmo() {
	fill(0);
	ellipse(position.x, position.y, 10, 10);
    }
}
class Bows extends Weapon{
  
    Bows(int damage, int speed){
	super(20, speed);
	name = "Bow";
    }
  
    Ammo createAmmo(PVector G, int dir){
	if (dir == 0){
	    Ammo a = new Ammo(G, 0.0, -10.0, dir);
	    return a;
	}else if(dir == 1){
	    Ammo a = new Ammo(G, 10.0, -10.0, dir);
	    return a;
	}else if(dir ==2){
	    Ammo a = new Ammo(G, 10.0, 0.0, dir);
	    return a;
	}else if(dir == 3){
	    Ammo a = new Ammo(G, 10.0, 10.0, dir);
	    return a;
	}else if(dir == 4){
	    Ammo a = new Ammo(G, 0.0, 10.0, dir);
	    return a;
	}else if(dir == 5){
	    Ammo a = new Ammo(G, -10.0, 10.0,  dir);
	    return a;
	}else if(dir == 6){
	    Ammo a = new Ammo(G, -10.0, 0.0, dir);
	    return a;
	}else if(dir == 7){
	    Ammo a = new Ammo(G, -10.0, -10.0, dir);
	    return a;
	}else{
	    Ammo a = new Ammo(G, -10.0, -10.0, dir);
	    return a;
	}
    }
}
