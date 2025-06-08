public class Map{
  private Space[][] spaces;
  private int[] goal;
  private boolean goalOpen;
  private ArrayList<Snakebird> player;
  private ArrayList<Fruit> fruits;
  public Map(){
    goal = new int[]{0,0}; // backup default;
    goalOpen = false;
    player = new ArrayList<Snakebird>();
    fruits = new ArrayList<Fruit>();
  }
  public boolean loadLevel(int level){
    fruits = new ArrayList<Fruit>();
    player = new ArrayList<Snakebird>();
    goalOpen = false;
    LinkedList<Segment> playerParts = new LinkedList<Segment>();
    fruits = new ArrayList<Fruit>();
    if (level == 1){
      spaces = new Space[20][15];
      for (int i = 7; i < 11; i++){
        spaces[i][10] = new Block(i, 10);
        spaces[i][11] = new Block(i, 11);
      }
      spaces[7][9] = new Block(7, 9);
      spaces[6][6] = new Block(6, 6);
      spaces[9][7] = new Block(9, 7);
      spaces[11][7] = new Block(11, 7);
      addFruit(10,7);
      addFruit(6,7);
      goal = new int[]{9,3};
      for (int i = 9; i > 7; i--){
        playerParts.add(new Segment(i, 9));
      }
      player.add(new Snakebird(playerParts));
      player.get(0).direction = 2;
    }
    else if (level == 2){
      spaces = new Space[20][15];
      for (int i = 5; i < 15; i++){
        spaces[i][13] = new Block(i, 13);
        spaces[i][12] = new Block(i, 12);
      }
      for (int i = 5; i < 8; i++){
        spaces[i][11] = new Block(i, 11);
      }
      for (int i = 10; i < 15; i++){
        spaces[i][11] = new Block(i, 11);
      }
      for (int i = 6; i < 8; i++){
        spaces[i][10] = new Block(i, 10);
        spaces[i][9] = new Block(i, 9);
        spaces[i][8] = new Block(i, 8);
      }
      for (int i = 8; i < 10; i++){
        spaces[i][8] = new Block(i, 8);
        spaces[i][7] = new Block(i, 7);
        spaces[i][6] = new Block(i, 6);
        spaces[i][5] = new Block(i, 5);
      }
      for (int i = 6; i < 10; i++){
        spaces[10][i] = new Block(10, i);
      }
      spaces[7][7] = new Block(7, 7);
      addFruit(9,9);
      addFruit(16,10);
      goal = new int[]{13,7};
      playerParts.add(new Segment(13, 10));
      playerParts.add(new Segment(14, 10));
      playerParts.add(new Segment(14, 9));
      player.add(new Snakebird(playerParts));
      player.get(0).direction = 4;
    }
    else if (level == 3){
      spaces = new Space[20][15];
      spaces[7][13] = new Block(7, 13);
      spaces[12][13] = new Block(12, 13);
      spaces[13][13] = new Block(13, 13);
      for (int i = 6; i < 14; i++){
        spaces[i][12] = new Block(i, 12);
        spaces[i][11] = new Block(i, 11);
      }
      for (int i = 9; i < 14; i++){ 
        spaces[i][10] = new Block(i, 10);
      }
      spaces[8][10] = new Spike(8, 10);
      spaces[8][9] = new Spike(8, 9);
      addFruit(7,8);
      addFruit(12,8);
      goal = new int[]{10,6};
      playerParts.add(new Segment(7, 7));
      playerParts.add(new Segment(6, 7));
      playerParts.add(new Segment(6, 8));
      player.add(new Snakebird(playerParts));
      player.get(0).direction = 2;
    }
    else if (level == 4){ 
      spaces = new Space[20][15];
      for (int i = 10; i < 12; i++){ 
        spaces[i][13] = new Block(i, 13);
      }
      spaces[11][12] = new Block(11, 12);
      spaces[9][10] = new Block(9, 10);
      spaces[6][8] = new Block(6, 8);
      spaces[12][8] = new Block(12, 8);
      spaces[9][6] = new Block(9, 6);
      for (int i = 8; i < 11; i++){ 
        spaces[7][i] = new Spike(7, i);
      }
      spaces[8][10] = new Spike(8, 10);
      spaces[10][10] = new Spike(10, 10);
      spaces[11][8] = new Spike(11, 8);
      addFruit(9,11);
      goal = new int[]{12,5};
      for (int i = 10; i > 7; i--){
        playerParts.add(new Segment(i, 5));
      }
      playerParts.add(new Segment(8, 6));
      player.add(new Snakebird(playerParts));
      player.get(0).direction = 2;
    }
    else if (level == 5){
      goalOpen = true;
      spaces = new Space[20][15];
      for (int i = 10; i < 14; i++) {
        spaces[i][13] = new Block(i , 13);
      }
      spaces[7][12] = new Block(7, 12);
      spaces[7][11] = new Block(7, 11);
      for (int i = 11; i > 8; i--) {
        spaces[4][i] = new Block(4, i);
      }
      spaces[7][7] = new Block(7, 7);
      goal = new int[]{10,5};
      for (int i = 10; i < 13; i++){
        playerParts.add(new Segment(i, 12));
      }
      player.add(new Snakebird(playerParts));
      playerParts = new LinkedList<Segment>();
      for (int i = 11; i < 14; i++){
        Segment s = new Segment(i, 11);
        playerParts.add(s);
        spaces[i][11] = s;
      }
      Segment s = new Segment(13, 12);
      playerParts.add(s);
      spaces[13][12] = s;
      player.add(new Snakebird(playerParts));
      player.get(0).direction = 4;
      player.get(1).direction = 4;
    }
    else if (level == 6){ 
      goalOpen = true;
      spaces = new Space[20][15];
      for (int i = 8; i < 15; i++) {
        spaces[14][i] = new Block(14, i);
      }
      for (int i = 9; i < 15; i++) {
        spaces[12][i] = new Block(12, i);
      }
      for (int i = 10; i < 15; i++) {
        spaces[8][i] = new Block(8, i);
      }
      spaces[14][6] = new Spike(14, 6);
      goal = new int[]{7,7};
      Segment s = new Segment(12, 8);
      playerParts.add(s);
      spaces[12][8] = s;
      s = new Segment(11, 8);
      playerParts.add(s);
      spaces[11][8] = s;
      s = new Segment(11, 9);
      playerParts.add(s);
      spaces[11][9] = s;
      player.add(new Snakebird(playerParts));
      playerParts = new LinkedList<Segment>();
      s = new Segment(12, 7);
      playerParts.add(s);
      spaces[12][7] = s;
      s = new Segment(11, 7);
      playerParts.add(s);
      spaces[11][7] = s;
      player.add(new Snakebird(playerParts));
      player.get(0).direction = 2;
      player.get(1).direction = 2;
    }
    else if (level == 7){ 
      spaces = new Space[20][15];
      for (int i = 11; i < 15; i++) {
        spaces[6][i] = new Block(6, i);
        spaces[7][i] = new Block(7, i);
        spaces[15][i] = new Block(15, i);
        spaces[16][i] = new Block(16, i);
      }
      for (int i = 13; i < 15; i++) {
        spaces[8][i] = new Block(8, i);
        spaces[12][i] = new Block(12, i);
      }
      spaces[9][13] = new Block(9, 13);
      spaces[11][11] = new Block(11, 11);
      spaces[13][11] = new Block(13, 11);
      spaces[14][11] = new Block(14, 11);
      spaces[13][9] = new Block(13, 9);
      spaces[16][9] = new Block(16, 9);
      spaces[16][10] = new Block(16, 10);
      for (int i = 5; i < 9; i++) {
        spaces[13][i] = new Block(13, i);
        spaces[14][i] = new Block(14, i);
        spaces[15][i] = new Block(15, i);
        spaces[16][i] = new Block(16, i);
      }
      spaces[8][12] = new Spike(8, 12);
      addFruit(12,10);
      addFruit(14,9);
      for (int i = 7; i > 5; i--){
        Segment s = new Segment(i, 10);
        playerParts.add(s);
        spaces[i][10] = s;
      }
      player.add(new Snakebird(playerParts));
      playerParts = new LinkedList<Segment>();
      for (int i = 7; i > 5; i--){
        Segment s = new Segment(i, 9);
        playerParts.add(s);
        spaces[i][9] = s;
      }
      player.add(new Snakebird(playerParts));
      player.get(0).direction = 2;
      player.get(1).direction = 2;
    }
    else{
      background(255);
      textSize(60);
      fill(0);
      text("end", width/2-400, 200);
      return false;
    }
    return true;
    
  }
  private void addFruit(int x, int y){ // convenience
    fruits.add(new Fruit(x, y));
    spaces[x][y] = fruits.get(fruits.size()-1);
  }
  public Space[][] getSpaces(){
    return spaces;
  }
  public int[] getGoal(){
    return goal;
  }
  public Snakebird getPlayer(int i){
    return player.get(i);
  }
  public ArrayList<Snakebird> getPlayers(){
    return player;
  }
  public void checkFruit(){
    //System.out.println(fruits.size());
    for (int i = 0; i < fruits.size(); i++){
      if (fruits.get(i).isCollected){
        spaces[fruits.get(i).getX()][fruits.get(i).getY()] = null;
        fruits.remove(i);
        i--;
      }
    }
    if (fruits.size() == 0){
      goalOpen = true;
    }
  }
  public boolean opened(){
    return goalOpen;
  }
}
