class MapEdit{
  int x, y;
  final int tileGreen = 0;
  final int tileGround = 1;
  final int tileRock = 2;
  final int tileEnd = 3;
  final int tileStart = 4;
  PImage rock;
  int edit =1;
  int[][]map = new int [30][20];

  MapEdit(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void rend(){
    for(int i=0; i<map.length; i++){
      for(int j=0; j<map[i].length; j++){
        //fill(0, 255, 0);
        stroke(1);
        rect(30*i, 30*j, 30, 30);
        map[i][j] = 1;
      }
    }
  }

  void setGreen(){
    fill(0, 225, 0);
    rect(mouseX, mouseY, 30, 30);
  }
  void setGround(){
    fill(198, 160, 32);
    rect(mouseX, mouseY, 30, 30);
  }
  void setRock(){
    rock = loadImage("rocks.png");
    image(rock, mouseX, mouseY, 30, 30);
  }
  void setTile(){
    switch(edit){
      case 0:
        setGreen();
        break;
      case 1:
        setGround();
        break;
      case 2:
        setRock();
        break;
      
    }
  }
  

  void buildObj(){
   
    if(mousePressed && (mouseButton == LEFT)){
      setTile();
 
    }
  }

}