// Timer keeps track of how much time is left in each level
class Timer {
  int start_time;
  int level_time;
  boolean is_running;

  // timer constructor it initializes the level time and sets the timer to not running
  Timer(int seconds) {
    level_time = seconds;
    start_time = 0;
    is_running = false;
  }

  // starts the timer by recording the current time and setting it to running
  void start_timer() {
    start_time = millis();
    is_running = true;
  }

  // resets the timer by starting it again
  void reset_timer() {
    start_timer();
  }

  // stops the timer by setting it to not running
  void stop_timer() {
    is_running = false;
  }

  // calculates the elapsed time since the timer started and returns it in seconds
  int elapsed_time() {
    if (!is_running) {
      return 0;
    }
    return (millis() - start_time) / 1000;
  }

  // calculates the time left by subtracting the elapsed time from the level time and returns it
  int time_left() {
    if (!is_running) {
      return level_time;
    }
    return max(0, level_time - elapsed_time());
  }

// checks if the timer has finished by seeing if it is running and if the time left is less than or equal to 0
  boolean is_finished() {
    return is_running && time_left() <= 0;
  }

  void display() {
    fill(0);
    textSize(28);
    textAlign(CENTER, CENTER);
    text("Time Left: " + time_left(), 650, 40);
  }
}