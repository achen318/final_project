public class Ball {
  private final int radius = 50;
  private PVector pos;
  private color colr;

  public Ball(PVector pos, color colr) {
    this.pos = pos;
    this.colr = colr;
  }

  void render() {
    noStroke();
    fill(colr);

    circle(pos.x, pos.y, radius);
  }
 
  PVector getPos() {
    return pos;
  }

  void setPos(PVector pos) {
    this.pos = pos;
  }
}
