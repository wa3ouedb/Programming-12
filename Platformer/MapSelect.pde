void mapSelect(){
  background(white);
  easyMode.show(); //top
  fill(black);
  textSize(25);
  text("Easy Mode", width/3, 1*height/5);
  textSize(25);
  text("Impossible", width/3, 4*height/6);
  hardMode.show(); //bottom
  if (easyMode.clicked){
    //loadWorld(map);
    mode = PLAY;
  }
  else if (hardMode.clicked){
    //loadWorld(map2);
  }
}
