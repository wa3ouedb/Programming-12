class FLava extends FGameObject{
  //instance variables
  int x, y; 
  float speed;
  String before, after;
  //Gif Instance variables
  int numberOfFrames, f;
  PImage[] gif;
  
  FLava (float x, float y){
    super();
    setPosition(x, y);
    setName("lava");
    numberOfFrames = 6;
    before = "Game/lava(";
    after = ").png";
    speed = 6;
    load();
    setStatic(true);
    setSensor(true);
  }
    
  void load(){
    gif = new PImage[numberOfFrames];
    
    for(int i = 1; i < numberOfFrames; i++){
      gif[i] = loadImage(before + i + after);
    }
  }
  
  void act(){
    int x = (int)random(1,5);
    if(f == numberOfFrames) f = x;
    attachImage(gif[f]);
    if (frameCount % speed == 0) f++;
  }
}
