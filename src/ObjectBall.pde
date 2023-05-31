public class ObjectBall extends Ball {
  private boolean player1;

  public ObjectBall(PVector pos, boolean player1) {
    super(pos, player1 ? 
      color(218, 237, 71) : // yellow
      color(255, 0, 0)      // red
    );
  }

  boolean isPlayer1() {
    return player1;
  }
}

