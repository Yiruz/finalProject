MapEdit mapEdit;

void setup(){
  size(750,500);
<<<<<<< HEAD:Collison/Collison.pde
  mapEdit = new MapEdit(10,10);
}

void draw(){

}
=======
  grid = new Cell[row][col];
  for(int i=0; i<row ; i++){
    for(int j=0; j<row[i]; j++){
      grid[i][j] = new Cell();
    }
  }
}
>>>>>>> 7f75bd7b1e69cb1ac680598da55f587fce5c7316:levelEditor/levelEditor.pde
