class Menu {
  // load background image for menu
   PImage bg;

  Menu() {
    bg = loadImage("stadiumbg.png"); 
  }

  void drawBackground() {
    image(bg, 0, 0, width, height);
  }

  // function to draw the start button and menu page
  void startButton() {
   
    fill(0, 150, 255);
    rect(300, 250, 200, 80);
    textSize(100);
    textAlign(CENTER, CENTER);
    fill(255);
    text("GatorCup", 402, 152); 
    fill(0);
    text("GatorCup", 400, 150); 
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("START", 400, 290);
  }
}