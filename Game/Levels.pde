class Levels {
  Ball level1Ball;

  // goal rectangle
  float goalX = 680;
  float goalY = 220;
  float goalW = 70;
  float goalH = 160;

  boolean level1GoalScored = false;
  int goalMessageStartTime = 0;

  Levels() {
    level1Ball = new Ball(140, 300);
  }

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
    background(70, 180, 90);

    drawField();
    drawGoal();

    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Level 1", 400, 40);

    level1Ball.update();
    level1Ball.display();
    level1Ball.showAimLine();

    checkLevel1Goal();
    checkOutOfBounds();

    // restart level button
    fill(0, 150, 255);
    rect(50, 520, 200, 50);
    fill(255);
    textSize(20);
    text("Restart Level", 150, 545);

    // restart game button
    fill(0, 150, 255);
    rect(550, 520, 200, 50);
    fill(255);
    text("Restart Game", 650, 545);

    // show GOAL only for 3 seconds
    if (level1GoalScored && millis() - goalMessageStartTime < 3000) {
      fill(255, 255, 0);
      textSize(30);
      text("GOAL!", 400, 90);
    }

    // after 3 seconds, hide the message
    if (level1GoalScored && millis() - goalMessageStartTime >= 3000) {
      level1GoalScored = false;
    }
  }

  void drawField() {
    stroke(255);
    strokeWeight(4);
    noFill();
    rect(30, 80, 740, 410);

    line(400, 80, 400, 490);

    noStroke();
    fill(255, 255, 255, 60);
    ellipse(140, 300, 110, 110);
  }

  void drawGoal() {
    fill(230);
    stroke(255);
    strokeWeight(3);
    rect(goalX, goalY, goalW, goalH);

    fill(0);
    textSize(18);
    textAlign(CENTER, CENTER);
    text("GOAL", goalX + goalW/2, goalY - 20);
  }

  void checkLevel1Goal() {
    if (!level1GoalScored &&
      level1Ball.x > goalX &&
      level1Ball.x < goalX + goalW &&
      level1Ball.y > goalY &&
      level1Ball.y < goalY + goalH) {

      goals_scored++;
      level1GoalScored = true;
      goalMessageStartTime = millis();

      level1Ball.reset();
    }
  }

  void checkOutOfBounds() {
    float border = 5;

    // left, top, bottom invisible border
    if (level1Ball.x < border || level1Ball.y < border || level1Ball.y > height - border) {
      level1Ball.reset();
    }

    // right side:
    // if ball is NOT inside goal opening and passes the right border, then reset
    boolean ballWithinGoalHeight =
      level1Ball.y > goalY &&
      level1Ball.y < goalY + goalH;

    if (level1Ball.x > width - border && !ballWithinGoalHeight) {
      level1Ball.reset();
    }

    // if ball goes past the goal completely, then reset
    if (level1Ball.x > goalX + goalW + 5) {
      level1Ball.reset();
    }
  }

  void startLevel1Drag() {
    if (level1Ball.isMouseOverBall()) {
      level1Ball.startDrag();
    }
  }

  void releaseLevel1Drag() {
    level1Ball.release();
  }

  void resetLevel1() {
    level1Ball.reset();
    level1GoalScored = false;
    goalMessageStartTime = 0;
  }
}