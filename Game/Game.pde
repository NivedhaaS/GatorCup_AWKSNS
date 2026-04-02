
Menu menu;

void setup() {
  size(800, 600);
  menu = new Menu();
}

void draw() {
  background(200);
    menu.startButton(); // calling function from menu class
}
