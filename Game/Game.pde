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
  drawLevel();
}
void draw(){};
void keyPressed(){
  if (key == 'w') {
    moveAttempt(1);
  }
  if (key == 'd') {
    moveAttempt(2);
  }
  if (key == 's') {
    moveAttempt(3);
  }
  if (key == 'a') {
    moveAttempt(4);
  }
  background(255);
  drawLevel();
}
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
  boolean altColor = true;
  for (Segment part : map.getPlayer().body){
    noStroke();
    if (part == map.getPlayer().body.peek()){// extra code for head. dont want to design yet
      fill(#18d11e);
      square(part.getX()*ratio, part.getY()*ratio, ratio);
    }else{
      if (altColor){
        fill(#47db47);
      }else{
        fill(#18d11e);
      }
      altColor = !altColor;
      square(part.getX()*ratio, part.getY()*ratio, ratio);
    }
  }
}

// 1 = north, 2 = east, 3 = south, 4 = west
public void moveAttempt(int direction) {
  Space next;
  if (direction == 1) {
    next = map.getSpaces()[map.getPlayer().getFront().getX()][map.getPlayer().getFront().getY() - 1];
  }
  else if (direction == 2) {
    next = map.getSpaces()[map.getPlayer().getFront().getX() + 1][map.getPlayer().getFront().getY()];
  }
  else if (direction == 3) {
    next = map.getSpaces()[map.getPlayer().getFront().getX()][map.getPlayer().getFront().getY() + 1];
  }
  else{
    next = map.getSpaces()[map.getPlayer().getFront().getX() - 1][map.getPlayer().getFront().getY()];
  }
  if (next instanceof Spike) {
    death();
  }
  else if (next instanceof Fruit) {
    Fruit nextFruit = (Fruit) map.getSpaces()[next.getX()][next.getY()];
    //if (!nextFruit.status()) {
      nextFruit.collect();
      map.checkFruit();
      map.getPlayer().expand(new Segment(next.getX(), next.getY()));
    //}
    // needs to check if there are no more fruits
  }
  //implement when goal class is added
  //else if(next instanceof Goal) {
  //  win();
  //}
  else if (next instanceof Block) {
  }
  else {
    map.getPlayer().move(direction);
    if (map.getPlayer().gravity(checkBody(), map)) {
      death();
    }
  }
}

public int checkBody() {
  System.out.println("New");
  int result = 10000;
  LinkedList<Segment> body = map.getPlayer().getBody();
  for (int i = 0; i < body.size(); i++) {
    Segment current = body.get(i);
    boolean checkingAir = true;
    int count = 0;
    while (checkingAir && current.getY() + count + 1 < map.getSpaces()[0].length) {
      Space next = map.getSpaces()[current.getX()][current.getY() + count + 1];
      if (next instanceof Block) {
        checkingAir = false;
      }
      else {
        count++;
        System.out.println(count);
      }
    }
    if (count < result) {
      result = count;
    }
  }
  return result;
}

public void death(){
}
