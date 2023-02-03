import fisica.*;
FWorld world; 

/* questions + issues: 

MAJOR: 

- null pointer on creating map selection 
  - after removing loadWorld(map) from setup function to mapSelect(){}
  - images on map selection not appearing
- button images load after game over
  
- hammer and fireball not dissapearing 

minor: 
- firecharacter and lava remove white background


*/

//color pallete  ========================================================================================================
color white   = #FFFFFF;
color pink    = #FF00FF; //hammerBro
color black   = #000000; //stone
color cyan    = #00FFFF; //ice
color green   = #00FF00; //tree
color lGreen  = #92FF64; //tunnel
color red     = #FF0000; //lava
color purple  = #AF00FF; //fire flower
color blue    = #0000FF; //thwomp
color lBrown  = #F0A000; //falling bridge
color orange  = #FF7D00; //goomba
color yellow  = #FFF200; //trampoline
color dGrey   = #333333; //wall
color grey    = #777777; //spike
color brown   = #FF9500; //trunk 
color yGreen  = #94FF00; //checkPoint not done yet
color lBlue   = #C6F3FF; //blue sky
color yellow2 = #FFCC64; //sun border


//mode framework ========================================================================================================

final int INTRO     = 0;
final int PLAY      = 1;
final int MAPSELECT = 2;
final int GAMEOVER  = 3;
int mode;

//mouse interaction variables ===========================================================================================

boolean mouseReleased;
boolean wasPressed;

// Buttons ==============================================================================================================

Button start;
Button startOver;
Button easyMode;
Button hardMode;

//fonts =================================================================================================================
PFont retro;

//Images ================================================================================================================

//--> terrain
PImage map, map2, ice, treeTrunk, stone, leavesTrunk, leftLeaves, rightLeaves, centerLeaves, spike, trampoline, bridge, fireFlower, tunnel;

//--> items and objects
PImage hammer;
PImage heart;
PImage checkPoint;
PImage fireball;

//--> buttons
PImage EZMode;
PImage HRDMode;

//--> main character animations
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] blink;
PImage[] action;

//costume with fire flower
PImage[] idleFire;
PImage[] jumpFire;
PImage[] runFire;
PImage[] blinkFire;
PImage[] actionFire;


//--> mob array animations
PImage[] goomba;
PImage[] thwomp;
PImage[] hammerBro;

//other images and Gifs
Gif introAnimation;
Gif clouds;
Gif gameOver;
Gif win;

//variables =============================================================================================================

// keyboard booleans
boolean wKey, aKey, sKey, dKey, upKey, downKey, leftKey, rightKey, spaceKey; 

// objects + lists of objects
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
ArrayList<FFireBall>   fireballs;
FPlayer player;

// map controls 
int gridSize = 32;
float zoom = 1.75;

//=======================================================================================================================
void setup(){
  size(1280, 720);
  Fisica.init(this);
  terrain   = new ArrayList <FGameObject>();
  enemies   = new ArrayList <FGameObject>();
  fireballs = new ArrayList <FFireBall>();
  initializeModes();
  loadImages();
  loadWorld(map);
  makeButtons();
  loadPlayer();
  
  // map.get(0, 0); //PImage function, gets color of the indicated pixel on the "map" object
  // map.width; //tells width of the image
  // map.height; //tells the height of the image
}

void initializeModes(){
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}


// load images + Gifs =================================================================================================

