boolean debugGrid = true;
int[][] grid;
int ratio;
Map map;
void setup() {
  size(900, 900);
  background(255);
  grid = new int[15][15];
  ratio = Math.min(width/grid.length, height/grid[0].length);
  stroke(color(200));
  if (debugGrid){
    for(int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        square(i*ratio, j*ratio, ratio);
      }
    }
  }
  map = new Map();
  map.loadLevel(1);
}
void draw(){};
void keyPressed(){}; //empty for now, need snakebird to be implemented
public void drawLevel(){
  Space[][] spaceMap = map.getSpaces();
  for (int i = 0; i < spaceMap.length; i++){
    for (int j = 0; j < spaceMap[i].length; j++){
      if (spaceMap[i][j] != null){
        Space currentBlock = spaceMap[i][j];
        if (currentBlock instanceof Fruit){
          fill(#FF0000);
          circle(i*ratio + ratio/2, (j*ratio) + ratio/2, 4*ratio/5);
        }else{
          if (!debugGrid){
            noStroke();
          }
          fill(#9b6537);
          square(i*ratio, j*ratio, ratio);
        }
      }
    }
  }
}
