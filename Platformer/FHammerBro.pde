class FHammerBro extends FGoomba{
 
  int cooldown, cooldownHammer/*cooldown for hammer*/;
  int thresholdHammer = 100; //cooldown for hammer
  int threshold = 75;
  
  FHammerBro(float x, float y){
    super();
    setPosition(x, y);
    setName("hammerbro");
    setRotatable(false);
  }
  
  void act(){
    animate(hammerBro);
    collide();
    move();
    throwHammer();
  }
  
  void throwHammer(){
    float HammerBroX = getX();
    float HammerBroY = getY();
    cooldown++;
    if (cooldown >= threshold){
      cooldownHammer++;
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(HammerBroX, HammerBroY);
      world.add(b);
      b.setSensor(true);
      b.setAngularVelocity(20);
      b.setVelocity(direction*100, -600);
      b.setName("hammer");
      b.attachImage(hammer);
      if(cooldownHammer >= thresholdHammer){
        world.remove(b);
        cooldownHammer = 0;
      }
      cooldown = 0;
    }
  }
}
