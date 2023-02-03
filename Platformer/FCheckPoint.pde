class FCheckPoint extends FGameObject{
  
  FCheckPoint(float x, float y){
    super();
    setPosition(x, y);
    setStatic(true);
    setName("checkPoint");
  }
  
  void act(){
    if (isTouching("player")){
      reset((int)this.getX(), (int)this.getY());
    }
  }
  
}
