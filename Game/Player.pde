//Starting position of the player can move up and down. Ball will start from here drag and release style.
class Player {
  float x;
  float y;
  float speed;

  Player(float x, float y) {
    this.x = x;
    this.y = y;
    speed = 5; //temp speed value can be changed later
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, 40, 40);
  }

  //allows player to move only up and down to adjust shot position
  void move() {
    if (keyPressed) {
      if (keyCode == UP) {
        y -= speed;
      }
      if (keyCode == DOWN) {
        y += speed;
      }
    }
  }
}