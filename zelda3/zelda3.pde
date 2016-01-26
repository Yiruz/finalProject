//Hero Setup
Hero myHero;
Ammo myAmmo;
Bows myBow;
//Melee myMelee;
Weapon weaponType = new Bows(20);
int timer = millis();
PImage img; 
float speed;  
boolean moveLeft, moveRight, moveUp, moveDown, space;
boolean weapon, attack;
//int health;
//int lives;
boolean w1, w2, w3, w4;
int health;
int lives;
int direction;
int Key = 1;
ArrayList<Ammo> ammo = new ArrayList<Ammo>();
ArrayList<Ammo> mine = new ArrayList<Ammo>(10);
PImage rock, hero, princess, keys, triforce;
float xpos;
float ypos;
float x, y, w, h;
boolean gameOver;


//Map Setup
Map1 one;
Map2 two;
Map3 three;
Map4 four;
int MapNum = 1;
String s = "You saved the princess!";
String exit = "You have to get the triforce to exit";
boolean mapChange = false;

void setup() {
  size(900, 600);
  smooth();
  noStroke();
  //to move
  speed = 2.5;
  moveLeft = moveRight = moveUp = moveDown = space = false;
  //zelda specs
  weapon = false;
  attack = false;
  gameOver = false;
  // The image file must be in the data folder of the current sketch to load
  // Load the image into the program  
  myHero = new Hero(width/2,height/2,100,3);
  myHero.health = 100; 
  myHero.lives = 3;
  myHero = new Hero(width/2, height/2, 100, 3);
  //Map Elements
  princess = loadImage("princess.png");
  keys = loadImage("KeyMagical3.png");
  triforce = loadImage("triforce1.gif");
  rock = loadImage("rocks.png");
  one = new Map1();
  two = new Map2();
  three = new Map3();
  four = new Map4();
  w1 = true;
  w2 = false;
  w3 = false;
  w4 = false;
  one.setup();
} 

void draw() {

  //Map Drawing
  background(255, 222, 173);
  myHero.loseLive();
  switch(MapNum) {
  case 1:
    one.draw();
    w1 = true;
    break;
  case 2:
    two.draw();
    w2 = true;
    w1 = false;
    break;
  case 3:
    three.draw();
    w3 = true;
    w2 = false;
    break;
  case 4:
    four.draw();
    w4 = true;
    w3 = false;
    break;
  }

  imageMode(CENTER);
  //image(hero, xpos, ypos, 30, 30);
  
  //textAlign(CENTER);
  fill(0);
  textSize(15);
  text("Lives = "+myHero.getLives(), 60, 15);
  text("HP = " +myHero.health, 150, 15);
  //background(255);
  myHero.placeHero();
  myHero.update();
  if (space && millis() >= timer && Key == 2) {
    ammo.addAll(myHero.shoot(weaponType));
    timer = millis() + 350;
  } else if (space && millis() >= timer && Key == 3) {
    mine.addAll(myHero.shoot(weaponType));
    timer = millis() + 800;
  } else if (space && millis() >= timer && Key == 1) {
    //M = new Melee(10);
    //myHero.drawM();
  }
  for (int i = 0; i < ammo.size(); i++) {
    if (direction == 1) {
      ammo.get(i).drawAmmoU();
      ammo.get(i).update();
    } else if (direction == 2) {
      ammo.get(i).drawAmmoR();
      ammo.get(i).update();
    } else if (direction == 3) {
      ammo.get(i).drawAmmoD();
      ammo.get(i).update();
    } else {
      ammo.get(i).drawAmmoL();
      ammo.get(i).update();
    }
  }
  for (int i = 0; i < mine.size(); i++) {
    mine.get(i).drawMines();
    if (millis() >= timer + 1000 || mapChange) {
      mine.remove(i);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT/* && keyCode != RIGHT && keyCode != UP && keyCode != DOWN*/) {
      moveLeft = true;
      direction = 4;
    } else if (keyCode == RIGHT /*&& keyCode != LEFT && keyCode != UP && keyCode != DOWN*/) {
      moveRight = true;
      direction = 2;
    } else if (keyCode == UP /*&& keyCode != DOWN && keyCode != LEFT && keyCode != RIGHT*/) {
      moveUp = true;
      direction = 1;
    } else if (keyCode == DOWN /*&& keyCode != UP && keyCode != RIGHT && keyCode != LEFT*/) {
      moveDown = true;
      direction = 3;
    }
  }
  if (keyCode == ' ') {
    space = true;
  }
  if (keyCode == '1') {
    //weaponType = new Melee(10);
    Key = 1;
  }
  if (keyCode == '2') {
    weaponType = new Bows(20);
    Key = 2;
  }
  if (keyCode == '3') {
    weaponType = new Mines(30);
    Key = 3;
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