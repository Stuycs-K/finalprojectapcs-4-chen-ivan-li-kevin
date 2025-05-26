import java.util.LinkedList;
public class Snakebird {
  LinkedList<Segment> body;
  
  public Snakebird(LinkedList<Segment> segments) {
    body = segments;
  }
  
  public void expand(Segment s) {
    body.addFirst(s);
  }
  
  // 1 = north, 2 = east, 3 = south, 4 = west
  public void move(int direction) {
    body.removeLast();
    int[]og = body.getFirst().getCoord();
    if (direction == 1) {
      body.addFirst(new Segment(og[0], og[1] - 1));
    }
    else if (direction == 2) {
      body.addFirst(new Segment(og[0] + 1, og[1]));
    }
    else if (direction == 3) {
      body.addFirst(new Segment(og[0], og[1] + 1));
    }
    else if (direction == 4) {
      body.addFirst(new Segment(og[0] - 1, og[1]));
    }
    else {
      System.out.println("Move input was not between 1 and 4");
    }
  }
  
  public boolean gravity(int y) {
  }
}
