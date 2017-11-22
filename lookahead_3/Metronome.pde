float timeGoal;

class metronome {
  metronome() {
  }

  void bpm_selector() {
    pushMatrix();
    translate(0, pullup);  //move everything down with the pulldown tab

    fill(255);  //Subtitle for this valve
    textSize(25);
    text("BPM", 35, -15);

    fill(0);  //Black back of valve
    noStroke(); 
    rectMode(CORNER);
    rect(79, -50, 1064, 10);

    for (int h = 1; h < 33; h++) {  //Number of increments
      if ((h*10+40) == metronome_speed) {  //Highlight selected metronome speed
        fill(255, 255, 0);
      } else {
        fill(0);
      }
      stroke(0);  //increments of the metronome speed - going up by 10, and starts at 50
      strokeWeight(1.5);
      textFont(font2);
      textSize(10);
      text(h*10+40, h*34 + 50, -20);  

      line(h*34 + 50, -50, h*34 + 50, -35);  //incremental lines
    }

    rectMode(CENTER);  //Valve for selecting metronome speed
    fill(255);
    rect(metronome_position, -45, 20, 30);  

    if (timer_start_hold == false) {  //if the timer is not being held by space

      if (mouse_hold == true) {  //if the mouse is being held (on the valve selector)

        metronome_position = mouseX;

        for (int i = 1; i < 33; i++) {  //for as many increments as there are

          if (mouseX > i*34+41 && mouseX < i*34+59) {  //snap to increment (short range)

            metronome_position = i*34+50;
          }
        }
        if (mouseX < 84) {

          metronome_position = 84;  //do not allow selection to move past lowest setting
        }
        if (mouseX > 1138) {

          metronome_position = 1138;  //do not allow selection to move past highest setting
        }
      }

      if (mouse_hold == false) {  //if the mouse is not being held (on the valve selector)

        for (int j = 1; j < 33; j++) {  //snap to closest increment

          if (metronome_position > j*34+34 && metronome_position < j*34+67) {

            metronome_position = j*34+50;
          }
        }
      }

      metronome_speed = metronome_position/34 * 10 + 30;  //speed of the metronome relative to the position of the valve
      metronome_time = metronome_time + metronome_speed / 60;  

      if (metronome_time >= 60) {  //if the time exceeds 60 frames, make tick equal true

        metronome_tick = true;
      } else {

        metronome_tick = false;
      }
    }

    popMatrix();
  }



  void goal_time() {                  //Planning to remove this and replace it with a better system
    pushMatrix();
    translate(0, pullup);  //move everything down with the pulldown tab

    noStroke();
    for (int i = 0; i < 50; i++) {  //shadow for goal time
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