public class Ball {
  public static final int radius = 50;
  public static final float friction = 0.005;

  private PVector pos;
  private PVector vel = new PVector(0, 0);
  private color colr;

  public Ball(PVector pos, color colr) {
    this.pos = pos;
    this.colr = colr;
  }

  void render() {
    update();

    noStroke();
    fill(colr);

    circle(pos.x, pos.y, radius);
  }
 
  void update() {
    pos.add(vel);
    vel.sub(vel.copy().mult(friction));
   }
 
  PVector getPos() {
    return pos;
  }

  PVector getVel() {
    return vel;
  }

  void setVel(PVector vel) {
    this.vel = vel;
  }
}
