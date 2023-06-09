public class Ball {
  public static final int radius = 48;
  private static final float friction = 0.005;

  PVector pos;
  PVector vel = new PVector(0, 0);
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
    checkBallCollision();
   }

  void checkBorderCollision() {
    // reflect x if x is out of bound
    if (pos.x < borderL || pos.x > borderR)
      vel = new PVector(-vel.x, vel.y);

    // reflect y if y is out of bound
    if (pos.y < borderT || pos.y > borderB)
      vel = new PVector(vel.x, -vel.y);
  }

  void checkBallCollision() {
    for (Ball ball : balls) {
      if (this == ball) continue;

      PVector diff = PVector.sub(ball.pos, pos);

      if (diff.mag() < radius) {
        PVector dir = diff.normalize();
        float impulse = dir.dot(vel) - dir.dot(ball.vel);
        vel.sub(PVector.mult(dir, impulse));
        ball.vel.add(PVector.mult(dir, impulse));
      }
    }
  }
}
