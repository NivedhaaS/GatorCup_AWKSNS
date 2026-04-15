Menu menu;
Levels levels;
Timer timer;

int different_screens = 0;
boolean show_menu = true;
int goals_scored = 0;
int goal_target = 10;

boolean level2Unlocked = false;
boolean level3Unlocked = false;

// sets up the game window and initializes objects
void setup() {
  size(800, 600);
  pixelDensity(1);
  rectMode(CORNER);

  menu = new Menu();
  levels = new Levels();
  timer = new Timer(60);
}

// display different screens and game levels
void draw() {
  if (different_screens == 0) {
    menu.drawBackground();
    menu.startButton();
    menu.howToPlayButton();
  } 
  else if (different_screens == 1) {
    levels.all_levels();
  } 
  else if (different_screens == 2) {
    levels.level_1();
    timer.display();

    fill(0);
    textSize(24);
    textAlign(CENTER, CENTER);
    text("Goals: " + goals_scored + "/" + goal_target, 120, 40);

    if (goals_scored >= goal_target && !timer.is_finished()) {
      timer.stop_timer();
      different_screens = 4;
    }

    if (timer.is_finished()) {
      fill(255, 0, 0);
      textSize(32);
      text("Time's Up!", 400, 300);
    }
  } 
  else if (different_screens == 3) {
    menu.instructionsPage();
  }
  else if (different_screens == 4) {
    levels.winScreen(1);
  }
  else if (different_screens == 5) {
    levels.level_2();
    timer.display();

    fill(0);
    textSize(24);
    textAlign(CENTER, CENTER);
    text("Goals: " + goals_scored + "/" + goal_target, 120, 40);

    if (goals_scored >= goal_target && !timer.is_finished()) {
      timer.stop_timer();
      different_screens = 6;
    }

    if (timer.is_finished()) {
      fill(255, 0, 0);
      textSize(32);
      text("Time's Up!", 400, 300);
    }
  }
  else if (different_screens == 6) {
    levels.winScreen(2);
  }
  else if (different_screens == 7) {
    levels.level_3();
    timer.display();

    fill(0);
    textSize(24);
    textAlign(CENTER, CENTER);
    text("Goals: " + goals_scored + "/" + goal_target, 120, 40);

    if (goals_scored >= goal_target && !timer.is_finished()) {
      timer.stop_timer();
      different_screens = 8;
    }

    if (timer.is_finished()) {
      fill(255, 0, 0);
      textSize(32);
      text("Time's Up!", 400, 300);
    }
  }
  else if (different_screens == 8) {
    levels.champScreen();
  }
}

// handles all mouse clicks for menus and gameplay
void mousePressed() {
  if (different_screens == 0) {
    if (mouseX > 300 && mouseX < 500 && mouseY > 250 && mouseY < 330) {
      different_screens = 1;
      return;
    }

    if (mouseX > 300 && mouseX < 500 && mouseY > 350 && mouseY < 430) {
      different_screens = 3;
      return;
    }
  } 
  else if (different_screens == 1) {
    if (mouseX > 250 && mouseX < 550 && mouseY > 140 && mouseY < 240) {
      different_screens = 2;
      goals_scored = 0;
      timer.reset_timer();
      levels.resetLevel1();
      return;
    }

    if (mouseX > 250 && mouseX < 550 && mouseY > 270 && mouseY < 370 && level2Unlocked) {
      different_screens = 5;
      goals_scored = 0;
      timer.reset_timer();
      levels.resetLevel2();
      return;
    }

    if (mouseX > 250 && mouseX < 550 && mouseY > 400 && mouseY < 500 && level3Unlocked) {
      different_screens = 7;
      goals_scored = 0;
      timer.reset_timer();
      levels.resetLevel3();
      return;
    }
  } 
  else if (different_screens == 2) {
    if (mouseX > 50 && mouseX < 250 && mouseY > 520 && mouseY < 570) {
      goals_scored = 0;
      levels.resetLevel1();
      timer.reset_timer();
      return;
    }

    if (mouseX > 550 && mouseX < 750 && mouseY > 520 && mouseY < 570) {
      different_screens = 0;
      goals_scored = 0;
      levels.resetLevel1();
      timer.stop_timer();
      return;
    }

    if (!timer.is_finished()) {
      levels.startLevel1Drag();
    }
  } 
  else if (different_screens == 3) {
    if (mouseX > 300 && mouseX < 500 && mouseY > 520 && mouseY < 580) {
      different_screens = 0;
      return;
    }
  }
  else if (different_screens == 4) {
    if (mouseX > 300 && mouseX < 500 && mouseY > 340 && mouseY < 410) {
      level2Unlocked = true;
      goals_scored = 0;
      levels.resetLevel1();
      timer.stop_timer();
      different_screens = 1;
      return;
    }

    if (mouseX > 300 && mouseX < 500 && mouseY > 430 && mouseY < 500) {
      different_screens = 0;
      goals_scored = 0;
      levels.resetLevel1();
      timer.stop_timer();
      return;
    }
  }
  else if (different_screens == 5) {
    if (mouseX > 50 && mouseX < 250 && mouseY > 520 && mouseY < 570) {
      goals_scored = 0;
      levels.resetLevel2();
      timer.reset_timer();
      return;
    }

    if (mouseX > 550 && mouseX < 750 && mouseY > 520 && mouseY < 570) {
      different_screens = 0;
      goals_scored = 0;
      levels.resetLevel2();
      timer.stop_timer();
      return;
    }

    if (!timer.is_finished()) {
      levels.startLevel2Drag();
    }
  }
  else if (different_screens == 6) {
    if (mouseX > 300 && mouseX < 500 && mouseY > 340 && mouseY < 410) {
      level3Unlocked = true;
      goals_scored = 0;
      levels.resetLevel2();
      timer.stop_timer();
      different_screens = 1;
      return;
    }

    if (mouseX > 300 && mouseX < 500 && mouseY > 430 && mouseY < 500) {
      different_screens = 0;
      goals_scored = 0;
      levels.resetLevel2();
      timer.stop_timer();
      return;
    }
  }
  else if (different_screens == 7) {
    if (mouseX > 50 && mouseX < 250 && mouseY > 520 && mouseY < 570) {
      goals_scored = 0;
      levels.resetLevel3();
      timer.reset_timer();
      return;
    }

    if (mouseX > 550 && mouseX < 750 && mouseY > 520 && mouseY < 570) {
      different_screens = 0;
      goals_scored = 0;
      levels.resetLevel3();
      timer.stop_timer();
      return;
    }

    if (!timer.is_finished()) {
      levels.startLevel3Drag();
    }
  }
  else if (different_screens == 8) {
    if (mouseX > 300 && mouseX < 500 && mouseY > 470 && mouseY < 540) {
      different_screens = 0;
      goals_scored = 0;

      level2Unlocked = false;
      level3Unlocked = false;

      levels.resetLevel1();
      levels.resetLevel2();
      levels.resetLevel3();

      timer.reset_timer();
      return;
    }
  }
}

// handles releasing the drag action for each level
void mouseReleased() {
  if (different_screens == 2 && !timer.is_finished()) {
    levels.releaseLevel1Drag();
  }
  else if (different_screens == 5 && !timer.is_finished()) {
    levels.releaseLevel2Drag();
  }
  else if (different_screens == 7 && !timer.is_finished()) {
    levels.releaseLevel3Drag();
  }
}