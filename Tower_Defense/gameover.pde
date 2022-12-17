//This function draws the GAMEOVER screen.

void gameOver() {
  background(white);
  fill(black);
  text("LAST WAVE SURVIVED:" + waveNumber, width/2, height/2);
  textSize(75);
  text("GAME OVER", width/2, height/2 - 100);
  startOver.show();
  if (startOver.clicked) {
    reset();
    mode = INTRO;
  }
}

void reset() {
  lives = 5;
  balance = 10;
  for (int i = 0; i < mobs.size(); ) {
    mobs.remove(i);
  }
  waveNumber = 0;
  for (int i = 0; i < towers.size(); ) {
    towers.remove(i);
  }

}
