// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/IKB1hWWedMk

int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;

float[][] terrain;

void setup() {
  println("tata");
  size(1000, 1000, P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
}


void draw() {

  flying -= 0.1;

  float yoff = flying;
  float xoff = 0;
  for (int y = rows-1; y >0; y--) {
    xoff = 0;                                
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = terrain[x][y-1];
    }
  }

  for (int x = 0; x < cols; x++) {
    terrain[x][0] = map(noise(xoff, yoff), 0, 1, -100, 100);
    xoff += 0.1;
  }
  yoff += 0.05;

  background(0);
  stroke(255);
  noFill();

  translate(width/2,height/2-100);
  rotateX(PI/2.5);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}

//function setup() {
//            createCanvas(windowWidth, windowHeight);
//            background(100);
//}

//function draw() {
//            ellipse(mouseX, mouseY, 20, 20);
//}
