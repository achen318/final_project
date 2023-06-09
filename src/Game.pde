Cue cue;
static Ball[] balls;
static PVector[] pockets;

static PVector tableOffset;
static PVector tableDims;

static PVector cuePos;

static float borderL;
static float borderR;
static float borderT;
static float borderB;

static boolean awaitingMove = true;

void setup() {
  size(1080, 720); // screen size

  // Initialize constants
  tableOffset = new PVector(width, height).mult(0.1);
  tableDims = new PVector(width, height).mult(0.8);

  cuePos = tableOffset.copy().add(tableDims.x/4, tableDims.y/2);

  borderL = tableOffset.x + Ball.radius;
  borderR = tableOffset.x + tableDims.x - Ball.radius;
  borderT = tableOffset.y + Ball.radius;
  borderB = tableOffset.y + tableDims.y - Ball.radius;

  // Initialize cue ball and stick
  cue = new Cue();

  // Initialize 15 balls + 1 cue ball
  balls = new Ball[16];
  int index = 0;

  for (int i = 0; i < 5; ++i) {
    // the x position is held constant for each column
    float x = tableOffset.x + 0.75 * tableDims.x + (i-2) * Ball.radius;
    // this will be the starting y position of the column
    float y = tableOffset.y + 0.5 * tableDims.y - (i/2) * Ball.radius;

    // Adjust starting y position to stagger balls
    if (i % 2 == 1) y -= 0.5 * Ball.radius;

    // Add balls down the column
    for (int j = 0; j <= i; ++j) {
      balls[index] = new ObjectBall(new PVector(x, y), j % 2 == 0);
      ++index;
      y += Ball.radius;
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

  boolean inMotion = false;

  for (Ball ball : balls) {
    ball.render();

    if (ball.vel.mag() > 0.1)
      inMotion = true;
  }

  if (!inMotion)
    awaitingMove = true;

  PVector pos = cue.ball.pos;
  if (awaitingMove && (
    pos.x < borderL || pos.x > borderR ||
    pos.y < borderT || pos.y > borderB) )
    cue.ball.pos = cuePos;

  cue.render(awaitingMove);
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
    circle(pos.x, pos.y, Ball.radius);
}

void mouseMoved() {
  cue.align(mouseX, mouseY);
}

void mouseReleased() {
  if (awaitingMove) {
    cue.shoot();
    awaitingMove = false;
  }
}
