//-----------------------------------------------------------------------------------------------------------------------------

import processing.sound.*;
SoundFile beep;
PImage mail;
PFont norwester;
PFont font2;

//-Metronome-------------------------------------------------------------------------------------------------------------------

float   metronome_time;                 //Determines when the beat will play (based on framerate of 60) (subject to change)
float   metronome_speed;                //Determines how fast the beat will play
int     metronome_position = width/2;   //Valve setting (determines metronome speed)
boolean metronome_tick;                 //Determines when the metronome has finished an interval
int     beat_count;                     //How many times the beat has been played (resets when timer is stopped)

//-Timer-----------------------------------------------------------------------------------------------------------------------

boolean timer_stop;                     //Determines when the timer is not on (on until timer restarts)
boolean timer_end;                      //The event at which the timer ends (on for 1 frame)
int     timer_times = 0;                //Number of times the timer has been played
float[] timer_record = new float[100];  //Array for recorded times

//-Mouse-----------------------------------------------------------------------------------------------------------------------

boolean mouse_hold;                     //Whether or not the mouse is being held (used for example metronome valve)

//-Welcome---------------------------------------------------------------------------------------------------------------------

boolean welcome_play;                   //Determines whether to play the entry screen or not
boolean welcome_mouse_hold;             //triggers upon release of clicking start (whether or not the user is holding the entry start)
color   welcome_button_color;           //Color   of the start button
float   welcome_button_opacity = -150;  //Opacity of the start button
color   welcome_text_color;             //Color   of the text  button
float   welcome_cube_rotate = 0;        //Determines the rotation of the cube graphics
float   welcome_cube_accelerate = 0;
float   welcome_title_opacity = -50;
float   welcome_subtitle_opacity = -100;

//-Objects--------------------------------------------------------------------------------------------------------------------

control c;
timer t;