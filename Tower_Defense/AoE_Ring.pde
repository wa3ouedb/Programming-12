//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a 
//short period of time.


//I ended up scrapping my AoE class
class AoE_Ring {
  float d;
  float x, y;
  
  AoE_Ring(float _x, float _y, float _d){
    x = _x;
    y = _y;
    d = _d;
  }
  
}
