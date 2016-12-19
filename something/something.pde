PImage bg, behind;
float[] ya, xa;

float ease = 0.1;
int pixelAmount = 4;
int oldDistortWidth = -1;
int distortWidth = 80;

void setup(){
  size(640,720, P3D);
  
  behind = loadImage("after.jpg", "jpg");
  
  bg = loadImage("before.jpg","jpg");
  
  ya = new float[1000000];
  xa = new float[1000000];
  
  initBoxes();
}

void draw(){
  background(behind);
  drawBoxes();
}

void drawBoxes(){
  //println(bg.height);
  int xc = 0;
  int yc = 0;
  for(int y = 0; y < bg.height; y++){
    for(int x = 0; x < bg.width; x++){
      if(x % pixelAmount == 0 && y % pixelAmount == 0){
        fill(bg.pixels[x + (y * bg.width)]);
        stroke(0, 70);
        if(dist(mouseX, mouseY, x, y) < distortWidth){
          float dx = 0; // base case so squares dont fly off screen
          float dy = 0; // they will stop at the distortion width
          if(dist(mouseX, mouseY, xa[xc], ya[yc]) < distortWidth){
            dx = (((xa[xc] - mouseX)) * ease); // go away from mouse in a circle
            dy = (((ya[yc] - mouseY)) * ease);
          } else { // this is where i would put effects on the squares on the edge of the circle
          }
          xa[xc] = xa[xc] + dx;
          ya[yc] = ya[yc] + dy;
          rect(xa[xc], ya[yc], pixelAmount, pixelAmount);
        } else { // this will ease them back into place if theyre not in range of the mouse
          float dx = ((x - xa[xc]) * ease);
          float dy = ((y - ya[yc]) * ease);
          xa[xc] = xa[xc] + dx;
          ya[xc] = ya[yc] + dy;
          rect(xa[xc], ya[yc], pixelAmount, pixelAmount);
        }
        xc++;
        yc++;
      }
    }
  }
}

void initBoxes(){
  int xc = 0;
  int yc = 0;
  for(int y = 0; y < bg.height; y++){
    for(int x = 0; x < bg.width; x++){
      if(x % pixelAmount == 0 && y % pixelAmount == 0){
        xa[xc] = x;
        ya[yc] = y;
        xc++;
        yc++;
      }
    }
  }
}

void keyPressed(){
  if(key == '+' || key == '=')
    distortWidth += 5;
  if((key == '-' || key == '_') && distortWidth > 0)
    distortWidth -= 5;
  if((key == '-' || key == '_') && distortWidth <= 0)
    distortWidth = 1;
  if(key == 'a' && oldDistortWidth == -1){
     oldDistortWidth = distortWidth;
     distortWidth = 0;
  }
  else if(key == 'a' && oldDistortWidth != -1){
    distortWidth = oldDistortWidth;
    oldDistortWidth = -1;
  }
}