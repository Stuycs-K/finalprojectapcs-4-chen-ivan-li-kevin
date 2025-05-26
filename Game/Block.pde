public class Block extends Space{
  public Block(int coordX, int coordY){
    super(coordX, coordY);
  }
  
  //remember: positve moves down and right, negative moves up and left
  public void changeX(int x) {
    xcor = xcor + x;
  }
  public void changeY(int y) {
    ycor =  ycor + y;
  }
}
