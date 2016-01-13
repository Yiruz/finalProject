
Cell[][]grid;
int row = 75;
int col = 50;

void setup(){
  size(750,500);
  grid = new Cell[row][col];
  for(int i=0; i<row ; i++){
    for(int j=0; j<row[i]; j++){
      grid[i][j] = new Cell();
    }
  }
}
