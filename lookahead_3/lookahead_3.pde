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

  //-Imports------------------------------------------------------------------------------------------------------------------

  norwester = createFont("norwester.otf", 32);
  font2 = createFont("SG_Alternative_High-Alt.otf", 32);
  numberfont = createFont("Dialog.plain-24.vlw", 32);
  mail = loadImage("mail.png");
  //  beep = new SoundFile(this, "beep.mp3");

  //-Obects-------------------------------------------------------------------------------------------------------------------

  t = new timer();
  c = new control();

  //--------------------------------------------------------------------------------------------------------------------------

  for (int i = 0; i < timer_record.length; i++) {
    timer_record[i] = i;
  }
}

void draw() {  
  background(180);




  //-Time record----------------------------------------------------------

  keepTime();

  if (mouseY < 15) {
    if (pullup < 50) {
      pullup_accel -= 0.5 + pullup_accel/250;
      pullup += pullup_accel;
    }
    if (pullup > 50) {
      pullup = 50;
      pulled = true;
    }
  }

  if (mouseY > 65 && pulled == true && mouse_hold == false) {
    pullup_accel = 7.5;
    pullup -= pullup_accel;
    if (pullup < 0) {
      pullup = 0;
      pulled = false;
    }
  }    

  fill(140);
  stroke(120);
  strokeWeight(3);
  beginShape();
  vertex(0, -1);
  vertex(width, -1);
  vertex(width, 10+pullup);
  vertex(width/2+170, 10+pullup);
  vertex(width/2+130, 40+pullup);
  vertex(width/2-130, 40+pullup);
  vertex(width/2-170, 10+pullup);
  vertex(0, 10+pullup);
  endShape();

  fill(255);
  textFont(font2);
  textAlign(CENTER);
  textSize(30);
  text("Lookahead Trainer", width/2, 30+pullup);


  c.display();
  t.measure();

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
  if (mouseY > -50 + pullup && mouseY < pullup) {
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

void keyPressed() {
  if(key == 'a') {
    saveFrame();
  }
  if (key == ' ') {
    if (start == false) {
      hold = true;
    } else {
    }
  }
  if (keyCode == ENTER) {
    welcome_mouse_hold = true;
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
      //      background(#f4a641);
    }
  }

  if (welcome_mouse_hold == true) {
    welcome_play = true;
  }
}

void keepTime() {
  fill(170);
  rect(-1, 370, 345, height-100, 5);
  noFill();
  stroke(80);

  strokeWeight(1);
  rectMode(CORNER);

  rect(25, 128, 45, 25);
  rect(70, 128, 45, 25);
  rect(115, 128, 45, 25);
  fill(80);
  textSize(15);
  text("time", 48, 146);
  text("Ao5", 93, 146);
  text("Ao12", 138, 146);
  for (int i = 1; i < timer_times+1; i++) {  //Expand down as many times as there are timer_times (+1 because 0 times would mean no recorded time)
    if (timer_stop == true && hold != true && timeElapse != 0 && timer_end == true) {
      timer_record[timer_times] = timeElapse;
    }
    for (int j = 0; j < 3; j++) {  //Three columns for AV5 and AV12 values (not yet used)
      if (mouseX > 25+j*45 && mouseX < 70+j*45 && mouseY > 128+(i*25) && mouseY < 153+(i*25)) {  //highlighting (later use for menu bar for individual time)
        fill(180);
      } else {
        noFill();
      }

      stroke(80);
      strokeWeight(1);
      rectMode(CORNER);
      rect(5, 128+(i*25), 20, 25);
      rect(25+j*45, 128+(i*25), 45, 25);
    }

    fill(80);
    textFont(norwester);
    textSize(15);
    text(i, 15, 148+i*25);
    textFont(numberfont);
    textAlign(CENTER);
    textSize(13);
    fill(0);
    text(timer_record[i], 46, 146+i*25);
  }
}