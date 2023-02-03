class FThwomp extends FGameObject{
 
  FThwomp(float x, float y){
    super(gridSize*2, gridSize*2);
    setPosition(x + gridSize/2, y + gridSize/2);
    attachImage(thwomp[0]); //regular
    setStatic(true);
    setRotatable(false);
    setSensor(false);
    setName("thwomp");
  }
  
  void act(){
    float thwompX = getX();
    float thwompY = getY();
    if(player.getX() >= thwompX - gridSize/1.25 && player.getX() <= thwompX + gridSize/1.25
    && player.getY() > thwompY && player.getY() < thwompY + gridSize*4.5){
      setStatic(false);
      setSensor(true);
      attachImage(thwomp[1]); //angry
    }
    if(isTouching("player")){
      if(player.getX() >= thwompX - gridSize/1.25 && player.getX() <= thwompX + gridSize/1.25 && player.getY() >= getY()+gridSize/2){
        playerTakeDamage();
        setSensor(true);
      }
    }
    setSensor(false);
  }
}
