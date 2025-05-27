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
    LinkedList<Segment> playerParts = new LinkedList<Segment>();
    if (level == 1){
      spaces = new Space[15][15];
      for (int i = 3; i < 12; i++){
        spaces[i][10] = new Block(i, 10);
      }
      fruits.add(new Fruit(7,7));
      spaces[7][7] = fruits.get(0);
      goal = new int[]{7,10};
      for (int i = 5; i < 9; i++){
        playerParts.add(new Segment(i, 9));
      }
    }
    player = new Snakebird(playerParts);
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
