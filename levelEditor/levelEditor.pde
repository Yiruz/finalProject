MapEdit mapEdit;
PGraphics tile;

void setup(){
  size(900,600);
  noStroke();
  mapEdit = new MapEdit(30, 30);
  tile = createGraphics(30, 30);
  mapEdit.rend();
}

void draw(){
  noStroke();

}

void mousePressed(){
  if(mouseButton == LEFT){
    mapEdit.setTile();
  }
}