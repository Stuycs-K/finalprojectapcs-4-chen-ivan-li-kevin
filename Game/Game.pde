boolean debugGrid = true;;
int grid[][];
void setup() {
  size(900, 900);
  background(255);
  grid = new int[15][15];
  stroke(color(10));
  if (debugGrid){
    for(int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        square(i*(width/grid[0].length), j*(height/grid.length), height/grid[0].length);
      }
    }
  }
}
