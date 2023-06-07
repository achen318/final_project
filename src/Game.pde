Cue cue;
Ball[] balls;
PVector[] pockets;

PVector tableOffset;
PVector tableDims;

int ballRadius;

void setup() {
  size(1080, 720); // screen size

  // Initialize constants
  tableOffset = new PVector(width, height).mult(0.1);
  tableDims = new PVector(width, height).mult(0.8);
  ballRadius = 48;

  // Initialize cue ball and stick
  cue = new Cue(tableOffset, tableDims);

  // Initialize 15 balls
  balls = new Ball[16];
  int index = 0;

  for (int i = 0; i < 5; ++i) {
    // the x position is held constant for each column
    float x = tableOffset.x + 0.75 * tableDims.x + (i-2) * ballRadius;
    // this will be the starting y position of the column
    float y = tableOffset.y + 0.5 * tableDims.y - (i/2) * ballRadius;

    // Adjust starting y position to stagger balls
    if (i % 2 == 1) y -= 0.5 * ballRadius;

    // Add balls down the column
    for (int j = 0; j <= i; ++j) {
      balls[index] = new ObjectBall(new PVector(x, y), j % 2 == 0);
      ++index;
      y += ballRadius;
    }
  }

  balls[index] = cue.ball;

  // Initialize 6 pockets
  pockets = new PVector[]{
    tableOffset.copy(),                                 // top left
    tableOffset.copy().add(tableDims.x/2, 0),           // top middle
    tableOffset.copy().add(tableDims.x, 0),             // top right
    tableOffset.copy().add(0, tableDims.y),             // bottom left
    tableOffset.copy().add(tableDims.x/2, tableDims.y), // bottom middle
    tableOffset.copy().add(tableDims)                   // bottom right
  };
}

void draw() {
  background(69, 138, 247);
  drawTable();

  for (Ball ball : balls) {
    ball.render();

    PVector ballPos = ball.getPos();
    PVector ballVel = ball.getVel();

    // reflect x if x is out of bound
    if (ballPos.x < tableOffset.x + Ball.radius ||
        ballPos.x > tableOffset.x + tableDims.x - Ball.radius )
      ball.setVel(new PVector(-ballVel.x, ballVel.y));

    // reflect y if y is out of bound
    if (ballPos.y < tableOffset.y + Ball.radius ||
        ballPos.y > tableOffset.y + tableDims.y - Ball.radius 
        )
      ball.setVel(new PVector(ballVel.x, -ballVel.y));
  }

  cue.render();
}

void drawTable() {
  // brown: border of pool table
  stroke(139, 69, 19);
  strokeWeight(32);

  // dark green rounded rectangle: pool table
  fill(2, 113, 72);
  rect(tableOffset.x, tableOffset.y, tableDims.x, tableDims.y, 5);

  // black circles: pool pocket
  noStroke();
  fill(0);
  for (PVector pos : pockets)
    circle(pos.x, pos.y, ballRadius);
}

void mouseMoved() {
  cue.align(mouseX, mouseY);
}

void mouseReleased() {
  cue.shoot();
}
