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
      for (int i = 0; i < 15; i++){
        blocks.add(new Block(i, 10));
      }
    }
    drawLevel();
  }
  public ArrayList<Block> getBlocks(){
    return blocks;
  }
  public ArrayList<Fruit> getFruit(){
    return fruits;
  }
  
}
