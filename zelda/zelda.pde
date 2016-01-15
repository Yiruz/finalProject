Hero myHero;
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
  ArrayList<Bows> bows = new ArrayList<Bows>();
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
    //bows = new ArrayList();
    // The image file must be in the data folder of the current sketch to load
    img = loadImage("zelda.gif");  // Load the image into the program  
    myHero = new Hero(new PVector(width/2, height/2));
  }

  void draw(){
    // Displays the image at point (0, height/12) at half of its size
    //background(0);
    //image(img, 0, height/12, img.width/12, img.height/12);
     
    if(moveLeft) xPos -= speed;
    if(moveRight) xPos += speed;
    if(moveUp) yPos -= speed;
    if(moveDown) yPos += speed;
   
    image(img, xPos, yPos, 30, 30);
    
    if(space){
        bows.add(new Bows(myHero.v1.get(), bowsVelocity));
        space = false;
    }

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
  else if(keyCode == ' '){
       space = true;
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
  else if(keyCode == ' '){
      space = false;
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
  PVector v1 = new PVector(0, 7);
  
  /*public Hero(float x, float y){
      v1.x = x;
      v1.y = y;
  }*/
  Hero(PVector v1){
      this.v1 = v1;
  }
  void update() {
    if (v1.x > width) {
      v1.x = 0-10;
    }
    if (v1.x < 0) {
      v1.x = width;
    }
    if (v1.y > height) {
      v1.y = 0;
    }
    if (v1.y < 0) {
      v1.y = height;
    }
  }
}


class Bows
{
  PVector position;
  //private Hero h;
  //private int age = 0;
  PVector vel;
  boolean present;
  Bows(PVector position, PVector vel){
    this.position = position;
    this.vel = vel;
    present = true;
  }

  /*void run(){
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
  */
    void update() {
    position.add(vel);
 
    if (position.y < 0 || position.y > height) {
      present = false;
    } 
    else if (position.x < 0 || position.x > width) {
      present = false;
    }
  }
 
  void draw() {
    fill(63);
    if (present) {
      pushMatrix();
      translate(position.x, position.y);
      ellipse(0, 0, 8, 8);
      popMatrix();
    }
  }
}
