int frameCnt;
int totalElementsInArr;
int nextFreePosition;
int MAX_BACTERIA = 100000;

Bacteria[] bob;
void setup() {
  frameCnt = 0;
  size(500, 500);
  background(0);
  frameRate(10);
  bob = new Bacteria[MAX_BACTERIA];
  totalElementsInArr = 100;
  for (int i = 0; i < totalElementsInArr; i++) {
    bob[i] = new Bacteria();
  }
}
void draw() {
  frameCnt = frameCnt + 1;
  if (frameCnt % 10 == 0) {
    if (totalElementsInArr < MAX_BACTERIA) {
      for (int i = totalElementsInArr; i < totalElementsInArr + 100; i++) {
        bob[i] = new Bacteria();
      }
      totalElementsInArr = totalElementsInArr + 100;
    }
  }
  background(0);
  fill(137, 207, 240);
  for (int i = 0; i < totalElementsInArr; i++) {
    bob[i].move();
    bob[i].show();
  }
  //upper line
  stroke(204,0,0);
  line(150,300,360,300);
  line(150,301,360,301);
  line(150,302,360,302);
  noStroke();
  // body
  fill(204,0,0);
  rect(155,302,200,150,12, 12, 24,24);
  //left hand
  bezier(155,330,125,325,125,365,155,360);
  stroke(0);
  fill(0);
  bezier(155,340,135,335,135,355,155,350);
  line(155,340,155,350);
  //right hand
  fill(204,0,0);
  bezier(355,330,385,325,385,365,355,360);
  stroke(0);
  fill(0);
  bezier(355,340,375,335,375,355,355,350);
  line(355,340,355,350);
  // fire line
  stroke(0,0,255);
  line(155,470,355,470);
  // fire
  noStroke();
  fill(255,255,0);
  for(int i = 0; i < 345-160; i+=10) {
    triangle(i+160,470,i+164,470,i+162,460);
  }
}
void mousePressed() {
  for (int i = 0; i < totalElementsInArr; i++) {
    bob[i].reset();
  }
  totalElementsInArr = 100;
  redraw();
}

class Bacteria {
  int myX, myY;
  int bias; // 0:top, left:1, right: 2
  Bacteria() {
    reset();
  }

  void move() {
    myY = myY - (int)(Math.random()*3)-1;
    if (bias == 0) {
      double rand = (Math.random()*100);
      if (rand < 0.2) {
        bias = 1;
      } else if (rand > 99.8) {
        bias = 2;
      }
    }
    if (bias == 0) {
      myX = myX + (int)(Math.random()*3)-1;
    } else if (bias == 1) {
      myX = myX - (int)(Math.random()*2)-1;
    } else {
      myX = myX + (int)(Math.random()*2)+1;
    }
  }
  void show() {
    ellipse(myX, myY, 10, 10);
  }
  void reset() {
    myY = 320;
    myX = (int)((Math.random()*160)+170);
    bias = 0;
  }
}
