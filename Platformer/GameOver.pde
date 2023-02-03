void gameOver(){
  if (player.lives <= 0){
    imageMode(0);
    gameOver.show();
    fill(red);
    textFont(retro);
    textSize(width/20);
    text("Click To Try Again", width/2, height - height/4);
  }
  else if (enemies.size() <=0){
  background(yellow);
  imageMode(0);
  win.show();
  }
  if (mousePressed){
    setup();
  }
}
