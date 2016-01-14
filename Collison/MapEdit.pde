class MapEdit{
  float wTile, hTile;
  final int tileGreen = 0;
  final int tileGround = 1;
  final int tileRock = 2;
  final int tileEnd = 3;
  PImage rock;

  MapEdit(int wTile, int hTile){
  
  }


  void setTile(int tile){
    if(tile == 0){
      fill(0, 225, 0);
      rect(mouseX, mouseY, wTile, hTile);
    }
    if(tile == 1){
      fill(65, 188, 55);
      rect(mouseX, mouseY, wTile, hTile);
    }
    if(tile == 2){
      rock = loadImage("rocks.png");
      image(rock, mouseX, mouseY, wTile, hTile);
    }
  }
  
  void buildObj(){
    if(mousePressed && (mouseButton == LEFT)){
      if(keyPressed){
        if(keyCode == 1){
          setTile(0);
        }
        if(keyCode == 2){
          setTile(1);
        }
        if(keyCode == 3){
      }
 
    }
  }
  }

}