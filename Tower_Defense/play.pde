//This function draws the PLAY screen

int waveNumber;
int x;

void play() {
  Board();
  animateThings();
  handleButtonClicks();
  toolBar();
  info();
}

void info(){
  fill(white);
  text("Lives: " + lives, 900, 750);
  text("Balance:", 900, 500);
  text("$" + balance, 900, 550);
}

void toolBar(){
  strokeWeight(0);
  fill(black);
  rect(900, 400, 200, 800);
  
  //nextWave Button
  nextWave.show();
  fill(white);
  textFont(metropolis);
  text("Next Wave: " + waveNumber, 900, 30);
  build.show();
  
  if(build.clicked){
    mode = BUILD;
  }
}

void Board(){
  //default board
  if(map == 1){
    background(green);
    stroke(orange);
    strokeWeight(40);
    line(0, 400, 350, 400);
    //loop 1
    line(350, 400, 350, 600);
    line(350, 600, 175, 600);
    line(175, 600, 175, 250);
    line(175, 250, 675, 250);
    //loop 2
    line(675, 250, 675, 100);
    line(675, 100, 500, 100);
    line(500, 100, 500, 550);
    line(500, 550, 1000, 550);
    int i = 0;
    while(i< 8){
      defaultMapNodes[i].show();
      i++;
    }
  }
  
  //brandon board
  else if (map == 2){
    background(brandon2Image);
    stroke(grey);
    strokeWeight(40);
    line(0, 525, 125, 525);
    line(125, 525, 300, 650);
    line(300, 650, 500, 650);
    line(500, 650, 625, 500);
    line(625, 500, 625, 350);
    line(625, 350, 500, 175);
    line(500, 175, 800, 175);
    int i = 0;
    while(i< 6){
      brandonMapNodes[i].show();
      i++;
    }
  }
}


void animateThings(){
  int i = 0;
  while(i < mobs.size()){
    Mob myMob = mobs.get(i);
    myMob.show();
    myMob.act();
    if (myMob.hp <= 0){
      mobs.remove(i);
    } 
    if (myMob.x > 800){
      mobs.remove(i);
      lives --;
      if (lives <= 0){
        mode = GAMEOVER;
  }
    } else {
      i++;
    }
  }
  
  i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    myTower.show();
    if( mobs.size() > 0){
      myTower.act(); 
    } //act if mobs.size is greater than 0
    i++;
  }
  
  i = 0;
  while (i < bullets.size()) {
    Bullet myBullets = bullets.get(i);
    myBullets.act();
    myBullets.show();
    if (myBullets.hp <= 0){
      bullets.remove(i);
    } else {
      i++;
    }
  }
}

void handleButtonClicks(){
  if(nextWave.clicked && mobs.size() == 0){
    addWave();
    waveNumber ++;
  }
}

void addWave(){
  int i = 0;
  int x = 0;
  if(map == 1){
    while (i <= waveNumber) {
      mobs.add(new Mob(0 + x, 400, 1, 0));
      x = x - 50; 
      i++;
    }
    if (waveNumber % 3 == 0){
      i = 0;
      x = 50;
      while (i < waveNumber/3){
        mobs.add(new ChonkyMob(0 + x, 400, 1, 0));
        x = x - 100;
        i++;
      }
    }
      if (waveNumber % 2 == 0){
      i = 0;
      x = 50;
      while (i < waveNumber/2){
        mobs.add(new SpeedyMob(0 + x, 400, 1, 0));
        x = x - 100;
        i++;
      }
    }
  }
   else if(map == 2){
      while (i <= waveNumber) {
      mobs.add(new Mob(0 + x, 525, 1, 0));
      x = x - 50; 
      i++;
    }
    if (waveNumber % 3 == 0){
      i = 0;
      x = 50;
      while (i < waveNumber/3){
        mobs.add(new ChonkyMob(0 + x, 525, 1, 0));
        x = x - 100;
        i++;
      }
    }
      if (waveNumber % 2 == 0){
      i = 0;
      x = 50;
      while (i < waveNumber/2){
        mobs.add(new SpeedyMob(0 + x, 525, 1, 0));
        x = x - 100;
        i++;
      }
    }
  }
}
