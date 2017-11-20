float holdTime = 30;
float timeElapse = 0;
boolean hold;  //if the user is holding the spacebar
boolean start; //when the user has initiated time (let go of space)

boolean ready;  //if the user is holding the spacebar and the holding time has been surpassed
boolean cancel;

float millisStart;

boolean startonce;

class timer {
  
  timer() {
  }
  
  void measure() {
    float millisEnd = millis();
    strokeWeight(0); 
    textFont(font2);
    textAlign(CENTER);
    if (hold == true) {
      opac += 20;
      timeElapse = 0;
      millisStart = 0;
      holdTime--;
      background(#f4a641); 
      if (holdTime <= 0) {
        background(#5ff442);
        ready = true;
        text("ready", width/2, height*3/5 + 50);
      }
    } else {
    opac = 0;
    }
    if (start == true) {
      background(180);
      if (startonce == false) {
        millisStart = millis();
        startonce = true;
      } 
      timeElapse = (millisEnd - millisStart) / 1000;
      if (timeElapse < 1) {
        text("Go!", width/2, height*3/5+ 50);
      }
    }
    textSize(150);
    text(timeElapse, width/2, height/2+ 50);

    if (timer_stop == true) {  //increase timer_times when the timer has stopped
      startonce = false;
      if (timer_end == false) {
        timer_times++;
        timer_end = true;
      }
    } else { 
      timer_end = false;
    }
  }
}