MapEdit mapEdit;
PGraphics tile;

void setup(){
  size(750,500);
  noStroke();
  mapEdit = new MapEdit(30, 30);
  tile = createGraphics(30, 30);
  //mapEdit.rend();
}

void draw(){

}

void mousePressed(){
  if(mouseButton == LEFT){
    mapEdit.setTile();
  }
}