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
    goalOpen = false;
    LinkedList<Segment> playerParts = new LinkedList<Segment>();
    fruits = new ArrayList<Fruit>();
    if (level == 1){
      spaces = new Space[20][15];
      for (int i = 5; i < 15; i++){
        spaces[i][10] = new Block(i, 10);
      }
      addFruit(9,6);
      goal = new int[]{12,5};
      spaces[4][9] = new Spike(4,9);
      for (int i = 8; i < 12; i++){
        playerParts.add(new Segment(i, 9));
      }
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
