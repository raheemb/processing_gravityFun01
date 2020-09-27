int frame = 0; // counter for the number of frames elapsed
int cols = 10; // set number of columns in grid
int rows = 10; // set number of rows in grid
GravityBall[] gBalls = new GravityBall[cols*rows]; // array to hold grid of GravityBall objects

void setup() { 
  size(800, 800); // set canvas size
  background(0);
  
  // set anchor point, initial velocity, and particle radius
  PVector anchor = new PVector(0,0);
  PVector vel = new PVector(0,0);
  float rad = 20; 
  
  // set the x and y bound for the particle array
  float maxW = width*2/6;
  float maxH = height*2/6;
  
  // set the boundary colors
  color cInner = color(26, 166, 183);
  color cOuter = color(255, 65, 77);
  
  // generate GravityBall objects in a grid with a gradient of colors
  for (int i=0; i < cols; i++) {
    for (int j=0; j < rows; j++) {
      // set initial position of particle based on column and row
      float x = map(i, 0, cols-1, -maxW, maxW);
      float y = map(j, 0, rows-1, -maxH, maxH);
      PVector pos = new PVector(x,y);
      
      // determine particle color based on distance from central anchor point
      float lerpFactor = map(x*x+y*y, 0, maxW*maxW+maxH*maxH, 0, 1);
      color c = lerpColor(cInner, cOuter, lerpFactor);
      
      // generate new GravityBall object with given properties
      gBalls[j+i*cols] = new GravityBall(anchor, pos, vel, c, rad);
    }
  }
}

void draw() {  
  translate(width/2, height/2); // Translate to center the sketch in the frame
  frame++;
  rotate(0.1*(frame/180.0)*PI); // Rotate the canvas with each frame
  
  // Iterate through all balls and update their positions
  for (GravityBall g : gBalls) g.update();
  
  // Uncomment to save the frames as png files, use the frame counter and if statement 
  // to set the length of your animation. 
  //saveFrame("frames/#######.png");
  //if (frame >= 1800) exit();
}
