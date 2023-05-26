Ball[] balls;
PVector[] pockets;

float tableOffsetX;
float tableOffsetY;
float tableWidth;
float tableHeight;

int ballRadius;

void setup() {
  size(1080, 720); // screen size

  // Initialize constants
  tableOffsetX = 0.1 * width;
  tableOffsetY = 0.1 * height;
  tableWidth = 0.8 * width;
  tableHeight = 0.8 * height;

  ballRadius = 48;

  // Initialize 15 balls
  balls = new Ball[]{
    new Ball(true, new PVector(
      tableOffsetX + 0.75 * tableWidth - 2 * ballRadius,
      tableOffsetY + 0.5 * tableHeight
    )),
    new Ball(true, new PVector(
      tableOffsetX + 0.75 * tableWidth - ballRadius,
      tableOffsetY + 0.5 * tableHeight - 0.5 * ballRadius
    )),
    new Ball(true, new PVector(
      tableOffsetX + 0.75 * tableWidth - ballRadius,
      tableOffsetY + 0.5 * tableHeight + 0.5 * ballRadius
    )),
    new Ball(true, new PVector(
      tableOffsetX + 0.75 * tableWidth,
      tableOffsetY + 0.5 * tableHeight - ballRadius
    )),
    new Ball(true, new PVector(
      tableOffsetX + 0.75 * tableWidth,
      tableOffsetY + 0.5 * tableHeight
    )),
    new Ball(true, new PVector(
      tableOffsetX + 0.75 * tableWidth,
      tableOffsetY + 0.5 * tableHeight + ballRadius
    )),
  };
  //for (int i = 0; i < 10; ++i)
  //  balls[i] = new Ball(i % 2 == 0, new PVector(200 + i * 50, 200  + i * 50));

  // Initialize 6 pockets
  pockets = new PVector[]{
    new PVector( // top left
      tableOffsetX,
      tableOffsetY
    ),
    new PVector( // top middle
      tableOffsetX + tableWidth/2,
      tableOffsetY
    ),
    new PVector( // top right
      tableOffsetX + tableWidth,
      tableOffsetY
    ),
    new PVector( // bottom left
      tableOffsetX,
      tableOffsetY + tableHeight
    ),
    new PVector( // bottom middle
      tableOffsetX + tableWidth/2,
      tableOffsetY + tableHeight
    ),
    new PVector( // bottom right
      tableOffsetX + tableWidth,
      tableOffsetY + tableHeight
    )
  };
}

void draw() {
  drawTable();

  for (Ball ball : balls)
    ball.render();
}

void drawTable() {
  // brown: border of pool table
  stroke(139, 69, 19);
  strokeWeight(32);

  // dark green rounded rectangle: pool table
  fill(2, 113, 72);
  rect(tableOffsetX, tableOffsetY, tableWidth, tableHeight, 5);

  // black circles: pool pocket
  noStroke();
  fill(0);
  for (PVector pos : pockets)
    circle(pos.x, pos.y, ballRadius);
}

