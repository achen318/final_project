public class Cue {
  private Ball ball;

  private PVector startPos;
  private PVector endPos;

  private PVector stickAngle;
  private float angle;
  private float strength;

  public Cue(PVector tableOffset, PVector tableDims) {
    ball = new Ball(
      tableOffset.copy().add(tableDims.x/4, tableDims.y/2),
      color(255) // black
    );
  }

  void render() {
    ball.render();

    stroke(232, 175, 100); // tan
    strokeWeight(16); // 16 px thick

    stickAngle = PVector.fromAngle(angle);

    startPos = ball.getPos().copy().add(
      stickAngle.copy().mult(75 + 0.1*strength)); // 75 px away

    endPos = ball.getPos().copy().add(
      stickAngle.copy().mult(300 + 0.1*strength)); // 300 px long

    line(startPos.x, startPos.y, endPos.x, endPos.y);
  }

  void align(int x, int y) {
    PVector sub = new PVector(x, y).sub(ball.getPos());

    angle = sub.heading();
    strength = sub.mag();
  }

  void shoot() {
    startPos.add(stickAngle.mult(10));
    endPos.add(stickAngle.mult(10));

    ball.setVel(stickAngle);
  }
}
