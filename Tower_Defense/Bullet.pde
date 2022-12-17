//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {
  float x, y, vx, vy, d;
  boolean AoE;
  int hp;
  
  Bullet(float _x, float _y, float _vx, float _vy, int _d){ //regular bullet constructor
    x = _x; 
    y = _y;
    vx = _vx;
    vy = _vy;
    d = _d;
    hp = 1;
  }
  Bullet(float _x, float _y, boolean _AoE){ //AoE bullet constructor
    x = _x; 
    y = _y;
    d = 300;
    AoE = _AoE;
  }
  
  void show(){
    if (!AoE){ //regular bullet
      stroke(black);
      strokeWeight(4);
      fill(blue);
      circle(x, y, d);
    }
    else if (AoE){ //AoE Bullet
      stroke(white);
      strokeWeight(4);
      fill(white, 75);
      circle(x, y, d);
    }
  }
  
  void act(){
    if(!AoE){
      x = x + vx;
      y = y + vy;
      if(x > width || x < 0 || y > height || y < 0){
        hp --;
      }
    }
    else if (AoE){
      int i = 0;
      while (i < mobs.size()){
        Mob myMob= mobs.get(i);
        if (dist(x, y, myMob.x, myMob.y) < d/2){
          myMob.hp = myMob.hp - 1.25;
        } 
        i++;
      }
    }
  }
}
