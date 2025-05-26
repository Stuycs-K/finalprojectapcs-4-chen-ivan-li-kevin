public class Space{
  private int xcor, ycor;
  public Space(int coordX, int coordY){
    xcor = coordX;
    ycor = coordY;
  }
  public int[] getCoord(){
    return new int[]{xcor, ycor};
  }
  public int getX(){
    return xcor;
  }
  public int getY(){
    return ycor;
  }
}
