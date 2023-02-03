int x, x2, y, c;
void play(){
  imageMode(0);
  background(lBlue);
  drawWorld();
  actWorld();
  drawHearts(player.lives);
  if (player.lives <=0){
    mode = GAMEOVER;
  }
  if (enemies.size() <= 0){
    mode = GAMEOVER;
  }
}

/*
void removeFireBalls(){
  int i = 0;
  while (i < fireballs.size()){
    FFireBall f = fireballs.get(i);
    if (isTouching("goomba")){
      world.remove(fireballs.get(i));
    } 
    i++;
  }
}
*/

void drawHearts(int lives){
  for (int i = 0; i < lives; i++){
    heart.resize(height/10, height/10);
    image(heart, width/15 + i*width/15, height/10);
  }
}

void drawWorld(){
  //sun
  fill(yellow);
  circle(-player.getX()*zoom/5 + width/4, -player.getY()*zoom/5 + height/2, width/8);
  strokeWeight(10);
  stroke(yellow2);
  
  cloud( -player.getX()*zoom/5 + width/2 + 50, -player.getY()*zoom/5 + width/2 , 230);
  x = x + 5;
  if (x == width + 130){
    x = -150;
  }
  cloud( x2, y + 150, 255);
  x2 = x2 - 5;
  if (x2 == -150){
    x2 = 950;
  }
  pushMatrix();
  translate(-player.getX()*zoom + width/2, -player.getY()*zoom + height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
  
  fill(black);
  textFont(retro);
  textSize(width/50);
  text("Enemies Left:  " + enemies.size(), width/2, height/8);
}


void actWorld(){
  player.act();
  for (int i = 0; i < terrain.size(); i++){
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i = 0; i < enemies.size(); i++){
    FGameObject e = enemies.get(i);
    e.act();
    if(enemies.size() <= 0){
      //spawn portal
    }
  }
}
void cloud(float x, float y, int c){
    fill(c);
    noStroke();
    strokeWeight(5);
    ellipse(x - 100, y, 150, 100);
    ellipse(x + 50, y, 175, 100);
    ellipse(x, y - 50, 150, 125);
}
