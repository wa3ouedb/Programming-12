class FGoomba extends FGameObject{
  
  int direction = L;
  int speed = 50;
  int frame = 0;
  
  FGoomba(float x, float y){
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }
  
  FGoomba(){
  }
  
  void act(){
    animate(goomba);
    collide();
    move();
  }
  
  void animate(PImage[] mob){
    if (frame >= mob.length) frame = 0;
    if (frameCount % 5 == 0){
      if (direction == R) attachImage(mob[frame]);
      if (direction == L) attachImage(reverseImage(mob[frame]));
      frame++;
    }
  }
  
  void collide(){
    if (isTouching("wall")){
      direction *= -1;
      setPosition(getX() + 0.5*direction + direction, getY());
    }
    if (isTouching("player")){
      if (player.getY() < getY()-gridSize/2){
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        playerTakeDamage();
      }
    }
    if(isTouching("fireball")){
      world.remove(this);
      enemies.remove(this);
    }
  }
  
  void move(){
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
