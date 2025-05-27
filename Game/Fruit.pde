public class Fruit extends Block{
  private boolean isCollected;
  public Fruit(int xcor, int ycor){
    super(xcor, ycor);
    isCollected = false;
  }
  public boolean status(){
    return isCollected;
  }
  public void collect(){
    isCollected = true;
  }
}
