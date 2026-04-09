class Ball {
  float x, y;
  float startX, startY;
  float vx, vy;
  float radius;

  boolean dragging;
  boolean moving;

  PImage soccerImg;

  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.startX = x;
    this.startY = y;

    vx = 0;
    vy = 0;

    radius = 30;
    dragging = false;
    moving = false;

    soccerImg = loadImage("soccerBall.png");
  }

  void display() {
    imageMode(CENTER);
    image(soccerImg, x, y, radius * 2, radius * 2);
    imageMode(CORNER);
  }

  void update() {
    if (moving && !dragging) {
      x += vx;
      y += vy;

      vx *= 0.98;
      vy *= 0.98;

      if (abs(vx) < 0.15 && abs(vy) < 0.15) {
        vx = 0;
        vy = 0;
        moving = false;
      }
    }
  }

  boolean isMouseOverBall() {
    return dist(mouseX, mouseY, x, y) <= radius;
  }

  void startDrag() {
    if (!moving) {
      dragging = true;
    }
  }

  void showAimLine() {
    if (dragging) {
      stroke(255, 0, 0);
      strokeWeight(4);
      line(x, y, mouseX, mouseY);

      fill(255, 0, 0);
      noStroke();
      ellipse(mouseX, mouseY, 12, 12);
    }
  }

  void release() {
    if (dragging) {
      dragging = false;
      vx = (x - mouseX) * 0.18;
      vy = (y - mouseY) * 0.18;
      moving = true;
    }
  }

  void reset() {
    x = startX;
    y = startY;
    vx = 0;
    vy = 0;
    dragging = false;
    moving = false;
  }
}