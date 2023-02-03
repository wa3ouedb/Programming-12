class FTunnel extends FGameObject{
  
  FTunnel(float x, float y){
    super();
    act(x, y);
  }
  
  
  void act(float x, float y){
    FBox f = new FBox(x*gridSize, y*gridSize);
    world.add(f);
    f.setName("tunnel");
    f.setSensor(false);
    f.setStatic(true);
    f.attachImage(tunnel);
    f.setPosition(x, y);

  }
  
  void enterPlayer(){
    if (player.getY() < getY()-gridSize/2 && sKey){
      this.setSensor(true);
      println("nextWorld");
      //loadWorld(map2);
    }
  }
}
