Hero myHero;
Ammo myAmmo;
Bows myBow;
Weapon weaponType = new Bows(20);
int timer = millis();
//loading  character
PImage img; 
float speed;  
boolean moveLeft, moveRight, moveUp, moveDown, space;
boolean weapon, attack;
int health;
int direction;
int Key = 1;
ArrayList<Ammo> ammo = new ArrayList<Ammo>();
ArrayList<Ammo> mine = new ArrayList<Ammo>(10);
  
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
  if(space && millis() >= timer && Key == 1){
    ammo.addAll(myHero.shoot(weaponType));
    timer = millis() + 350;
  }else if(space && millis() >= timer && Key == 2){
    mine.addAll(myHero.shoot(weaponType));
    timer = millis() + 800;
  }
  for(int i = 0; i < ammo.size(); i++){
    ammo.get(i).drawAmmo();
    ammo.get(i).update();
    }
    for(int i = 0; i < mine.size(); i++){
    mine.get(i).drawMines();
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
  if (keyCode == '1'){
    weaponType = new Bows(20);
    Key = 1;
  }
  if (keyCode == '2'){
    weaponType = new Mines(30);
    Key = 2;
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