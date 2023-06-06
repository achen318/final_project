public class Ball {
  private final int radius = 50;
  private final int speed = 10;

  private PVector pos;
  private PVector vel = new PVector(0, 0);
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

  void setVel(PVector vel) {
    this.vel = vel;
  }
}
