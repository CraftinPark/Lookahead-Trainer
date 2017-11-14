void welcome_play() {
  fill(255);
  rectMode(CORNER);
  noStroke();
  rect(-1, -1, width+1, height+1);
  textAlign(CENTER);
  fill(0, welcome_title_opacity);
  if (welcome_title_opacity < 255) {
    welcome_title_opacity+=5;
  }
  textSize(50);
  text("Lookahead Trainer", width/2, height/2-40);
  textSize(20);
  fill(0, welcome_subtitle_opacity);
  if (welcome_subtitle_opacity < 170) {
    welcome_subtitle_opacity+=3;
  }
  text("craftincubing.blogspot.ca", width/2, height/2-20);

  if (mouseX>width/2-60 && mouseX<width/2+60 && mouseY > height/2 && mouseY < height/2+40) {
    welcome_button_color = #727272;
  } else {
    welcome_button_color = color(160, welcome_button_opacity);
  }
  if (welcome_mouse_hold == true) {
    welcome_button_color = #60e858;
  }
  if (welcome_button_opacity < 255) {
    welcome_button_opacity+=3;
  }
  fill(welcome_button_color);
  noStroke();
  rect(width/2-60, height/2, 120, 40, 7);
  fill(255);
  text("BEGIN", width/2, height/2+28);
  pushMatrix();
  translate(width, height/2);
  rotate(radians(welcome_cube_rotate/2));
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      stroke(0);
      strokeWeight(3);
      if (i == -1 && j == -1) {
        fill(255, 0, 0);
      }
      if (i == 0 && j == -1) {
        fill(255, 255, 255);
      }
      if (i == 1 && j == -1) {
        fill(255, 255, 0);
      }
      if (i == -1 && j == 0) {
        fill(255, 128, 0);
      }
      if (i == 0 && j == 0) {
        fill(0, 0, 255);
      }
      if (i == 1 && j == 0) {
        fill(255, 0, 0);
      }
      if (i == -1 && j == 1) {
        fill(255, 255, 255);
      }
      if (i == 0 && j == 1) {
        fill(0, 255, 0);
      }
      if (i == 1 && j == 1) {
        fill(255, 255, 0);
      }
      rect(i*70-35, j*70-35, 70, 70);
    }
  }
  popMatrix();

  pushMatrix();
  translate(0, height/2);
  rotate(radians(-welcome_cube_rotate/2));
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      stroke(0);
      strokeWeight(3);
      if (i == -1 && j == -1) {
        fill(255, 0, 0);
      }
      if (i == 0 && j == -1) {
        fill(255, 255, 255);
      }
      if (i == 1 && j == -1) {
        fill(0, 0, 255);
      }
      if (i == -1 && j == 0) {
        fill(0, 0, 255);
      }
      if (i == 0 && j == 0) {
        fill(255, 128, 0);
      }
      if (i == 1 && j == 0) {
        fill(255, 0, 0);
      }
      if (i == -1 && j == 1) {
        fill(255, 255, 0);
      }
      if (i == 0 && j == 1) {
        fill(0, 255, 0);
      }
      if (i == 1 && j == 1) {

        fill(255, 255, 255);
      }
      rect(i*70-35, j*70-35, 70, 70);
      fill(#cecece);
    }
  }
  popMatrix();

  welcome_cube_rotate+=welcome_cube_accelerate;
  if (welcome_cube_accelerate < 1) {
    welcome_cube_accelerate+=0.02;
  }
}