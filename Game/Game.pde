boolean debugGrid = false;
int[][] grid;
int ratio;
boolean dead;
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
  if (key == 'r'){
    dead = false;
    map.loadLevel(1);
  }if (!dead){
    if (key == 'w') {
      moveAttempt(1);
    }if (key == 'd') {
      moveAttempt(2);
    }if (key == 's') {
      moveAttempt(3);
    }if (key == 'a') {
      moveAttempt(4);
    }
    if(!dead){
    background(255);
    drawLevel();
    }
  }
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
  System.out.println(result);
  return result;
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
  fill(#000000);
  text("Game Over!", 150, 200);
  textSize(45);
  text("Press R to restart the level.", 200, 280);
}
