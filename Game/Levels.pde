class Levels {
  void all_levels() {
    background(0, 150, 255);

    fill(0);
    textSize(40);
    textAlign(CENTER, CENTER);
    
    text("Level 1", 400, 100);
    text("Level 2 (Locked)", 400, 300);
    text("Level 3 (Locked)", 400, 500);
  }

  void level_1() {
    background(255);
    
    fill(0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Level 1", 400, 50);

    //restart level button
    fill(0, 150, 255);
    rect(50, 520, 200, 50);
    fill(255);
    textSize(20);
    text("Restart Level", 150, 545);

    //restart game button
    fill(0, 150, 255);
    rect(550, 520, 200, 50);
    fill(255);
    text("Restart Game", 650, 545);
  }
}