public class Cue {
  private final int stickWidth = 10000;
  private final int stickLength = 250;

  private Ball ball;

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
    PVector stick = PVector.fromAngle(0);
    line(
      ball.getPos().x, ball.getPos().y,
      ball.getPos().x + stickWidth, ball.getPos().y + stickLength
    );
  }
}

