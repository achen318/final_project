Ball[] balls;

void setup() {
  size(1080, 720); // screen size

  balls = new Ball[10];
  for (int i = 0; i < 10; ++i)
    balls[i] = new Ball(i % 2 == 0, new PVector(200 + i * 50, 200  + i * 50));
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

  // dark green: pool table
  fill(2, 113, 72);

  // rounded rectangle: pool table
  rect(width/10, height/10, 0.8*width, 0.8*height, 5);
}

