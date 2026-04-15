class Levels {
  Ball level1Ball;
  Ball level2Ball;
  Ball level3Ball;
  PImage trophyImg;

  // Goal
  float goalX = 680;
  float goalY = 220;
  float goalW = 70;
  float goalH = 160;
  
  float goal_speed = 4;
  int goal_moving = 1;

  // obstacle for level 3
  float blockX = 560;
  float blockY = 270;
  float blockW = 35;
  float blockH = 90;
  float blockSpeed = 3;
  int blockMoving = 1;

  boolean level1GoalScored = false;
  boolean level2GoalScored = false;
  boolean level3GoalScored = false;

  int goalMessageStartTime = 0;
  
  // moves the goal up and down in level 2 and 3
  void GoalMoving() {
    goalY += goal_speed * goal_moving;
    
    if (goalY <= 80) {
      goalY = 80;
      goal_moving = 1;
    }
    
    if (goalY + goalH >= 490) {
      goalY = 490 - goalH;
      goal_moving = -1;
    }
  }

  // moves the blocker up and down in level 3
  void blockMoving() {
    blockY += blockSpeed * blockMoving;
    
    if (blockY <= 100) {
      blockY = 100;
      blockMoving = 1;
    }
    
    if (blockY + blockH >= 470) {
      blockY = 470 - blockH;
      blockMoving = -1;
    }
  }

  // initializes the balls and loads the trophy image
  Levels() {
    level1Ball = new Ball(140, 300);
    level2Ball = new Ball(140, 300);
    level3Ball = new Ball(140, 300);
    trophyImg = loadImage("trophy.png");
  }

  // draws the level selection screen
  void all_levels() {
    background(0, 150, 255);
    textAlign(CENTER, CENTER);

    fill(255);
    textSize(42);
    text("Choose a Level", 400, 60);

    // Level 1
    fill(255);
    rect(250, 140, 300, 100, 16);
    fill(0);
    textSize(36);
    text("Level 1", 400, 190);

    // Level 2
    if (level2Unlocked) {
      fill(255);
    } else {
      fill(220);
    }
    rect(250, 270, 300, 100, 16);
    fill(0);
    textSize(36);
    text("Level 2", 400, 320);

    // Level 3
    if (level3Unlocked) {
      fill(255);
    } else {
      fill(220);
    }
    rect(250, 400, 300, 100, 16);
    fill(0);
    textSize(36);
    text("Level 3", 400, 450);
  }

  // draws level 1 with the ball, goal, and field
  void level_1() {
    background(70, 180, 90);
    drawField();
    drawGoal();

    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Level 1", 400, 40);

    if (!timer.is_finished() && goals_scored < goal_target) {
      level1Ball.update();
      checkLevel1Goal();
      checkOutOfBoundsLevel1();
    }

    level1Ball.display();
    level1Ball.showAimLine();
    drawLevelButtons();

    if (level1GoalScored && millis() - goalMessageStartTime < 1500) {
      fill(255, 255, 0);
      textSize(30);
      text("GOAL!", 400, 90);
    }

    if (level1GoalScored && millis() - goalMessageStartTime >= 1500) {
      level1GoalScored = false;
    }
  }

  // draws level 2 with a moving goal
  void level_2() {
    background(70, 180, 90);
    drawField();
    drawGoal();

    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Level 2", 400, 40);

    if (!timer.is_finished() && goals_scored < goal_target) {
      GoalMoving();
      level2Ball.update();
      checkLevel2Goal();
      checkOutOfBoundsLevel2();
    }

    level2Ball.display();
    level2Ball.showAimLine();
    drawLevelButtons();

    if (level2GoalScored && millis() - goalMessageStartTime < 1500) {
      fill(255, 255, 0);
      textSize(30);
      text("GOAL!", 400, 90);
    }

    if (level2GoalScored && millis() - goalMessageStartTime >= 1500) {
      level2GoalScored = false;
    }
  }

  // draws level 3 with a moving goal and blocker
  void level_3() {
    background(70, 180, 90);
    drawField();
    drawGoal();
    drawBlocker();

    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Level 3", 400, 40);

    if (!timer.is_finished() && goals_scored < goal_target) {
      GoalMoving();
      blockMoving();
      level3Ball.update();
      checkLevel3Blocker();
      checkLevel3Goal();
      checkOutOfBoundsLevel3();
    }

    level3Ball.display();
    level3Ball.showAimLine();
    drawLevelButtons();

    if (level3GoalScored && millis() - goalMessageStartTime < 1500) {
      fill(255, 255, 0);
      textSize(30);
      text("GOAL!", 400, 90);
    }

    if (level3GoalScored && millis() - goalMessageStartTime >= 1500) {
      level3GoalScored = false;
    }
  }

  // draws the restart buttons on each level screen
  void drawLevelButtons() {
    fill(0, 150, 255);
    rect(50, 520, 200, 50, 12);
    fill(255);
    textSize(20);
    text("Restart Level", 150, 545);

    fill(0, 150, 255);
    rect(550, 520, 200, 50, 12);
    fill(255);
    text("Restart Game", 650, 545);
  }

  // draws the soccer field
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

  // draws the goal
  void drawGoal() {
    fill(230);
    stroke(255);
    strokeWeight(3);
    rect(goalX, goalY, goalW, goalH);

    fill(0);
    textSize(18);
    textAlign(CENTER, CENTER);
    text("GOAL", goalX + goalW / 2, goalY - 20);
  }

  // draws the blocker for level 3
  void drawBlocker() {
    fill(255, 120, 0);
    stroke(255);
    strokeWeight(3);
    rect(blockX, blockY, blockW, blockH);
  }

  // checks if the ball enters the goal in level 1
  void checkLevel1Goal() {
    boolean ballInGoal =
      level1Ball.x + level1Ball.radius > goalX &&
      level1Ball.x - level1Ball.radius < goalX + goalW &&
      level1Ball.y + level1Ball.radius > goalY &&
      level1Ball.y - level1Ball.radius < goalY + goalH;

    if (ballInGoal) {
      goals_scored++;
      level1GoalScored = true;
      goalMessageStartTime = millis();
      level1Ball.reset();
    }
  }

  // checks if the ball enters the goal in level 2
  void checkLevel2Goal() {
    boolean ballInGoal =
      level2Ball.x + level2Ball.radius > goalX &&
      level2Ball.x - level2Ball.radius < goalX + goalW &&
      level2Ball.y + level2Ball.radius > goalY &&
      level2Ball.y - level2Ball.radius < goalY + goalH;

    if (ballInGoal) {
      goals_scored++;
      level2GoalScored = true;
      goalMessageStartTime = millis();
      level2Ball.reset();
      goal_speed = random(2, 8);
    }
  }

  // checks if the ball enters the goal in level 3
  void checkLevel3Goal() {
    boolean ballInGoal =
      level3Ball.x + level3Ball.radius > goalX &&
      level3Ball.x - level3Ball.radius < goalX + goalW &&
      level3Ball.y + level3Ball.radius > goalY &&
      level3Ball.y - level3Ball.radius < goalY + goalH;

    if (ballInGoal) {
      goals_scored++;
      level3GoalScored = true;
      goalMessageStartTime = millis();
      level3Ball.reset();
    }
  }

  // checks if the level 3 ball hits the blocker
  void checkLevel3Blocker() {
    boolean ballHitsBlocker =
      level3Ball.x + level3Ball.radius > blockX &&
      level3Ball.x - level3Ball.radius < blockX + blockW &&
      level3Ball.y + level3Ball.radius > blockY &&
      level3Ball.y - level3Ball.radius < blockY + blockH;

    if (ballHitsBlocker) {
      level3Ball.reset();
    }
  }

  // checks if the ball goes out of bounds in level 1
  void checkOutOfBoundsLevel1() {
    float fieldLeft = 30;
    float fieldTop = 80;
    float fieldRight = 770;
    float fieldBottom = 490;

    boolean ballWithinGoalHeight =
      level1Ball.y > goalY &&
      level1Ball.y < goalY + goalH;

    if (level1Ball.x - level1Ball.radius < fieldLeft) {
      level1Ball.reset();
      return;
    }

    if (level1Ball.y - level1Ball.radius < fieldTop) {
      level1Ball.reset();
      return;
    }

    if (level1Ball.y + level1Ball.radius > fieldBottom) {
      level1Ball.reset();
      return;
    }

    if (level1Ball.x + level1Ball.radius > fieldRight && !ballWithinGoalHeight) {
      level1Ball.reset();
      return;
    }

    if (level1Ball.x - level1Ball.radius > goalX + goalW) {
      level1Ball.reset();
    }
  }

  // checks if the ball goes out of bounds in level 2
  void checkOutOfBoundsLevel2() {
    float fieldLeft = 30;
    float fieldTop = 80;
    float fieldRight = 770;
    float fieldBottom = 490;

    boolean ballWithinGoalHeight =
      level2Ball.y > goalY &&
      level2Ball.y < goalY + goalH;

    if (level2Ball.x - level2Ball.radius < fieldLeft) {
      level2Ball.reset();
      return;
    }

    if (level2Ball.y - level2Ball.radius < fieldTop) {
      level2Ball.reset();
      return;
    }

    if (level2Ball.y + level2Ball.radius > fieldBottom) {
      level2Ball.reset();
      return;
    }

    if (level2Ball.x + level2Ball.radius > fieldRight && !ballWithinGoalHeight) {
      level2Ball.reset();
      return;
    }

    if (level2Ball.x - level2Ball.radius > goalX + goalW) {
      level2Ball.reset();
    }
  }

  // checks if the ball goes out of bounds in level 3
  void checkOutOfBoundsLevel3() {
    float fieldLeft = 30;
    float fieldTop = 80;
    float fieldRight = 770;
    float fieldBottom = 490;

    boolean ballWithinGoalHeight =
      level3Ball.y > goalY &&
      level3Ball.y < goalY + goalH;

    if (level3Ball.x - level3Ball.radius < fieldLeft) {
      level3Ball.reset();
      return;
    }

    if (level3Ball.y - level3Ball.radius < fieldTop) {
      level3Ball.reset();
      return;
    }

    if (level3Ball.y + level3Ball.radius > fieldBottom) {
      level3Ball.reset();
      return;
    }

    if (level3Ball.x + level3Ball.radius > fieldRight && !ballWithinGoalHeight) {
      level3Ball.reset();
      return;
    }

    if (level3Ball.x - level3Ball.radius > goalX + goalW) {
      level3Ball.reset();
    }
  }

  // starts dragging the level 1 ball
  void startLevel1Drag() {
    if (level1Ball.isMouseOverBall()) {
      level1Ball.startDrag();
    }
  }

  // releases the level 1 ball
  void releaseLevel1Drag() {
    level1Ball.release();
  }

  // resets level 1
  void resetLevel1() {
    level1Ball.reset();
    level1GoalScored = false;
    goalMessageStartTime = 0;
  }

  // starts dragging the level 2 ball
  void startLevel2Drag() {
    if (level2Ball.isMouseOverBall()) {
      level2Ball.startDrag();
    }
  }

  // releases the level 2 ball
  void releaseLevel2Drag() {
    level2Ball.release();
  }

  // resets level 2
  void resetLevel2() {
    level2Ball.reset();
    level2GoalScored = false;
    goalMessageStartTime = 0;
  }

  // starts dragging the level 3 ball
  void startLevel3Drag() {
    if (level3Ball.isMouseOverBall()) {
      level3Ball.startDrag();
    }
  }

  // releases the level 3 ball
  void releaseLevel3Drag() {
    level3Ball.release();
  }

  // resets level 3
  void resetLevel3() {
    level3Ball.reset();
    level3GoalScored = false;
    goalMessageStartTime = 0;
  }

  // draws the win screen for a completed level
  void winScreen(int levelNumber) {
    background(70, 180, 90);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(56);
    text("You Won!", 400, 180);

    textSize(28);
    text("Level " + levelNumber + " Complete", 400, 240);

    fill(0, 150, 255);
    rect(300, 340, 200, 70, 14);
    fill(255);
    textSize(28);
    text("Next Level", 400, 375);

    fill(0, 150, 255);
    rect(300, 430, 200, 70, 14);
    fill(255);
    textSize(28);
    text("Main Menu", 400, 465);
  }

  // draws the final championship screen
  void champScreen() {
    background(70, 180, 90);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(52);
    text("You are the", 400, 120);
    text("Gator Cup Champion!", 400, 180);

    imageMode(CENTER);
    image(trophyImg, 400, 300, 150, 150);
    imageMode(CORNER);

    textSize(26);
    text("You beat all 3 levels.", 400, 420);

    fill(0, 150, 255);
    rect(300, 470, 200, 70, 14);
    fill(255);
    textSize(28);
    text("Main Menu", 400, 505);
  }
}