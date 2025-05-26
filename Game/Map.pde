public class Map{
  private ArrayList<Block> blocks;
  private ArrayList<Fruit> fruits;
  private int[] goal;
  public Map(){
    blocks = new ArrayList<Block>();
    fruits = new ArrayList<Fruit>();
    goal = new int[]{0,0}; // backup default;
  }
  public void loadLevel(int level){
    if (level == 1){
      for (int i = 3; i < 12; i++){
        blocks.add(new Block(i, 10));
      }
      fruits.add(new Fruit(7, 7));
      goal = new int[]{7,10};
    }
    drawLevel();
  }
  public ArrayList<Block> getBlocks(){
    return blocks;
  }
  public ArrayList<Fruit> getFruit(){
    return fruits;
  }
  public int[] getGoal(){
    return goal;
  }
}
