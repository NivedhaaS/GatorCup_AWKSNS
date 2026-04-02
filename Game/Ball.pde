//Ball starts at the player position. Dragging sets direction and releasing launches it opposite to the drag.
class Ball {
  float x, y;
  float vx, vy;
  boolean dragging;

  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    vx = 0;
    vy = 0;
    dragging = false;
  }

  void display() {
    fill(255);
    ellipse(x, y, 20, 20);
  }

  //updates ball position after release
  void move() {
    if (!dragging) {
      x += vx;
      y += vy;
    }
  }

  void startDrag() {
    dragging = true;
  }

  //ball follows mouse during drag
  void drag() {
    if (dragging) {
      x = mouseX;
      y = mouseY;
    }
  }

  void release(float startX, float startY) {
    dragging = false;
    vx = (startX - x) * 0.2;
    vy = (startY - y) * 0.2;
  }

  //reset ball to start position
  void reset(float startX, float startY) {
    x = startX;
    y = startY;
    vx = 0;
    vy = 0;
  }
}