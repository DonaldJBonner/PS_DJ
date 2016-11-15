int x;
int y;

void setup(){
  frame.setTitle("Mission 1");
  size(1080, 720);
  x = width / 2;
  y = height / 2;
}

void draw() {
  stroke(random(0,255), random(0,255), random(0,255));
  line(x, y, random(0,width), random(0,height));
}

void mouseClicked(){
  x = mouseX;
  y = mouseY;
}