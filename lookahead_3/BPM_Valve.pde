float timeGoal;

class control {
  control() {
  }

  void display() {
    pushMatrix();
    translate(0, pullup);
    strokeWeight(3);
    line(0, 0, width, 0);
    rectMode(CORNER);
    fill(0);
    noStroke();
    rect(79, -50, 1064, 10);
    stroke(0);
    strokeWeight(1.5);
    textFont(font2);
    for (int h = 1; h < 33; h++) {
      textSize(10);
      if ((h*10+40) == metronome_speed) {
        fill(255, 255, 0);
      } else {
        fill(0);
      }
      text(h*10+40, h*34 + 50, -20);
      line(h*34 + 50, -50, h*34 + 50, -35);
    }
    fill(255);
    textSize(25);
    text("BPM", 35, -15);

    rectMode(CENTER);
    fill(255);
    rect(metronome_position, -45, 20, 30);
    if (hold == false) {
      if (mouse_hold == true) {

        metronome_position = mouseX;
        for (int i = 1; i < 33; i++) {
          if (mouseX > i*34+41 && mouseX < i*34+59) {
            metronome_position = i*34+50;
          }
        }
        if (mouseX < 84) {
          metronome_position = 84;
        }
        if (mouseX > 1138) {
          metronome_position = 1138;
        }
      }


      if (mouse_hold == false) {
        for (int j = 1; j < 33; j++) {
          if (metronome_position > j*34+34 && metronome_position < j*34+67) {
            metronome_position = j*34+50;
          }
        }
      }
      metronome_speed = metronome_position/34 * 10 + 30;
      metronome_time = metronome_time + metronome_speed / 60;
      if (metronome_time >= 60) {
        metronome_tick = true;
      } else {
        metronome_tick = false;
      }
    }

    noStroke();
    for (int i = 0; i < 50; i++) {
      fill(0, 1);
      ellipse(85, 40, 160-i*3, 50-i);
    }
    fill(255, 255);
    textAlign(LEFT);
    text("Time to get:", 10, 35);
    text("sec", 125, 60);
    textAlign(RIGHT);
    text(timeGoal, 120, 60);
    switch((metronome_position-34) / 34) {
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
    popMatrix();
  }
}