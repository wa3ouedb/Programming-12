void mapSelect(){
  background(black);
  fill(white);
  textSize(50);
  text("SELECT MAP", width/2, height/5);
  defaultMap.show();
  brandonMap.show();
  if (defaultMap.clicked){
    map = 1;
    nodes = defaultMapNodes;
    mode = PLAY;
  }
  if (brandonMap.clicked){
    map = 2;
    nodes = brandonMapNodes;
    mode = PLAY;
  }
}
