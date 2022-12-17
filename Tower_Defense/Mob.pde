
//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  
  float x, y, vx, vy, d;
  float hp, maxhp;
  int value; // value of money given after mob is killed
  color fillColor, strokeColor;
  float speed;
  
  Mob( float _x, float _y, float _vx, float _vy){
    fillColor = blue;
    strokeColor = black;
    x = _x; 
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    value = 2;
    maxhp = 5 + waveNumber*1.5;
    hp = maxhp;
    speed = 1 + waveNumber*0.15;
  }
  
  void show(){
    fill(fillColor);
    strokeWeight(3);
    stroke(strokeColor);
    circle(x, y, d);
    healthbar();
  }
  
  void act(){
    x = x + vx*speed;
    y = y + vy*speed;
    
    int i = 0;
    while(i < nodes.length){
      if (dist(nodes[i].x, nodes[i].y, x, y) <4){
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }
    
    i = 0; 
    while (i < bullets.size()){
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2){
        hp = hp - 1;
        myBullet.hp = myBullet.hp - 1;
      } 
      i++;
    }
    if(hp <= 0){
      balance = balance + value;
    }
  }
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(purple);
    rect(x-25, y-(d+10), 50, 20);
    fill(pink);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
