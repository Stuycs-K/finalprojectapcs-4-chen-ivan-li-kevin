public class Block extends Space{
  public Block(int coordX, int coordY){
    super(coordX, coordY);
  }
  //remember: positve moves down and right, negative moves up and left
  public void changeX(int x) {
    setX(getX() + x);
  }
  public void changeY(int y) {
    setY(getY() + y);
  }
}
