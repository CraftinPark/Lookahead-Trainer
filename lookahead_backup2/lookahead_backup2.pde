///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------LOOKAHEAD TRAINER-----------------------------------------------------//
//-----------------------------------------------------Author: John Park-----------------------------------------------------//
//-----------------------------------------------------Created: 11/05/17-----------------------------------------------------//
//---------------------------------------Description: Training program for speedcubing---------------------------------------//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//-Import----------------------------------------------------------------------------------------------------------------------

import processing.sound.*;
SoundFile beep;
PFont font;

//-Metronome-------------------------------------------------------------------------------------------------------------------

float   metronome_time;                //Determines when the beat will play (based on framerate of 60) (subject to change)
float   metronome_speed;               //Determines how fast the beat will play
float   metronome_position = width/2;  //Valve setting (determines metronome speed)
boolean metronome_tick;                //Determines when the metronome has finished an interval
int     beat_count;                    //How many times the beat has been played (resets when timer is stopped)

//-Timer-----------------------------------------------------------------------------------------------------------------------

boolean timer_stop;                    //Determines when the timer is not on (on until timer restarts)
boolean timer_end;                     //The event at which the timer ends (on for 1 frame)
int     timer_times = 0;               //Number of times the timer has been played
float[] timer_record = new float[100]; //Array for recorded times

//-Mouse-----------------------------------------------------------------------------------------------------------------------

boolean mouse_hold;                     //Whether or not the mouse is being held (used for example metronome valve)

//-Welcome---------------------------------------------------------------------------------------------------------------------

boolean welcome_play;                  //Determines whether to play the entry screen or not
boolean holdWelcome;                   //triggers upon release of clicking start (whether or not the user is holding the entry start)
color startColor = #cecece;            //Color of the start button
color startText;
float cubeRotate = 0;                  //Determines the rotation of the cube graphics

control c;
timer t;



void settings() {
  size(1000, 600);
}

void setup() {
  font = createFont("norwester", 32);
  textFont(font);
  t = new timer();
  c = new control();
  //  beep = new SoundFile(this, "beep.mp3");
  for (int i = 0; i < timer_record.length; i++) {
    timer_record[i] = i;
  }
}

void draw() {  


  background(120);
  rectMode(CORNER);
  noFill();
  stroke(80);
  for (int i = 0; i < timer_times; i++) {
    timer_record[timer_times] = timeElapse;     
    for (int j = 0; j < 3; j++) {
      if (mouseX > 20+j*7 && mouseX < 90+j*70) {
        fill(0);
      }
      rect(20+j*70, 250+(i*38), 70, 38);
    }
    textAlign(LEFT);
    textSize(20);
    text(timer_record[i], 20, 275+i*38);
  }
  textSize(50);

  if (timer_stop == true) {
    if (timer_end == false) {
      timer_times++;
      timer_end = true;
    }
  } else { 
    timer_end = false;
  }
  t.measure();
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Lookahead Trainer", width/2, 30);
  c.display();

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
    holdWelcome = true;
  }
  saveFrame();
}
void mouseReleased() {
  mouse_hold = false;
  if (holdWelcome == true) {
    welcome_play = true;
  }
}