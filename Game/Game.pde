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
    currentPlayer = 0;
  }
  if (win && key == ' '){
    currentLevel++;
    currentPlayer = 0;
    win = false;
    dead = !(map.loadLevel(currentLevel));
  }
  if (key == 'r' && !(currentLevel >= 8)){
    dead = !(map.loadLevel(currentLevel));
    currentPlayer = 0;
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
      if (key == 'e' && map.getPlayers().size() != 1) {
        //swaps player
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
  for (int i = 0; i < spaceMap.length; i++){ //drawing map
    for (int j = 0; j < spaceMap[i].length; j++){
      if (spaceMap[i][j] != null){
        Space currentBlock = spaceMap[i][j];
        if (currentBlock instanceof Fruit){
          fill(#FF0000);
          circle(i*ratio + ratio/2, (j*ratio) + ratio/2, 4*ratio/5);
        }else if (currentBlock instanceof Spike){
          makeSpike(i,j);
        }
        else if (currentBlock instanceof Segment){
        }else{
          stroke(200);
          if (!debugGrid){
            noStroke();
          }
          fill(#9b6537);
          square(i*ratio, j*ratio, ratio);
        }
      }
    }
  }
  for (int i = 0; i < map.getPlayers().size(); i++) { //drawing snakebird
    boolean altColor = false;
    for (Segment part : map.getPlayer(i).body){
      noStroke();
      if (altColor){
        if (i == 0) fill(#47db47);
          else fill(#0088fe);
        }else{
          if (i == 0) fill(#18d11e);
          else fill(#004dff);
        }
        altColor = !altColor;
        square(part.getX()*ratio, part.getY()*ratio, ratio);
      }
  }for (int i = 0; i < map.getPlayers().size(); i++){// extra code for head
    if(map.getPlayer(i).body.size() > 0){
      Segment part = map.getPlayer(i).body.get(0);
      int playDirect = map.getPlayer(i).direction;
      int beakX = 0; 
      int beakY = 0; //aligns sleep signs
      fill(#ffd603);
      switch(playDirect){
        case 1:
          triangle(part.getX()*ratio+ratio/4, part.getY()*ratio+ratio/6, part.getX()*ratio+3*ratio/4, part.getY()*ratio+ratio/6, part.getX()*ratio+ratio/2, part.getY()*ratio-ratio/2+ratio/6);
          beakX = part.getX()*ratio+2*ratio/3-20;
          beakY = part.getY()*ratio-2*ratio/3;
          fill(255);
          stroke(0);
          if(i == currentPlayer){
            circle(part.getX()*ratio+ratio/2, part.getY()*ratio+ratio/3+ratio/10, ratio/4);
            circle(part.getX()*ratio+7*ratio/9, part.getY()*ratio+2*ratio/9+ratio/10, ratio/4);
            fill(0);
            circle(part.getX()*ratio+ratio/2, part.getY()*ratio+ratio/3+ratio/10, ratio/8);
            circle(part.getX()*ratio+7*ratio/9, part.getY()*ratio+2*ratio/9+ratio/10, ratio/8);
          }break;
        case 2:
          triangle(part.getX()*ratio+ratio-ratio/3, part.getY()*ratio+ratio/4+ratio/6, part.getX()*ratio+ratio-ratio/3, part.getY()*ratio+3*ratio/4+ratio/6, part.getX()*ratio+3*ratio/2-ratio/3, part.getY()*ratio+ratio/2+ratio/6);
          beakX = part.getX()*ratio+2*ratio/3;
          beakY = part.getY()*ratio-ratio/6;
          fill(255);
          stroke(0);
          if (i == currentPlayer){
            circle(part.getX()*ratio+ratio/2, part.getY()*ratio+ratio/3, ratio/4);
            circle(part.getX()*ratio+7*ratio/9, part.getY()*ratio+2*ratio/9, ratio/4);
            fill(0);
            circle(part.getX()*ratio+ratio/2, part.getY()*ratio+ratio/3, ratio/8);
            circle(part.getX()*ratio+7*ratio/9, part.getY()*ratio+2*ratio/9, ratio/8);
          }break;
        case 3:
          triangle(part.getX()*ratio+ratio/4, part.getY()*ratio+ratio-ratio/6, part.getX()*ratio+3*ratio/4, part.getY()*ratio+ratio-ratio/6, part.getX()*ratio+ratio/2, part.getY()*ratio+3*ratio/2-ratio/6);
          beakX = part.getX()*ratio+2*ratio/3-20;
          beakY = part.getY()*ratio+ratio/3;
          fill(255);
          stroke(0);
          if (i == currentPlayer){
            circle(part.getX()*ratio+ratio/2, part.getY()*ratio+2*ratio/9+ratio/3, ratio/4);
            circle(part.getX()*ratio+2*ratio/9, part.getY()*ratio+ratio/3+ratio/3, ratio/4);
            fill(0);
            circle(part.getX()*ratio+ratio/2, part.getY()*ratio+2*ratio/9+ratio/3, ratio/8);
            circle(part.getX()*ratio+2*ratio/9, part.getY()*ratio+ratio/3+ratio/3, ratio/8);
          }break;
        case 4:
          triangle(part.getX()*ratio+ratio/6, part.getY()*ratio+ratio/4+ratio/6, part.getX()*ratio+ratio/6, part.getY()*ratio+3*ratio/4+ratio/6, part.getX()*ratio-ratio/2+ratio/6, part.getY()*ratio+ratio/2+ratio/6);  
          beakX = part.getX()*ratio;
          beakY = part.getY()*ratio;
          fill(255);
          stroke(0);
          if (i == currentPlayer){
            circle(part.getX()*ratio+ratio/2, part.getY()*ratio+ratio/3, ratio/4);
            circle(part.getX()*ratio+2*ratio/9, part.getY()*ratio+2*ratio/9, ratio/4);
            fill(0);
            circle(part.getX()*ratio+ratio/2, part.getY()*ratio+ratio/3, ratio/8);
            circle(part.getX()*ratio+2*ratio/9, part.getY()*ratio+2*ratio/9, ratio/8);
          }break;
      }
      if (i != currentPlayer){
        textSize(25);
        fill(0);
        text('Z', beakX+ratio/3, beakY+ratio/2);
        textSize(30);
        text('Z', beakX+2*ratio/3, beakY+ratio/6);
        textSize(35);
        text('Z', beakX+ratio, beakY-ratio/6);
      }
      noStroke();
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
  //checks if pushing other player
  //System.out.println("NEW");
  for (int ind = 0; ind < map.getPlayers().size(); ind++) {
    int pushing = -1;
    if (ind != currentPlayer) {
      //System.out.println("IND: " + ind);
      //System.out.println(currentPlayer);
      LinkedList<Segment> sb = map.getPlayer(ind).getBody();
      for (int i = 0; i < sb.size(); i++) {
        if (nextX == sb.get(i).getX() && nextY == sb.get(i).getY()) {
          pushing = ind;
        }
      }
    }
    //System.out.println(pushing);
    if (pushing != -1) {
      //System.out.println("NO");
      Snakebird other = map.getPlayer(pushing);
      if (pushable(other, direction)) {
        //System.out.println("YES");
        if (direction == 1) {
          for (int i = 0; i < other.getBody().size(); i++) {
            map.getSpaces()[other.getBody().get(i).getX()][other.getBody().get(i).getY()] = null;
            other.getBody().get(i).changeY(-1);
            map.getSpaces()[other.getBody().get(i).getX()][other.getBody().get(i).getY()] = other.getBody().get(i);
          }
        }
        else if (direction == 2) {
          for (int i = 0; i < map.getPlayer(pushing).getBody().size(); i++) {
            map.getSpaces()[other.getBody().get(i).getX()][other.getBody().get(i).getY()] = null;
            other.getBody().get(i).changeX(1);
            map.getSpaces()[other.getBody().get(i).getX()][other.getBody().get(i).getY()] = other.getBody().get(i);
          }
        }
        else if (direction == 3) {
          for (int i = 0; i < map.getPlayer(pushing).getBody().size(); i++) {
            map.getSpaces()[other.getBody().get(i).getX()][other.getBody().get(i).getY()] = null;
            other.getBody().get(i).changeY(1);
            map.getSpaces()[other.getBody().get(i).getX()][other.getBody().get(i).getY()] = other.getBody().get(i);
          }
        }
        else {
          for (int i = 0; i < map.getPlayer(pushing).getBody().size(); i++) {
            map.getSpaces()[other.getBody().get(i).getX()][other.getBody().get(i).getY()] = null;
            other.getBody().get(i).changeX(-1);
            map.getSpaces()[other.getBody().get(i).getX()][other.getBody().get(i).getY()] = other.getBody().get(i);
          }
        }
        map.getPlayer(currentPlayer).move(direction);
      }
    }
  }
  //checks the other possible block types
  if (go) {
    if(map.opened() && map.getGoal()[0] == nextX && map.getGoal()[1] == nextY){
      LinkedList<Segment> b = map.getPlayer(currentPlayer).getBody();
      while (b.size() > 0){
        b.removeFirst();
      }
      map.getPlayers().remove(currentPlayer);
      if (map.getPlayers().size() != 0){
        currentPlayer = (currentPlayer + 1) % map.getPlayers().size();
      }
      if (map.getPlayers().size() == 0) {
        win();
      }
    }
    else if (next instanceof Spike) {
      death();
    }
    else if (next instanceof Fruit) {
      Fruit nextFruit = (Fruit) map.getSpaces()[next.getX()][next.getY()];
      nextFruit.collect();
      map.checkFruit();
      map.getPlayer(currentPlayer).expand(new Segment(next.getX(), next.getY()));      
      map.getPlayer(currentPlayer).direction = direction;
    }
    else if (next instanceof Block || next instanceof Segment) {
      //System.out.println("YES");
    }
    else {
      //System.out.println("NO");
      map.getPlayer(currentPlayer).move(direction);
      map.getPlayer(currentPlayer).direction = direction;
    }
    for (int i = 0; i < map.getSpaces().length; i++) {
      for (int ind = 0; ind < map.getSpaces()[i].length; ind++) {
        if (map.getSpaces()[i][ind] instanceof Segment) {
          map.getSpaces()[i][ind] = null;
        }
      }
    }
    for (int i = 0; i < map.getPlayers().size(); i++) {
      Snakebird sb = map.getPlayer(i);
      for (int ind = 0; ind < sb.getBody().size(); ind++) {
        int x = sb.getBody().get(ind).getX();
        int y = sb.getBody().get(ind).getY();
        map.getSpaces()[x][y] = sb.getBody().get(ind);
      }
    }
  }
  for (int i = 0; i < map.getPlayers().size(); i++) {
    int chosen = (currentPlayer + i) % map.getPlayers().size();
    Snakebird sb = map.getPlayer(chosen);
    if (sb.gravity(checkBody(sb), map)) {
      death();
    }
    //System.out.println("NEW");
    for (int x = 0; x < map.getSpaces().length; x++) {
      for (int y = 0; y < map.getSpaces()[x].length; y++) {
        if (map.getSpaces()[x][y] instanceof Segment) {
          //System.out.println(map.getSpaces()[x][y]);
          map.getSpaces()[x][y] = null;
        }
      }
    }
    for (int index = 0; index < map.getPlayers().size(); index++) {
      Snakebird s = map.getPlayer(index);
      for (int ind = 0; ind < s.getBody().size(); ind++) {
        int x = s.getBody().get(ind).getX();
        int y = s.getBody().get(ind).getY();
        map.getSpaces()[x][y] = s.getBody().get(ind);
      }
    }
  }
}

//idk what happens when head is pushed into goal
public boolean pushable(Snakebird other, int direction) {
  if (direction == 1) {
    for (int i = 0; i < other.getBody().size(); i++) {
      int x = other.getBody().get(i).getX();
      int y = other.getBody().get(i).getY();
      if (map.getSpaces()[x][y - 1] instanceof Spike) {
        death();
        return false;
      }
      else if (map.getSpaces()[x][y - 1] instanceof Block && !(map.getSpaces()[x][y - 1] instanceof Segment)) {
        return false;
      }
    }
  }
  else if (direction == 2) {
    for (int i = 0; i < other.getBody().size(); i++) {
      int x = other.getBody().get(i).getX();
      int y = other.getBody().get(i).getY();
      if (map.getSpaces()[x + 1][y] instanceof Spike) {
        death();
        return false;
      }
      else if (map.getSpaces()[x + 1][y] instanceof Block && !(map.getSpaces()[x + 1][y] instanceof Segment)) {
        return false;
      }
    }
  }
  else if (direction == 3) {
    for (int i = 0; i < other.getBody().size(); i++) {
      int x = other.getBody().get(i).getX();
      int y = other.getBody().get(i).getY();
      if (map.getSpaces()[x][y + 1] instanceof Spike) {
        death();
        return false;
      }
      else if (map.getSpaces()[x][y + 1] instanceof Block && !(map.getSpaces()[x][y + 1] instanceof Segment)) {
        return false;
      }
    }
  }
  else {
    for (int i = 0; i < other.getBody().size(); i++) {
      int x = other.getBody().get(i).getX();
      int y = other.getBody().get(i).getY();
      if (map.getSpaces()[x - 1][y] instanceof Spike) {
        death();
        return false;
      }
      else if (map.getSpaces()[x - 1][y] instanceof Block && !(map.getSpaces()[x - 1][y] instanceof Segment)) {
        return false;
      }
    }
  }
  return true;
}

public int checkBody(Snakebird s) {
  int result = 10000;
  //System.out.println("NEW");
  LinkedList<Segment> body = s.getBody();
  for (int i = 0; i < body.size(); i++) {
    Segment current = body.get(i);
    boolean checkingAir = true;
    int count = 0;
    //System.out.println("I: " + i);
    while (checkingAir && current.getY() + count + 1 < map.getSpaces()[0].length) {
      Space next = map.getSpaces()[current.getX()][current.getY() + count + 1];
      if (next instanceof Block) {
        boolean ofBody = false;
        //System.out.println("NEXT:" + next);
        for (int ind = 0; ind < body.size(); ind++) {
          //System.out.println(body.get(i));
          if (next == body.get(ind)) {
            ofBody = true;
          }
        }
        if (!ofBody) {
          checkingAir = false;
        }
        else {
          count++;
        }
      }
      else {
        count++;
      }
      //System.out.println(count);
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
  background(255);
  drawLevel();
  textAlign(CENTER);
  fill(0);
  textSize(120);
  text("You Win!", width/2, 200);
  textSize(30);
  text("Press space to progress to the next level", width/2, 240);
  text("Press R to restart the level.", width/2, 280);
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
  textAlign(CENTER);
  text("Game Over!", width/2, 200);
  textSize(30);
  text("Press R to restart the level.", width/2, 280);
}
