class FPlayer extends FGameObject {
  
  int frame;
  int direction;
  int lives;
  int maxLives;
  int cooldown;         //blink cooldown
  int threshold1 = 150; //blink
  int threshold2 = 125;  //shoot fireball
  boolean fireAbility;
  boolean clicked;
  
  FPlayer(){
    super();
    frame = 0;
    direction = R;
    setPosition(0, 0);
    setName("player");
    setRotatable(false);
    setFillColor(red);
    maxLives = 3;
    lives = maxLives;
  }
  
  void act(){
    handleInput();
    collisions();
    animate();
  }
  
  void collisions(){
    if (isTouching("spike")){
      playerTakeDamage();
    }
    if (isTouching("trampoline")){
      setVelocity(0, -650);
    }
    if(isTouching("lava")){
      playerTakeDamage();
    }
    if(isTouching("hammer")){
      playerTakeDamage();
    }
    if(isTouching("fireflower")){
      lives = 4;
      fireAbility = true;
    }
  }
  
  void handleInput(){
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (lives < 4){
      fireAbility = false;
    }
    if (abs(vy) < 0.1){
      action = idle;
      if(fireAbility) action = idleFire;
    }
    if (aKey) {
      setVelocity(- 200, vy);
      direction = L;
      action = run;
      if(fireAbility) action = runFire;
    }
    if (sKey) {
      setVelocity(vx, vy + 30);
    }
    if (dKey) {
      setVelocity(200, vy);
      direction = R;
      action = run;
      if (fireAbility) action = runFire;
    }
    if(TouchingSurface(player)){
      if (wKey) {
        setVelocity(vx, -350);
      }
    }
    if (abs(vy) > 75){
      action = jump;
      if (fireAbility) action = jumpFire;
    }
    if (spaceKey){
      float playerX = player.getX();
      float playerY = player.getY();
      if(fireAbility){
        if (cooldown >= threshold2){
          fireballs.add(new FFireBall(playerX, playerY));
          cooldown = 0;
        }
        cooldown++;
      }
    }
  }
  
  void animate(){
    if (frame >= action.length) frame = 0;
    cooldown++;
    if (cooldown >= threshold1){
      frame = 0;
      action = blink;
      if (fireAbility) action = blinkFire;
      attachImage(action[0]);
      cooldown = 0;
    }
    if (frameCount % 5 == 0){
      if (direction == R) {
        attachImage(action[frame]);
      }
      if (direction == L) {
        attachImage(reverseImage(action[frame]));
      }
    }
    frame++;
  }
}
