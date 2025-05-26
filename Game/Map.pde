public class Map{
  private Space[][] spaces;
  private int[] goal;
  private Snakebird player;
  public Map(){
    goal = new int[]{0,0}; // backup default;
  }
  public void loadLevel(int level){
    LinkedList<Segment> playerParts = new LinkedList<Segment>();
    if (level == 1){
      spaces = new Space[15][15];
      for (int i = 3; i < 12; i++){
        spaces[i][10] = new Block(i, 10);
      }
      spaces[7][7] = new Fruit(7, 7);
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
}
