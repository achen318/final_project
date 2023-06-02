public class Cue {
  private Ball ball;
  private float angle;

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

    PVector stickAngle = PVector.fromAngle(angle);
    angle += 0.1;

    PVector startPos = ball.getPos().copy().add(stickAngle.copy().mult(75)); // 75 px away
    PVector endPos = ball.getPos().copy().add(stickAngle.copy().mult(300)); // 300 px long

    line(startPos.x, startPos.y, endPos.x, endPos.y);
  }
}
