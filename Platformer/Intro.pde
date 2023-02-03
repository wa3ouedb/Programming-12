void intro() {
  imageMode(CENTER);
  introAnimation.show();
  start.show();
  if (start.clicked){
    mode = MAPSELECT;
  }
  fill(white);
  textFont(retro);
  textSize(width/10);
  text("Platformer", width/2, height/3);
  
}
