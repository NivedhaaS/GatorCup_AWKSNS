

class Menu {
  // function to draw the start button and menu page
  void startButton() {
    fill(0, 150, 255);
    rect(300, 250, 200, 80);
     textSize(40);
    text("GatorCup", 400, 100);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("START", 400, 290);
  }
}

class Levels {
  
  // function to show the different levels that you must complete
  void all_levels() {
    background(0, 150, 255);
    textSize(40);
    fill(0);
    text("Level 1", 400, 100);
    text("Level 2", 400, 300);
     text("Level 3", 400, 500);
  }
  
  // level 1
  void level_1() {
    background(255);
    textSize(40);
    fill(0);
    text("Level 1 ", 400, 50);

  }
}
