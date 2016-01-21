Hero myHero;
Ammo myAmmo;
Bows myBow;
//loading  character
PImage img; 
float speed;  
boolean moveLeft, moveRight, moveUp, moveDown, space;
boolean weapon, attack;
int health;
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
  myHero = new Hero(0,0,100,3);
  myAmmo = new Ammo(0.0,0.0,0);
}

void draw() {
  background(255);
  myHero.drawHero();
  myHero.update();
  if(space){
    myAmmo.drawAmmo();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      moveLeft = true;
    } else if (keyCode == RIGHT) {
      moveRight = true;
    } else if (keyCode == UP) {
      moveUp = true;
    } else if (keyCode == DOWN) {
      moveDown = true;
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