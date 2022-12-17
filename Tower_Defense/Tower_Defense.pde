//Tower Defense Game
//David Yao
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAPSELECT = 4;
int map;
int mode;
int lives = 5;
int balance = 10;

//Tower types
final int GUN = 0;
final int AOE = 1;
final int SNIPER = 2;
//Tower costs 
final int[] price = {5, 25, 50};

//Pallette
color red    = #ff0000;
color pink   = #ff7979;
color orange = #ffca3a;
color green  = #8ac926;
color blue   = #1982c4;
color purple = #6a4c93;
color white  = #ffffff;
color black  = #000000;
color grey   = #c6c6c6;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;
boolean building;

//Buttons
Button start;
Button nextWave;
Button build;
Button play;
Button gun;
Button aoe;
Button sniper;
Button startOver;
Button defaultMap;
Button brandonMap;

//Collections of objects
Node[] nodes;
Node[] defaultMapNodes;
Node[] brandonMapNodes;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

//Images and Gifs
Gif introAnimation;
PImage nextWaveImage;
PImage defaultMapImage;
PImage brandonImage;
PImage brandon2Image;

//Fonts
PFont metropolis;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introAnimation = new Gif("Gif/Futuristic City/frame_", "_delay-0.05s.gif", 66, 1, width/2, height/2, width * 1.5, height);
  nextWaveImage = loadImage("Images/start button.png");
  defaultMapImage = loadImage("Images/Screenshot 2022-12-15 014308.jpg");
  brandonImage = loadImage("Images/Brandon2.PNG");
  brandon2Image = loadImage("Images/Brandon.JPG");
  
  //Load Fonts
  metropolis = createFont("fonts/Metropolis-Regular.otf", 20);

  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  
  
  //Test towers
  // towers.add(new Tower(100, 100, 0, 60));
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);
  defaultMap = new Button(defaultMapImage, width/4, height/2, 250, 250, pink, red);
  brandonMap = new Button(brandonImage, width - width/4, height/2, 250, 250, pink, red);

  //PLAY - Next Wave, To Build Mode
  play = new Button("PLAY", 900, 225, 150, 100, white, green);
  nextWave = new Button(nextWaveImage, 900, 100, 150, 100, white, green);

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  build = new Button("BUILD", 900, 225, 150, 100, white, green);
  gun = new Button("GUN", 900, 350, 150, 100, white, blue);
  aoe = new Button("AoE", 900, 475, 150, 100, white, blue);
  sniper = new Button("SNIPER", 900, 600, 150, 100, white, blue);
  

  //GAMEOVER - Reset
  startOver = new Button("restart", width/2, height - height/6, 250, 100, white, black);
}

void makeNodes() {
  //Plot the nodes on the map
  defaultMapNodes = new Node[8];
  defaultMapNodes[0] = new Node(350, 400, 0, 1);
  defaultMapNodes[1] = new Node(350, 600, -1, 0);
  defaultMapNodes[2] = new Node(175, 600, 0, -1);
  defaultMapNodes[3] = new Node(175, 250, 1, 0);
  defaultMapNodes[4] = new Node(675, 250, 0, -1);
  defaultMapNodes[5] = new Node(675, 100, -1, 0);
  defaultMapNodes[6] = new Node(500, 100, 0, 1);
  defaultMapNodes[7] = new Node(500, 550, 1, 0);
  
  brandonMapNodes = new Node[7];
  brandonMapNodes[0] = new Node(0, 525, 1, 0);
  brandonMapNodes[1] = new Node(125, 525, 1, 0.714285);
  brandonMapNodes[2] = new Node(300, 650, 1, 0);
  brandonMapNodes[3] = new Node(500, 650, 1, -1.2);
  brandonMapNodes[4] = new Node(625, 500, 0, -1);
  brandonMapNodes[5] = new Node(625, 350, -0.714285, -1);
  brandonMapNodes[6] = new Node(500, 175, 1, 0);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == MAPSELECT){
    mapSelect();
  }
  
  fill(black);
  textSize(20);
  text(mouseX + ", " + mouseY, mouseX, mouseY-20);
}
