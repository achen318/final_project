public class Ball {
  public static final int radius = 48;
  private static final float friction = 0.005;

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
    // move the ball
    pos.add(vel);

    // constrain ball to be in table
    pos = new PVector(
      constrain(pos.x, borderL - 1, borderR + 1),
      constrain(pos.y, borderT - 1, borderB + 1)
    );

    // decrease velocity due to friction
    vel.sub(vel.copy().mult(friction));

    // check for collisions
    checkBorderCollision();
   }

  void checkBorderCollision() {
    // reflect x if x is out of bound
    if (pos.x < borderL || pos.x > borderR)
      vel = new PVector(-vel.x, vel.y);

    // reflect y if y is out of bound
    if (pos.y < borderT || pos.y > borderB)
      vel = new PVector(vel.x, -vel.y);
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
