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

    textAlign(CENTER);
    if (hold == true) {

      timeElapse = 0;
      millisStart = 0;
      holdTime--;
      background(#f4a641);
      if (holdTime <= 0) {
        background(#5ff442);
        ready = true;
        text("ready", width/2, height*3/5);
      }
    }
    if (start == true) {
      if (startonce == false) {
        millisStart = millis();
        startonce = true;
      } 
      timeElapse = (millisEnd - millisStart) / 1000;
      if (timeElapse < 1) {
        text("Go!", width/2, height*3/5);
      }
    }
    text(timeElapse, width/2, height/2);
  }
}

void keyPressed() {
  if (key == ' ') {
    if (start == false) {
      hold = true;
    } else {
    }
  }
}

void keyReleased() {
  if (key == ' ') {
    hold = false;
    holdTime = 30;
    if (ready == true && cancel == false) {
      ready = false;
      start = true;
      timer_stop = false;
      println("start");
    } else {
      timer_stop = true;
      start = false;
      background(#f4a641);
    }
  }
}