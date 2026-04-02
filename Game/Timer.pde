//Timer keeps track of how much time is left in each level -> fully implemented class
class Timer {
  int start_time;
  int level_time;
  boolean is_running;

  Timer(int seconds) {
    level_time = seconds;
    is_running = false;
  }

  void start_timer() {
    start_time = millis();
    is_running = true;
  }

  void reset_timer() {
    start_time = millis();
    is_running = true;
  }

  void stop_timer() {
    is_running = false;
  }

  int elapsed_time() {
    if (!is_running) {
      return 0;
    }
    return (millis() - start_time) / 1000;
  }

  int time_left() {
    if (!is_running) {
      return level_time;
    }
    return max(0, level_time - elapsed_time());
  }

  boolean is_finished() {
    return time_left() == 0;
  }

  void display() {
    fill(0);
    textSize(28);
    textAlign(CENTER, CENTER);
    text("Time Left: " + time_left(), 650, 40);
  }
}