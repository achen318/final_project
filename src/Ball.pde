public class Ball {
  private final color color1 = color(218, 237, 71); // yellow
  private final color color2 = color(255, 0, 0);    // red

  private boolean player1;
  private PVector pos;

  public Ball(boolean player1, PVector pos) {
    this.player1 = player1;
    this.pos = pos;
  }

  void render() {
    noStroke();

    if (player1) fill(color1);
    else         fill(color2);

    circle(pos.x, pos.y, 50);
  }

  PVector getPos() {
    return pos;
  }

  void setPos(PVector pos) {
    this.pos = pos;
  }
}

