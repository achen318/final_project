public class Cue {
  private Ball ball;

  private PVector startPos;
  private PVector endPos;

  private PVector stickAngle;
  private float angle;
  private float strength;

  public Cue() {
    ball = new Ball(
      tableOffset.copy().add(tableDims.x/4, tableDims.y/2),
      color(255) // black
    );
  }

  void render(boolean showStick) {
    ball.render();

    stickAngle = PVector.fromAngle(angle);

    startPos = PVector.add(ball.pos,
      PVector.mult(stickAngle, 75 + 0.1*strength)); // 75 px away

    endPos = PVector.add(ball.pos,
      PVector.mult(stickAngle, 300 + 0.1*strength)); // 300 px long

    if (showStick)
      renderStick();
  }

  void renderStick() {
    stroke(232, 175, 100); // tan
    strokeWeight(16); // 16 px thick

    line(startPos.x, startPos.y, endPos.x, endPos.y);
  }

  void align(int x, int y) {
    PVector sub = new PVector(x, y).sub(ball.pos);

    angle = sub.heading();
    strength = sub.mag();
  }

  void shoot() {
    startPos.add(stickAngle.mult(-3));
    endPos.add(stickAngle.mult(-3));

    ball.vel = stickAngle;
  }
}
