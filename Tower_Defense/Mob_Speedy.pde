class SpeedyMob extends Mob {
  
  SpeedyMob(float _x, float _y, float _vx, float _vy){
    super(_x, _y, _vx, _vy);
    d = 30;
    maxhp = 8 + waveNumber*2;
    hp = maxhp;
    value = 3;
    fillColor = black;
    strokeColor = white;
    speed = 3.5 + waveNumber*0.15;
  }
}
