
//loading  character
  PImage img; 
  float xPos;
  float yPos;
  float speed;  
  boolean moveLeft, moveRight, moveUp, moveDown;
  ArrayList bows = new ArrayList();
  int k = 1;
  boolean weapon, attack;
  int health;

  void setup(){
    size(640, 640);
    smooth();
    noStroke();
    //to move
    xPos = width/2;
    yPos = height/2;
    speed = 2;
    moveLeft = moveRight = moveUp = moveDown = false;
    //zelda specs
    weapon = false;
    attack = false;
    health = 100;
    //bows
    bows = new ArrayList();
    // The image file must be in the data folder of the current sketch to load
    img = loadImage("zelda.gif");  // Load the image into the program  
  }

  void draw(){
    // Displays the image at point (0, height/12) at half of its size
    background(0);
    //image(img, 0, height/12, img.width/12, img.height/12);
     
    if(moveLeft) xPos -= speed;
    if(moveRight) xPos += speed;
    if(moveUp) yPos -= speed;
    if(moveDown) yPos += speed;
   
    image(img, xPos, yPos, 30, 30);

  }

void keyPressed() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = true;
     } else if(keyCode == RIGHT) {
       moveRight = true;
     } else if(keyCode == UP) {
       moveUp = true;
     } else if(keyCode == DOWN) {
       moveDown = true;
     }
  }
  if(key == 'A' || key == 'a'){
     bows.add(new Bows(getC(k), (getC(k)).cX, (getC(k)).cY));
  }
}
 
void keyReleased() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = false;
     } else if(keyCode == RIGHT) {
       moveRight = false;
     } else if(keyCode == UP) {
       moveUp = false;
     } else if(keyCode == DOWN) {
       moveDown = false;
     } 
  }
}
public Bows getC(int index)
{
  if (index<bows.size())
    return ((Bows)bows.get(index));
  else
    return null;
}

class Hero
{
  //hero specs
  int health;
  int lives;
  boolean weapon, attack;
  PVector v1 = new PVector();
  
  public Hero(float x, float y){
      v1.x = x;
      v1.y = y;
  }
}


class Bows
{
  private PVector v1 = new PVector();
  private Hero h;
  private int age = 0;
  PVector center;
  PVector turret;
  public Bows(Hero h, float x, float y){
    this.h = h;
    v1.x = x;
    v1.y = y; 
    center = new PVector(h.v1.x, h.v1.y);
  }
  void keyPressed() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = true;
     } else if(keyCode == RIGHT) {
       moveRight = true;
     } else if(keyCode == UP) {
       moveUp = true;
     } else if(keyCode == DOWN) {
       moveDown = true;
     }
  }
  if(key == 'A' || key == 'a'){
     bows.add(new Bows(getC(k), (getC(k)).cX, (getC(k)).cY));
  }
}
 
void keyReleased() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = false;
     } else if(keyCode == RIGHT) {
       moveRight = false;
     } else if(keyCode == UP) {
       moveUp = false;
     } else if(keyCode == DOWN) {
       moveDown = false;
     } 
  }
}
  void run(){
      noStroke();
      fill(200);
      ellipse(v1.x, v1.y, 10, 10);
      PVector vel = PVector.sub(turret, center);
      v1.add( new PVector(vel.x/15, vel.y/15));
      age++;
      if(age > 100){
     //    Bows.remove(this);
      }
  }
  private float r = 90;
  float cX;
  float cY;
  private float angle;
  void show(){    smooth();
    float angle = atan2(mouseY-v1.y,mouseX-v1.x);
     cX = (r * cos(angle)) + v1.x;
     cY = (r * sin(angle)) + v1.y;
  }
}