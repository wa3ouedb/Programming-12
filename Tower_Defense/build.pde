//This function draws the BUILD screen
int animateText;
Tower tower;

void build() {
  Board();
  animateThings();
  
  strokeWeight(0);
  fill(black);
  rect(900, 400, 200, 800);
  
  fill(white);
  textFont(metropolis);
  textSize(75);
  text("Build Mode", 400 , height/3);
  play.show();
  if(play.clicked && building == false){
    mode = PLAY;
  }
  
  gun.show();
  if(gun.clicked && balance >= 5 && !aoe.clicked && !sniper.clicked){
    building = true;
    towers.add(new Tower(GUN));
    balance = balance -5;
  }
  aoe.show();
  if(aoe.clicked && balance >= 25 && !gun.clicked && !sniper.clicked){
    building = true;
    towers.add(new Tower(AOE));
    balance = balance - 25;
  }
  sniper.show();
    if(sniper.clicked && balance >= 50 && !gun.clicked && !aoe.clicked){
    building = true;
    towers.add(new Tower(SNIPER));
    balance = balance - 50;
  }
}
