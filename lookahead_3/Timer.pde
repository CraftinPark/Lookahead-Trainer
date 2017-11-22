class timer {
  timer() {
  }

  void time() {

    float millisEnd = millis();

    if (timer_start_hold == true) {  //When the space is being held

      timer_elapsed_time = 0;  //Reset elapsed time to 0
      timer_ready_countdown--;  //Start the hold time until becoming ready

      background(#f4a641);  //orange background

      if (timer_ready_countdown <= 0) {  //if the countdown is finished

        background(#5ff442);  //green background
        timer_ready = true;

        textAlign(CENTER);
        textSize(50);
        text("ready", width/2, height*3/5 + 50);  //display ready text
      }
    }

    if (timer_start == true) {  //if the timer has been started

      background(180);  //grey background

      if (timer_start_once == false) {  //This only happens for 1 frame upon start of timer
        timer_start_time = millis();  //The start of the timer is the current milliseconds passed
        timer_start_once = true;
      } 

      timer_elapsed_time = (millisEnd - timer_start_time) / 1000;  //determines elapsed time by subtracting the start time and the current time passed

      if (timer_elapsed_time < 1) {  //Happens when the elapsed time is under 1 second

        textAlign(CENTER);
        textSize(50);
        text("Go!", width/2, height*3/5+ 50);  //display go text
      }
    }

    strokeWeight(0);   
    textFont(font2);
    textAlign(LEFT);
    textSize(150);
    text(timer_elapsed_time, width/2-250, height/2+ 50);  //Time elapsed

    if (timer_stop == true) {  //increase timer_times when the timer has stopped

      timer_start_once = false;

      if (timer_stop_once == false) {  //Only happen for 1 frame upon timer stop
        timer_times++;
        timer_stop_once = true;
      }
    } else { 

      timer_stop_once = false;  //if the timer is not in the stop position, this can be reset to trigger again
    }
  }
}