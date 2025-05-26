public class Map{
  private Space[][] spaces;
  private int[] goal;
  public Map(){
    goal = new int[]{0,0}; // backup default;
  }
  public void loadLevel(int level){
    if (level == 1){
      spaces = new Space[15][15];
      for (int i = 3; i < 12; i++){
        spaces[i][10] = new Block(i, 10);
      }
      spaces[7][7] = new Fruit(7, 7);
      goal = new int[]{7,10};
    }
    drawLevel();
  }
  public Space[][] getSpaces(){
    return spaces;
  }
  public int[] getGoal(){
    return goal;
  }
}