void loadImages(){
 
  // terrain -----------------------------------------------------------
  
  map = loadImage("Maps/Platformer_Testing.png");
  map2 = loadImage("Maps/map2.png");
  ice = loadImage("Game/ice.png");
  ice.resize(32, 32);
  stone = loadImage("Game/stone.png");
  treeTrunk = loadImage("Game/tree_trunk.png");
  leavesTrunk = loadImage("Game/green_trunk.png");
  leftLeaves = loadImage("Game/left_leaves.png");
  rightLeaves = loadImage("Game/right_leaves.png");
  centerLeaves = loadImage("Game/center_leaves.png");
  spike = loadImage("Game/spike.png");
  trampoline = loadImage("Game/trampoline.png");
  bridge = loadImage("Game/bridge.png");
  fireFlower = loadImage("Game/fireflower.png");
  tunnel = loadImage("Game/tunnel.png");
 
  // enemies ------------------------------------------------------------
  
  //--> goomba
  goomba = new PImage[2];
  goomba[0]    = loadImage("Game/goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1]    = loadImage("Game/goomba1.png");
  goomba[1].resize(gridSize, gridSize);
  
  //--> thwomp
  thwomp = new PImage[2];
  thwomp[0]    = loadImage("Game/thwomp0.png");
  thwomp[1]    = loadImage("Game/thwomp1.png");
  
  //--> hammerbro
  hammerBro    = new PImage[2];
  hammerBro[0] = loadImage("Game/hammerbro0.png");
  hammerBro[1] = loadImage("Game/hammerbro1.png");

  // game objects ------------------------------------------------------
  
  //--> hammer
  hammer       = loadImage("Game/hammer.png");
  heart        = loadImage("Game/heart.png");
  fireball     = loadImage("Game/fireball.png");
  
  //button images -------------------------------------------------------
  
  EZMode= loadImage("Buttons/EZmode.jpg");
  HRDMode = loadImage("Buttons/Impossiblemode.jpg");
  
  // load player actions ------------------------------------------------
  
  //--> default
  idle         = new PImage[1];
  idle[0]      = loadImage("Game/idle0.png");
  
  blink        = new PImage[1];
  blink[0]     = loadImage("Game/idle1.png"); //blink
  
  jump         = new PImage[1];
  jump[0]      = loadImage("Game/jump0.png");
  
  run          = new PImage [3];
  run[0]       = loadImage("Game/run0.png");
  run[1]       = loadImage("Game/run1.png");
  run[2]       = loadImage("Game/run2.png");
  
  
  //--> fire flower effect
  idleFire     = new PImage[1];
  idleFire[0]  = loadImage("Game/idlefire0.png");
  
  blinkFire    = new PImage[1];
  blinkFire[0] = loadImage("Game/idlefire1.png"); //blink
  
  jumpFire     = new PImage[1];
  jumpFire[0]  = loadImage("Game/jumpfire0.png");
  
  runFire      = new PImage [3];
  runFire[0]   = loadImage("Game/runfire0.png");
  runFire[1]   = loadImage("Game/runfire1.png");
  runFire[2]   = loadImage("Game/runfire2.png");
  
  action = idle;
  
// load fonts -----------------------------------------------------------

  retro = createFont("Fonts/PixeloidSansBold-GOjpP.ttf", 20);
  
// load GIFS ------------------------------------------------------------

  introAnimation = new Gif("Gifs/Intro/frame_", "_delay-0.1s.gif", 36, 3, width/2, height/2, width, height);
  clouds = new Gif("Gifs/Clouds/frame_", "_delay-0.5s.gif", 75, 5,0 , 0, width, height/1.5);
  gameOver = new Gif("Gifs/GameOver/frame_", "_delay-1s.gif", 2, 5, 0, 0, width, height);
  win = new Gif("Gifs/Win/frame_", "_delay-0.03s.gif", 35, 3, 0, 0, width, height);

}
//===================================================================================================================================
void makeButtons(){
  start = new Button("START", width/2, 3*height/4 - height/5, width*0.16, height*0.09, white, black);
  startOver = new Button("restart", width/2, height - height/6, 250, 100, white, black);
  easyMode = new Button(EZMode, 2*width/3, 1*height/5, width/3, height/3, white, black);
  hardMode = new Button(HRDMode, 2*width/3, 4*height/6, width/3, height/3, white, black);
}

//===================================================================================================================================
void loadPlayer(){
  player = new FPlayer();
  world.add(player);
}

void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  for(int y = 0; y < img.height; y++){
    for (int x = 0; x < img.width; x++){
      color c = img.get(x, y);   //color of current pixel
      color s = img.get(x, y+1); //color below current pixel
      color w = img.get(x-1, y); //color west of current pixel
      color e = img.get(x+1, y); //color east of current pixel
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c == black) { //stone 
        b.attachImage(stone);
        b.setFriction(5);
        b.setName("stone");
        world.add(b);
      }
      if (c == dGrey){ //wall
        b.attachImage(stone);
        b.setFriction(5);
        b.setName("wall");
        world.add(b);
      }
      if (c == cyan) { //ice
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      }
      if (c == brown){ //trunk
        b.attachImage(treeTrunk);
        b.setFriction(5);
        b.setSensor(true);
        b.setName("tree trunk");
        world.add(b);
      }
      if(c == green){ //leaves
      b.setFriction(3);
        if(w == green && e == green){ //middle leaves
        b.attachImage(centerLeaves);
        world.add(b);
        if(s == brown){ //intersection
          b.attachImage(leavesTrunk);
          b.setName("treetop");
          world.add(b);
          }
        }
        else if(w == green){ //right leaves
          b.attachImage(rightLeaves);
          b.setName("right leaves");
          world.add(b);
        }
        else if(e == green){ //left leaves
          b.attachImage(leftLeaves);
          b.setName("left leaves");
          world.add(b);
        }
      }
      if(c == grey){ //spike
        b.attachImage(spike);
        b.setName("spike");
        b.setSensor(true);
        b.setStatic(true);
        world.add(b);
      }
      if (c == yellow){ //trampoline
        b.attachImage(trampoline);
        b.setName("trampoline");
        b.setFriction(0);
        b.setStatic(true);
        b.setSensor(true);
        world.add(b);
      }
      if (c == lBrown){ //falling bridge
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
        b.setFriction(5);
      }
      if (c == red){ //lava
        FLava br = new FLava(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      }
      if (c == orange){ //goomba
        FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb); 
        world.add(gmb);
      }
      if (c == blue){ //thwomp
        FThwomp twp = new FThwomp(x*gridSize, y*gridSize);
        twp.setFriction(4);
        terrain.add(twp);
        world.add(twp);
      }
      if ( c == pink){ //hammerBro
        FHammerBro hb = new FHammerBro(x*gridSize, y*gridSize);
        enemies.add(hb);
        world.add(hb);
      }
      if ( c == purple){ //fireFlower
        FFireFlower ff = new FFireFlower(x*gridSize, y*gridSize);
        terrain.add(ff);
        world.add(ff);
        ff.setStatic(true);
      }
    }
  }
}

void draw() {
  click();
  if (mode == INTRO){
    intro();
  } else if (mode == PLAY){
    play();
  } else if (mode == GAMEOVER){
    gameOver();
  } else if (mode == MAPSELECT){
    mapSelect();
  }
}
