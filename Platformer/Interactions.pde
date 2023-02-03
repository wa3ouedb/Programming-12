void keyPressed(){
  if(key == 'w' || key == 'W') wKey = true;
  if(key == 'a' || key == 'A') aKey = true;
  if(key == 's' || key == 'S') sKey = true;
  if(key == 'd' || key == 'D') dKey = true;
  if(key == ' ') spaceKey = true;
  if(keyCode == UP)    upKey    = true;
  if(keyCode == DOWN)  downKey  = true;
  if(keyCode == LEFT)  leftKey  = true;
  if(keyCode == RIGHT) rightKey = true;
}
void keyReleased(){
  if(key == 'w' || key == 'W') wKey = false;
  if(key == 'a' || key == 'A') aKey = false;
  if(key == 's' || key == 'S') sKey = false;
  if(key == 'd' || key == 'D') dKey = false;
  if(key == ' ') spaceKey = false;
  if(keyCode == UP)    upKey    = false;
  if(keyCode == DOWN)  downKey  = false;
  if(keyCode == LEFT)  leftKey  = false;
  if(keyCode == RIGHT) rightKey = false;
}

boolean TouchingSurface(FPlayer player){
  ArrayList<FContact> contactList1 = player.getContacts();
  if (0 < contactList1.size()){
    return true;
    }
  return false;
}
