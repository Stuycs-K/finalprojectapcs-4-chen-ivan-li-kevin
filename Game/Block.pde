public class Block{
  private int xcor, ycor;
  public Block(int coordX, int coordY){
    xcor = coordX;
    ycor = coordY;
  }
  public int[] getCoord(){
    return new int[]{xcor, ycor};
  }
  public boolean checkCollision(Block other){
    return (xcor == other.xcor) && (ycor == other.ycor);
  }
}
