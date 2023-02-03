class FFireFlower extends FGameObject {
  
  boolean fireAbility;
  
  FFireFlower(float x, float y){
    super();
    setPosition(x, y);
    setName("fireflower");
    attachImage(fireFlower);
  }
  
  void act (){
    if (isTouching("player")){
      world.remove(this);
    }
  }
}
