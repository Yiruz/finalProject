
//loading  character
  PImage img; 
  float xPos;
  float yPos;
  float speed;  
  boolean moveLeft, moveRight, moveUp, moveDown;
  //hero specs
  int health;
  int lives;
  boolean weapon, attack;
  
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

void melee(){
  
  }