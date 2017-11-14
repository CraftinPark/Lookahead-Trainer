float timeGoal;

class control {
  control() {
  }

  void display() {
    rectMode(CORNER);
    fill(0);
    rect(95, 100, 810, 20);
    stroke(0);
    for (int h = 1; h < 10; h++) {
      text(h*20+40, h*100, 75);
      line(h*100, 95, h*100, 125);
    }
    text("BPM", 500, 170);

    rectMode(CENTER);
    fill(255);
    rect(metronome_position, 110, 50, 50);
    if (hold == false) {
      if (mouse_hold == true) {

        metronome_position = mouseX;
        for (int i = 1; i < 10; i++) {
          if (mouseX > i*100-19 && mouseX < i*100+20) {
            metronome_position = i*100;
          }
        }
        if (mouseX < 100) {
          metronome_position = 100;
        }
        if (mouseX > 920) {
          metronome_position = 900;
        }
      }


      if (mouse_hold == false) {
        for (int j = 0; j < 10; j++) {
          if (metronome_position > j*100-51 && metronome_position < j*100+50) {
            metronome_position = j*100;
          }
        }
      }
      metronome_speed = metronome_position/5 + 40;

      metronome_time = metronome_time + metronome_speed / 60;
      if (metronome_time >= 60) {
        metronome_tick = true;
      } else {
        metronome_tick = false;
      }
    }
    textAlign(LEFT);
    text("Time to get:", 10, height/3);
    text("sec", 125, height/3 + 40);
    textAlign(RIGHT);
    text(timeGoal, 120, height/3 + 40);
    switch(metronome_position / 100) {
      case 1:
        timeGoal = 36;
        break;
      case 2:
        timeGoal = 27;
        break;
        case 3:
        timeGoal = 21.6;
        break;
        case 4:
        timeGoal = 18;
        break;
        case 5:
        timeGoal = 15.4;
        break;
        case 6:
        timeGoal = 13.5;
        break;
        case 7:
        timeGoal = 12;
        break;
        case 8:
        timeGoal = 10.8;
        break;
        case 9:
        timeGoal = 9.8;
        break;
        case 100:
        timeGoal = 27;
        break;
    }
  }
}