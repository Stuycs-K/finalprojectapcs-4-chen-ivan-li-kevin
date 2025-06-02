public class Map{
  private Space[][] spaces;
  private int[] goal;
  private boolean goalOpen;
  private Snakebird player;
  private ArrayList<Fruit> fruits;
  public Map(){
    goal = new int[]{0,0}; // backup default;
    goalOpen = false;
    fruits = new ArrayList<Fruit>();
  }
  public void loadLevel(int level){
    fruits = new ArrayList<Fruit>();
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
    }
    if (level == 2){
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
    }
    player = new Snakebird(playerParts);
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
  public Snakebird getPlayer(){
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
