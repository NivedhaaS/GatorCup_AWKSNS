class Menu {
  PImage bg;

  Menu() {
    bg = loadImage("stadiumbg.png");
  }

  void drawBackground() {
    background(0);
    imageMode(CORNER);
    image(bg, 0, 0, width, height);
    rectMode(CORNER);
  }

  void startButton() {
    rectMode(CORNER);
    noStroke();
    fill(0, 150, 255);
    rect(300, 250, 200, 80, 12);

    textSize(100);
    textAlign(CENTER, CENTER);
    fill(255);
    text("GatorCup", 402, 152);
    fill(0);
    text("GatorCup", 400, 150);

    fill(255);
    textSize(24);
    text("START", 400, 290);
  }

  void howToPlayButton() {
    rectMode(CORNER);
    noStroke();
    fill(0, 150, 255);
    rect(300, 350, 200, 80, 12);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("Instructions", 400, 390);
  }

  void instructionsPage() {
    background(0);
    imageMode(CORNER);
    image(bg, 0, 0, width, height);
    rectMode(CORNER);

    noStroke();
    fill(255, 255, 255, 210);
    rect(100, 60, 600, 450, 20);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(36);
    text("Instruction Manual", 400, 100);

    textSize(22);
    fill(0, 150, 255);
    text("How to Play", 400, 140);

    textAlign(LEFT, TOP);
    textSize(22);
    fill(40);
    text("Hello!", 150, 180);
    text("This is a soccer game called GatorCup.", 150, 220);
    text("You must score goals to win.", 150, 255);
    text("To win GatorCup, you must beat all 3 levels", 150, 300);
    text("and score 10 goals per level.", 150, 335);
    text("You only have one minute per level to complete this task.", 150, 380);
    text("The levels will continue to get harder and harder.", 150, 425);
    text("Once you complete Level 3, you will officially be the winner.", 150, 460);
    text("Good luck and have fun!", 150, 490);

    fill(0, 150, 255);
    rect(300, 520, 200, 60, 12);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("Back", 400, 550);
  }
}