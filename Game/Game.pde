boolean debugGrid = false;
int[][] grid;
int ratio, currentLevel;
boolean dead, win;
int debug;
Map map;
void setup() {
  size(1200, 900);
  background(255);
  map = new Map();
  dead = false;
  win = false;
  currentLevel = 1;
  map.loadLevel(currentLevel);
  grid = new int[map.getSpaces().length][map.getSpaces()[1].length];
  ratio = Math.min(width/grid.length, height/grid[0].length);
  if (debugGrid) makeGrid();
  drawLevel();
}
void draw(){};
void makeGrid(){
  fill(255);
  stroke(color(200));
  for(int i = 0; i < grid.length; i++){
    for (int j = 0; j < grid[0].length; j++){
     square(i*ratio, j*ratio, ratio);
    }
  }
}
void keyPressed(){
  map.checkFruit();
  if (win && key == ' '){
    currentLevel++;
    dead = false;
    win = false;
    if (currentLevel >= 3){
      background(255);
      dead = true;
      textSize(60);
      fill(0);
      text("no more levels for now", width/2-400, 200);
    }else{
      map.loadLevel(currentLevel);
    }
  }
  if (key == 'r' && !(currentLevel >= 3)){
    dead = false;
    win = false;
    map.loadLevel(currentLevel);
  }if (!dead && !win){
    if (key == 'w') {
      moveAttempt(1);
    }if (key == 'd') {
      moveAttempt(2);
    }if (key == 's') {
      moveAttempt(3);
    }if (key == 'a') {
      moveAttempt(4);
    }//if (key == 'x'){
    //  win(); // debug
    //}
    if(!dead && !win){
      background(255);
      if (debugGrid){
        makeGrid();
      }
      drawLevel();  
    }
  }
}
public void drawLevel(){
  Space[][] spaceMap = map.getSpaces();
  if (map.opened()){
    fill(#FF00FF);
    circle(map.getGoal()[0]*ratio + ratio/2, map.getGoal()[1]*ratio + ratio/2, 4*ratio/5);
  }
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
      fill(#ffd603);
      circle(part.getX()*ratio + ratio/2, part.getY()*ratio + ratio/2, 2*ratio/3);
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
  LinkedList<Segment> body = map.getPlayer().getBody();
  boolean go = true;
  int nextX;
  int nextY;
  if (direction == 1) {
    nextX = map.getPlayer().getFront().getX();
    nextY = map.getPlayer().getFront().getY() - 1;
  }
  else if (direction == 2) {
    nextX = map.getPlayer().getFront().getX() + 1;
    nextY = map.getPlayer().getFront().getY();
  }
  else if (direction == 3) {
    nextX = map.getPlayer().getFront().getX();
    nextY = map.getPlayer().getFront().getY() + 1;
  }
  else {
    nextX = map.getPlayer().getFront().getX() - 1;
    nextY = map.getPlayer().getFront().getY();
  }
  next = map.getSpaces()[nextX][nextY];
  for (int i = 0; i < body.size(); i++) {
    if (nextX == body.get(i).getX() && nextY == body.get(i).getY()) {
      go = false;
    }
  }
  if (go) {
    if(map.opened() && map.getGoal()[0] == nextX && map.getGoal()[1] == nextY){
      win();
    }
    else if (next instanceof Spike) {
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
    }
  }
  if (map.getPlayer().gravity(checkBody(), map)) {
    death();
  }
}

public int checkBody() {
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
      }
    }
    if (count < result) {
      result = count;
    }
  }
  //System.out.println(result);
  return result;
}
public void win(){
  win = true;
  LinkedList<Segment> body = map.getPlayer().getBody();
  while (body.size() > 0){
    body.removeFirst();
  }
  background(255);
  drawLevel();
  textSize(120);
  fill(0);
  text("You Win!", width/2-220, 200);
  textSize(30);
  text("Press space to progress to the next level", width/2-250, 240);
  text("Press R to restart the level.", width/2-170, 280);
}
public void death(){
  dead = true;
  LinkedList<Segment> body = map.getPlayer().getBody();
  while (body.size() > 0){
    body.removeFirst();
  }
  background(255);
  drawLevel();
  textSize(120);
  fill(0);
  text("Game Over!", width/2-300, 200);
  textSize(30);
  text("Press R to restart the level.", width/2-170, 280);
}
