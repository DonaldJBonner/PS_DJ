// lol pointer
int x = 0;
PImage neutral, laugh;

int[] xs = new int[0];
int[] ys = new int[0];

int textX, textY;
int randRange = 5;

int timer= 100;
int currentTime = 0;
int savedTime = 0;

void setup(){
 size(1000, 1000, P3D);
 
 textX = width / 2;
 textY = height / 2;
 
 neutral = loadImage("neutral.png", "png");
 laugh = loadImage("xd.png", "png");
 
 textSize(32);
 fill(0);
}

void draw(){
  background(255);
  
  currentTime = millis();
  
  if(currentTime - savedTime > timer){
    textX += (int)random(-randRange, randRange);
    textY += (int)random(-randRange, randRange);
    savedTime = currentTime;
    for(int i = 0; i < xs.length; i++){
      xs[i] += (int)random(-randRange, randRange);
      ys[i] += (int)random(-randRange, randRange);
    }
  }
   
  image(neutral, mouseX - 25, mouseY - 25, 50, 50);
  
  drawFaces();
}

void drawFaces(){
  text("WEEK 5!", textX, textY);
  for(int j = 0; j < xs.length; j++){
    if(xs != null && ys != null){
      float d = dist(mouseX, mouseY, xs[j], ys[j]); 
      float w, h;
      if(d <= 22){
        disco(true);
        for(int i = 0; i < xs.length; i++){
          float d2 = dist(mouseX, mouseY, xs[i], ys[i]);
          w = h = 200 / (d2 / 50);
          if(w > 450){
            w = h = 450;
          } 
          image(laugh, xs[i] - w / 2, ys[i] - h / 2, w, h);
        }
        break;
      } else {
        disco(false);
        w = h = 200 / (d / 50);
        image(neutral, xs[j] - w / 2, ys[j] - h / 2, w, h); 
        image(neutral, mouseX - 25, mouseY - 25, 50, 50);
      }
    } 
  }  
}

void disco(boolean play){
  if(!play)
    return;
  background(random(0,255), random(0,255), random(0,255));
}

void mousePressed(){
  xs = append(xs, mouseX);
  ys = append(ys, mouseY);
}