//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {
  
  final int PLACING = 0;
  final int PLACED  = 1;
  
  float x, y;
  int cooldown, threshold;
  int towerMode;
  int towerType;
  
  
  Tower(int type){
    x = mouseX;
    y = mouseY;
    cooldown = 0;
    towerMode = PLACING;
    towerType = type;
    if(towerType == GUN) { threshold = 30;}
    if(towerType == AOE) { threshold = 40;}
    if(towerType == SNIPER) { threshold = 90;}
  }
  
  void show(){
    if(towerMode == PLACING) {
      x = mouseX;
      y = mouseY;
      if(mousePressed && mouseX < 790) {
        towerMode = PLACED;
        building = false;
      }
    }
    
    if (towerType == GUN) showGunTower();
    if (towerType == AOE) showAoETower();
    if (towerType == SNIPER) showSniperTower();
  }
  
  void showGunTower(){
    stroke(black);
    strokeWeight(4);
    fill(blue);
    square(x, y, 40);
  }
  
  void showAoETower(){
    stroke(black);
    strokeWeight(4);
    fill(red);
    circle(x, y, 40);
  }
  
  void showSniperTower(){
    stroke(white);
    strokeWeight(4);
    fill(black);
    triangle(x , y, x, y + 40, x + 40, y + 20 );
  }
  
  void shootGunTower(){
    bullets.add(new Bullet(x, y, 0, -10, 15));//UP
    bullets.add(new Bullet(x, y, 0, 10, 15));//DOWN
    bullets.add(new Bullet(x, y, -10, 0, 15));//LEFT
    bullets.add(new Bullet(x, y, 10, 0, 15));//RIGHT
  }
  
  void shootAOE(){
    bullets.add(new Bullet(x, y, true));
  }
  
  void shootSniper(){
    //get 0 not working? mobs start taking damage once sniper shoots x amount of waves of shots
    Mob target = mobs.get(0);
    strokeWeight(12);
    stroke(red);
    line(x, y, target.x, target.y);
    target.hp = target.hp - 5;
    if (target.hp <= 0){
      mobs.remove(target);
    }
  }

  
  void act(){
    cooldown++;
    if (cooldown >= threshold){
      cooldown = 0;
      if (towerType == GUN){
        shootGunTower();   
      }
      if (towerType == AOE){
        shootAOE();
      }
      if (towerType == SNIPER){
        shootSniper();
      }
    }
  }
}
