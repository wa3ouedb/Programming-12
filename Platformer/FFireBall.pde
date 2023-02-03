class FFireBall extends FGameObject{
  
  boolean fireAbility;
  float cooldown;
  float threshold = 25;
  int hp;
  
  FFireBall(float x, float y){
    super();
    x = player.getX();
    y = player.getY();
    act(x, y);
    hp = 1;
    collide();
  }
  
  FFireBall(){
  }
  
  void act(float x, float y){
    FCircle f = new FCircle(gridSize/2);
    f.setSensor(true);
    f.setVelocity(player.direction*500, -150);
    fireball.resize(gridSize/2, gridSize/2);
    f.setName("fireball");
    f.attachImage(fireball);
    f.setPosition(x, y);
    world.add(f);     
  }
  
  void collide(){
    cooldown++;
    if(cooldown >= threshold){
      world.remove(this);
      println("removetimer");
      cooldown = 0;
    }
    if(isTouching("goomba")){
      println("removehitgoomba");
      world.remove(this);
    }
  }
}
