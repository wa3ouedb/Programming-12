class FGameObject extends FBox{
  
  final int L = -1; 
  final int R = 1;
  int x, y;

  FGameObject(){
    super(gridSize, gridSize);
  }
  
  FGameObject(int w, int h){
    super(w, h);
  }
  
  void act(){
  }
    
  void reset(int x, int y){
    setPosition(x, y);
  }
  
  boolean isTouching(String n){
    ArrayList <FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++){
      FContact fc = contacts.get(i);
      if (fc.contains(n)){
        return true;
      }
    }
    return false;
  }
  
  void playerTakeDamage(){
    player.lives--;
    player.reset(x, y);
    if (player.lives <= 0){
      //game over
    }
  }
}
