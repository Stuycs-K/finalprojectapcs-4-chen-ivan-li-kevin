import java.util.LinkedList;
public class Snakebird {
  private LinkedList<Segment> body;
  public color color1, color2;
  int direction;
  
  public Snakebird(LinkedList<Segment> segments, color first, color second){
    body = segments;
    color1 = first;
    color2 = second;
  }
  
  public void expand(Segment s) {
    body.addFirst(s);
  }
  
  // 1 = north, 2 = east, 3 = south, 4 = west
  public void move(int direction) {
    body.removeLast();
    if (direction == 1) {
      body.addFirst(new Segment(body.getFirst().getX(), body.getFirst().getY() - 1));
    }
    else if (direction == 2) {
      body.addFirst(new Segment(body.getFirst().getX() + 1, body.getFirst().getY()));
    }
    else if (direction == 3) {
      body.addFirst(new Segment(body.getFirst().getX(), body.getFirst().getY() + 1));
    }
    else if (direction == 4) {
      body.addFirst(new Segment(body.getFirst().getX() - 1, body.getFirst().getY()));
    }
    else {
      System.out.println("Move input was not between 1 and 4");
    }
  }
  
  //just moves everything down
  //return true when lands on a spike or void
  public boolean gravity(int y, Map m) {
    try {
      boolean firstCheck = true;
      boolean result = false;
      Space[][] map = m.getSpaces();
      for (int i = 0; i < body.size(); i++) {
        body.get(i).changeY(y);
        if (map[body.get(i).getX()][body.get(i).getY() + 1] instanceof Spike) {
          result = true;
        }
        if (!(map[body.get(i).getX()][body.get(i).getY() + 1] instanceof Spike) && !(map[body.get(i).getX()][body.get(i).getY() + 1] instanceof Segment) && (map[body.get(i).getX()][body.get(i).getY() + 1] instanceof Block)) {
          firstCheck = false;
        }
      }
      return firstCheck && result;
    }
    catch(IndexOutOfBoundsException e) {
      return true;
    }
  }
  
  public Segment getFront() {
    return body.getFirst();
  }
  public LinkedList<Segment> getBody() {
    return body;
  }
}
