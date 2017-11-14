void welcome_play() {
  fill(255);
  rectMode(CORNER);
  noStroke();
  rect(-1, -1, width+1, height+1);
  textAlign(CENTER);
  fill(0, title_opacity);
  if (title_opacity < 255) {
    title_opacity+=5;
  }
  textSize(50);
  text("Lookahead Trainer", width/2, height/2-40);
  textSize(20);
  fill(0, subtitle_opacity);
  if (subtitle_opacity < 170) {
    subtitle_opacity+=3;
  }
  text("craftincubing.blogspot.ca", width/2, height/2-20);

  if (mouseX>width/2-60 && mouseX<width/2+60 && mouseY > height/2 && mouseY < height/2+40) {
    startColor = #727272;
  } else {
    startColor = color(160, start_opacity);
  }
  if (holdWelcome == true) {
    startColor = #60e858;
  }
  if (start_opacity < 255) {
    start_opacity+=3;
  }
  fill(startColor);
  noStroke();
  rect(width/2-60, height/2, 120, 40, 7);
  fill(255);
  text("BEGIN", width/2, height/2+28);
  pushMatrix();
  translate(width, height/2);
  rotate(radians(cubeRotate/2));
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
  rotate(radians(-cubeRotate/2));
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

  cubeRotate+=rotateAccelerate;
  if (rotateAccelerate < 1) {
    rotateAccelerate+=0.02;
  }
}