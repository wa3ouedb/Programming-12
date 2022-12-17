//This function draws the INTRO screen.

void intro() {
  introAnimation.show();
  start.show();
  if (start.clicked){
    mode = MAPSELECT;
  }
  fill(white);
  textFont(metropolis);
  textSize(100);
  text("Tower Defense", width/2, height/3);
  
}
