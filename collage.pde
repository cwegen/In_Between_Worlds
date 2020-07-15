int currentFrame = 0;
int numFrames = 1440;

int skyY = -2200;
int groundY = -2630;

int framesSaturn = 0;
int saturnY = -381;
boolean saturnToggle = true;

int framesEarth = 0;
int earthY = -500;
boolean earthToggle = true;

int framesMoths = 0;
int mothsY = -40;
boolean mothsToggle = true;

int framesFish = 0;
int fishY = -540;
int fishX = 1;
boolean fishToggle = true;


PImage sky;
PImage ground;
PImage[] fish = new PImage[300];
PImage[] sushi = new PImage[300];
PImage[] moths = new PImage[240];
PImage[] butterflies = new PImage[240];
PImage[] saturn = new PImage[24];
PImage[] cake = new PImage[24];
PImage[] earth = new PImage[24];
PImage[] cupcake = new PImage[24];

void setup() {
  size(1920,1080);
  frameRate(24);
  loop();
  
  //load all img-data
  for (int i = 1; i <= 300; i++) {
     fish[i-1] = loadImage("fish/" + nf(i, 4) + ".png");
     sushi[i-1] = loadImage("sushi/" + nf(i, 4) + ".png");
  }
  
  for (int i = 11; i <= 250; i++) {
    moths[i-11] = loadImage("moths/" + nf(i, 4) + ".png");
    butterflies[i-11] = loadImage("butterflies/" + nf(i, 4) + ".png");
  }
  
  for (int i = 0; i < 24; i++) {
    saturn[i] = loadImage("saturn_" + nf(i, 3) + ".png");
    cake[i] = loadImage("test_" + nf(i, 3) + ".png");
    earth[i] = loadImage("earth_" + nf(i, 3) + ".png");
    cupcake[i] = loadImage("cupcake_" + nf(i, 3) + ".png");
  }
  
  ground = loadImage("background_ground.png");
  sky = loadImage("background_sky.png");

}

void draw() {
  background(0);
  
  image(sky, 0, skyY);
  image(ground, 0, groundY);
  
  currentFrame++;
  
  //play saturn animation
  if (currentFrame > 400 && currentFrame < 1106) {
    if (saturnToggle == true)
      image(saturn[framesSaturn], 100, saturnY);
    if (saturnToggle == false)
      image(cake[framesSaturn], 100, saturnY);      
    framesSaturn++;
    saturnY += 2;
    
    if (framesSaturn > 23)
    framesSaturn = 0;
  }
  
  //play earth animation
  if (currentFrame > 550 && currentFrame < 1256) {
    if (earthToggle == true)
      image(earth[framesEarth], 1200, earthY); 
    if (earthToggle == false)
      image(cupcake[framesEarth], 1200, earthY);
    framesEarth++;
    earthY += 2;
    
    if (framesEarth > 23)
    framesEarth = 0;
  }
  
  //play moths animation
  if (currentFrame > 0 && currentFrame < 706) {
    if (mothsToggle == true)
      image(moths[framesMoths], 50, mothsY);
    if (mothsToggle == false)
      image(butterflies[framesMoths], 50, mothsY);
    framesMoths++;
    mothsY += 3;
    
    if (framesMoths > 239)
      framesMoths = 0;
  }
  
  //play fish animation
  if (currentFrame > 100 && currentFrame < 806) {
    if (fishToggle == true)
      image(fish[framesFish], 1920 - fishX, fishY);
    if (fishToggle == false)
      image(sushi[framesFish], 1920 - fishX, fishY);
    framesFish++;
    fishX += 11;
    fishY += 2.7;
    
    if (fishX > 2800)
      fishX = 1;
    if (framesFish > 299)
      framesFish = 250;
  }
  
  //move for scrolling parallax-effect
  groundY += 3;
  skyY += 1.5305;
  
  //reset data when scrolling finished
  if (skyY >= 0) {
    skyY = -2200;
    groundY = -2630;
    currentFrame = 0;
    saturnY = -381;
    earthY = -500;
    mothsY = -40;
    fishY = -540;
    fishX = 1;
    framesFish = 0;
  }
  
  
  
}

void mousePressed() {
  
  //make saturn clickable
  if (mouseY < (saturnY + 400) && mouseY > saturnY && mouseX > 100 && mouseX < 900 && currentFrame > 400 && currentFrame < 1106) {
    if (saturnToggle == true)
      saturnToggle = false;
    else
      saturnToggle = true;
  }
    
  //make earth clickable
  if (mouseY < (earthY + 500) && mouseY > earthY && mouseX > 1200 && mouseX < 1650 && currentFrame > 550 && currentFrame < 1256) {
    if (earthToggle == true)
      earthToggle = false;
    else
      earthToggle = true;
  }
  
  //make moths clickable
  if (mouseY < (mothsY + 790) && mouseY > mothsY && mouseX > 50 && mouseX < 1000 && currentFrame > 0 && currentFrame < 706) {
    if (mothsToggle == true)
      mothsToggle = false;
    else
      mothsToggle = true;
  }
  
  //make fish clickable
  if (mouseY < (fishY + 540) && mouseY > fishY && mouseX > (1920 - fishX) && mouseX < (2880 - fishX) && currentFrame > 100 && currentFrame < 806) {
    if (fishToggle == true)
      fishToggle = false;
    else
      fishToggle = true;
  }

}
