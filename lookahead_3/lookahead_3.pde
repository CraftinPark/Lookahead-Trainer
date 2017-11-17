///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------LOOKAHEAD TRAINER-----------------------------------------------------//
//-----------------------------------------------------Author: John Park-----------------------------------------------------//
//-----------------------------------------------------Created: 11/05/17-----------------------------------------------------//
//---------------------------------------Description: Training program for speedcubing---------------------------------------//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//In order to keep things organized, the order of attributes is as follows:

//TEXT: font, align, size


//=Settings===================================================================================================================

void settings() {
  size(1200, 600);
}

//=Setup======================================================================================================================

void setup() {
  smooth();

  //-Imports--------------------------------------------------------------------------------------------------------------------

  norwester = createFont("norwester.otf", 32);
  font2 = createFont("SG_Alternative_High-Alt.otf", 32);
  mail = loadImage("mail.png");
  //  beep = new SoundFile(this, "beep.mp3");

  //-Obects---------------------------------------------------------------------------------------------------------------------

  t = new timer();
  c = new control();

  //----------------------------------------------------------------------------------------------------------------------------

  for (int i = 0; i < timer_record.length; i++) {
    timer_record[i] = i;
  }
}

void draw() {  
  background(120);

  t.measure();
  c.display();

  //-Time record----------------------------------------------------------

  for (int i = 0; i < timer_times; i++) {  //Expand down as many times as there are timer_times
    timer_record[timer_times] = timeElapse;     
    for (int j = 0; j < 3; j++) {  //Three columns for AV5 and AV12 values (not yet used)
      if (mouseX > 20+j*70 && mouseX < 90+j*70 && mouseY > 250+(i*38) && mouseY < 288 + (i*38)) {  //highlighting (later use for menu bar for individual time)
        fill(150);
      } else {
        noFill();
      }
      stroke(80);
      strokeWeight(4);
      rectMode(CORNER);
      rect(20+j*70, 250+(i*38), 70, 38);
    }
    fill(255);
    textFont(norwester);
    textAlign(CENTER);
    textSize(20);
    text(timer_record[i], 53, 275+i*38);
  }

  fill(255);
  textFont(font2);
  textAlign(CENTER);
  textSize(30);
  text("Lookahead Trainer", width/2, 30);


  if (ready == true || start == true) {
    if (metronome_tick == true) {    
      //      beep.play();
      metronome_time = 0;
      if (start == true) {
        beat_count++;
      }
    }
  }

  if (timer_stop == true) {
    beat_count = 0;
  }

  if (welcome_play == false) {
    welcome_play();
  }
}

void mousePressed() {
  if (mouseY > 85 && mouseY < 135) {
    mouse_hold = true;
  }
  if (mouseX>width/2-60 && mouseX<width/2+60 && mouseY > height/2 && mouseY < height/2+40) {
    welcome_mouse_hold = true;
  }
}
void mouseReleased() {
  mouse_hold = false;
  if (welcome_mouse_hold == true) {
    welcome_play = true;
  }
}