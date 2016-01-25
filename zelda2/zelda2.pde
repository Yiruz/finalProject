Hero myHero;
Ammo myAmmo;
Bows myBow;
Weapon bows = new Bows(20);
int timer = millis();
//loading  character
PImage img; 
float speed;  
boolean moveLeft, moveRight, moveUp, moveDown, space;
boolean weapon, attack;
int health;
int direction;
ArrayList<Ammo> ammo = new ArrayList<Ammo>();
  
void setup() {
  size(640, 640);
  smooth();
  //to move
  speed = 2;
  moveLeft = moveRight = moveUp = moveDown = space = false;
  //zelda specs
  weapon = false;
  attack = false;
  health = 100; 
  // The image file must be in the data folder of the current sketch to load
  // Load the image into the program  
  myHero = new Hero(width/2,height/2,100,3);
} 

void draw() {
  background(255);
  myHero.drawHero();
  myHero.update();
  if(space && millis() >= timer){
    ammo.addAll(myHero.shoot(bows));
    timer = millis() + 700;
  }
  for(int i = 0; i < ammo.size(); i++){
    ammo.get(i).drawAmmo();
    ammo.get(i).update();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      moveLeft = true;
      direction = 4;
    } else if (keyCode == RIGHT) {
      moveRight = true;
      direction = 2;
    } else if (keyCode == UP) {
      moveUp = true;
      direction = 1;
    } else if (keyCode == DOWN) {
      moveDown = true;
      direction = 3;
    }
  }
  if (keyCode == ' ') {
    space = true;
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      moveLeft = false;
    } else if (keyCode == RIGHT) {
      moveRight = false;
    } else if (keyCode == UP) {
      moveUp = false;
    } else if (keyCode == DOWN) {
      moveDown = false;
    }
  }
  if (keyCode == ' ') {
    space = false;
  }
}