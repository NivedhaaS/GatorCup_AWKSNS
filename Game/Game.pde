Menu menu;
Levels levels;
Timer timer;

int different_screens = 0;
boolean show_menu = true;
int goals_scored = 0;
int goal_target = 10;

void setup() {
  size(800, 600);
  pixelDensity(1);
  menu = new Menu();
  levels = new Levels();
  timer = new Timer(60);
}

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

    if (timer.is_finished()) {
      fill(255, 0, 0);
      textSize(32);
      text("Time's Up!", 400, 300);
    }
  } 
  else if (different_screens == 3) {
    menu.instructionsPage();
  }
}

void mousePressed() {
  if (different_screens == 0) {
    if (mouseX > 300 && mouseX < 500 && mouseY > 250 && mouseY < 330) {
      different_screens = 1;
    }

    if (mouseX > 300 && mouseX < 500 && mouseY > 350 && mouseY < 430) {
      different_screens = 3;
    }
  } 
  else if (different_screens == 1) {
    if (mouseX > 300 && mouseX < 500 && mouseY > 70 && mouseY < 130) {
      different_screens = 2;
      timer.reset_timer();
      goals_scored = 0;
      levels.resetLevel1();
    }
  } 
  else if (different_screens == 2) {

    // restart level
    if (mouseX > 50 && mouseX < 250 && mouseY > 520 && mouseY < 570) {
      timer.reset_timer();
      goals_scored = 0;
      levels.resetLevel1();
      return;
    }

    // restart game
    if (mouseX > 550 && mouseX < 750 && mouseY > 520 && mouseY < 570) {
      different_screens = 0;
      goals_scored = 0;
      timer.stop_timer();
      levels.resetLevel1();
      return;
    }

    levels.startLevel1Drag();
  } 
  else if (different_screens == 3) {
    if (mouseX > 300 && mouseX < 500 && mouseY > 520 && mouseY < 580) {
      different_screens = 0;
    }
  }
}

void mouseReleased() {
  if (different_screens == 2) {
    levels.releaseLevel1Drag();
  }
}