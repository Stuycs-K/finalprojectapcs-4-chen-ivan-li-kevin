boolean debugGrid = false;
int[][] grid;
int ratio, currentLevel, currentPlayer;
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
  currentPlayer = 0;
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
  if (Character.isDigit(key)){
    currentLevel = key-48;
    dead = !(map.loadLevel(currentLevel));
  }
  if (win && key == ' '){
    currentLevel++;
    currentPlayer = 0;
    win = false;
    dead = !(map.loadLevel(currentLevel));
  }
  if (key == 'r' && !(currentLevel >= 5)){
    dead = !(map.loadLevel(currentLevel));
    win = false;
  }if (!dead && !win){
    if (key == CODED){
      if (keyCode == UP){
        moveAttempt(1);
      }if (keyCode == RIGHT){
        moveAttempt(2);
      }if (keyCode == DOWN){
        moveAttempt(3);
      }if (keyCode == LEFT){
        moveAttempt(4);
      }
    }else{
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
      if (key == 'e') {
        for (int i = 0; i < map.getSpaces().length; i++) {
          for (int ind = 0; ind < map.getSpaces[i].length; ind++) {
            if (
          }
        }
        currentPlayer = (currentPlayer + 1) % map.getPlayers().size();
      }
    }
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
  stroke(#FF00FF);
  if (map.opened()){
    fill(#FF00FF);
  }else{
    fill(#FFFFFF);
  }circle(map.getGoal()[0]*ratio + ratio/2, map.getGoal()[1]*ratio + ratio/2, 4*ratio/5);
  for (int i = 0; i < spaceMap.length; i++){
    for (int j = 0; j < spaceMap[i].length; j++){
      if (spaceMap[i][j] != null){
        Space currentBlock = spaceMap[i][j];
        if (currentBlock instanceof Fruit){
          fill(#FF0000);
          circle(i*ratio + ratio/2, (j*ratio) + ratio/2, 4*ratio/5);
        }else if (currentBlock instanceof Spike){
          makeSpike(i,j);
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
  for (int i = 0; i < map.getPlayers().size(); i++) {
    for (Segment part : map.getPlayer(i).body){
    noStroke();
    if (part == map.getPlayer(currentPlayer).body.peek()){// extra code for head. dont want to design yet
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
}
public void makeSpike(int x, int y){
  fill(127);
  noStroke();
  triangle(x*ratio + ratio/4, y*ratio + ratio/4, x*ratio + ratio/2, y*ratio + ratio/4, x*ratio + 3*ratio/8, y*ratio); 
  triangle(x*ratio + ratio/2, y*ratio + ratio/4, x*ratio + 3*ratio/4, y*ratio + ratio/4, x*ratio + 5*ratio/8, y*ratio); 
  triangle(x*ratio + ratio/4, y*ratio + 3*ratio/4, x*ratio + ratio/2, y*ratio + 3*ratio/4, x*ratio + 3*ratio/8, y*ratio+ratio); 
  triangle(x*ratio + ratio/2, y*ratio + 3*ratio/4, x*ratio + 3*ratio/4, y*ratio + 3*ratio/4, x*ratio + 5*ratio/8, y*ratio+ratio); 
  triangle(x*ratio + ratio/4, y*ratio + ratio/4, x*ratio + ratio/4, y*ratio + ratio/2, x*ratio, y*ratio + 3*ratio/8); 
  triangle(x*ratio + ratio/4, y*ratio + ratio/2, x*ratio + ratio/4, y*ratio + 3*ratio/4, x*ratio, y*ratio + 5*ratio/8);  
  triangle(x*ratio + 3*ratio/4, y*ratio + ratio/4, x*ratio + 3*ratio/4, y*ratio + ratio/2, x*ratio+ratio, y*ratio + 3*ratio/8); 
  triangle(x*ratio + 3*ratio/4, y*ratio + ratio/2, x*ratio + 3*ratio/4, y*ratio + 3*ratio/4, x*ratio+ratio, y*ratio + 5*ratio/8); 
  stroke(200);
  square(x*ratio + ratio/4, y*ratio + ratio/4, ratio/2);
}
// 1 = north, 2 = east, 3 = south, 4 = west
public void moveAttempt(int direction) {
  Space next;
  LinkedList<Segment> body = map.getPlayer(currentPlayer).getBody();
  boolean go = true;
  int nextX;
  int nextY;
  // finds block thats being moved to
  if (direction == 1) {
    nextX = map.getPlayer(currentPlayer).getFront().getX();
    nextY = map.getPlayer(currentPlayer).getFront().getY() - 1;
  }
  else if (direction == 2) {
    nextX = map.getPlayer(currentPlayer).getFront().getX() + 1;
    nextY = map.getPlayer(currentPlayer).getFront().getY();
  }
  else if (direction == 3) {
    nextX = map.getPlayer(currentPlayer).getFront().getX();
    nextY = map.getPlayer(currentPlayer).getFront().getY() + 1;
  }
  else {
    nextX = map.getPlayer(currentPlayer).getFront().getX() - 1;
    nextY = map.getPlayer(currentPlayer).getFront().getY();
  }
  next = map.getSpaces()[nextX][nextY];
  //checks if moving into self
  for (int i = 0; i < body.size(); i++) {
    if (nextX == body.get(i).getX() && nextY == body.get(i).getY()) {
      go = false;
    }
  }
  //checks if pushing other player (WILL ONLY WORK WITH 2 SNAKEBIRDS)  (NOT READY, MAYBE LATER)
  /*int pushing = -1;
  for (int ind = 0; ind < map.getPlayers().size(); ind++) {
    if (ind != currentPlayer) {
      LinkedList<Segment> sb = map.getPlayer(ind).getBody();
      for (int i = 0; i < sb.size(); i++) {
        if (nextX == sb.get(i).getX() && nextY == sb.get(i).getY()) {
          pushing = ind;
        }
      }
    }
    if (pushing != -1) {
      LinkedList<Segment> sb = map.getPlayer(pushing).getBody();
      for (int i = 0; i < sb.size(); i++) {
        Space test = map.getSpaces()[sb.get(i).getX()][sb.get(i).getY() - 1];
        if (test instanceof Spike) {
          death();
        }
        else if (test instanceof Block) {
          go = false;
        }
      }
      if (go) {
        for (int i = 0; i < sb.size(); i++) {
          sb.get(i).changeY(-1);
        }
      }
    }
  }*/
  //checks the other possible block types
  if (go) {
    if(map.opened() && map.getGoal()[0] == nextX && map.getGoal()[1] == nextY){
      win();
    }
    else if (next instanceof Spike) {
      death();
    }
    else if (next instanceof Fruit) {
      Fruit nextFruit = (Fruit) map.getSpaces()[next.getX()][next.getY()];
      nextFruit.collect();
      map.checkFruit();
      map.getPlayer(currentPlayer).expand(new Segment(next.getX(), next.getY()));
    }
    else if (next instanceof Block) {
    }
    else {
      map.getPlayer(currentPlayer).move(direction);
    }
  }
  if (map.getPlayer(currentPlayer).gravity(checkBody(), map)) {
    death();
  }
}

public boolean pushable(Snakebird other, int direction) {
  if (direction == 1) {
    for (int i = 0; i < 
  }
  else if (direction == 2) {
  }
  else if (direction == 3) {
  }
  else {
  }
}

public int checkBody() {
  int result = 10000;
  LinkedList<Segment> body = map.getPlayer(currentPlayer).getBody();
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
  LinkedList<Segment> body = map.getPlayer(currentPlayer).getBody();
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
  LinkedList<Segment> body = map.getPlayer(currentPlayer).getBody();
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
