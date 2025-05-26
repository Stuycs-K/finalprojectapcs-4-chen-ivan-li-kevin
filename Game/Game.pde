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
  ArrayList<Block> blocks = map.getBlocks();
  ArrayList<Fruit> fruits = map.getFruit();
  for (Block block : blocks){
    int[] coord = block.getCoord();
    fill(#9b6537);
    square(coord[0]*ratio, coord[1]*ratio, ratio);
  }
  for (Fruit fruit : fruits){
    int[] coord = fruit.getCoord();
    fill(#FF0000);
    circle((coord[0]*ratio) + ratio/2, (coord[1]*ratio) + ratio/2, 5*ratio/6);
  }
}
