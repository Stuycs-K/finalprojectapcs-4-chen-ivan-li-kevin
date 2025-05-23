import java.util.LinkedList;
public class Snakebird {
  LinkedList<Segment> body;
  public Snakebird(LinkedList<Segment> segments) {
    body = segments;
  }
  public void expand(Segment s) {
    body.addFirst(s);
  }
}
