int backgroundColor;

// Runs once on create
void setup(){
  backgroundColor = 0;
  frame.setTitle("Mission 2");
  size(800, 800, P3D);
  background(#C424B4);
}

// Runs once per frame 
void draw(){
  strokeWeight(5);
  line(mouseX,mouseY,pmouseX,pmouseY);
}

// Runs on key pressed
void keyPressed(){
  background(#C424B4);
}

// Runs on mouse clicked
void mousePressed(){
  stroke( random(255), random(255), random(255), 255); 
  switch(backgroundColor){
    case 0:
      background(#424EF4);
      backgroundColor = 1;
      break;
    case 1:
      background(#F442D7);
      backgroundColor = 2;
      break;
    case 2:
      background(#F4DF42);
      backgroundColor = 3;
      break;
    default:
      background(#42F44B);
      backgroundColor = 0;
      break;
  }
}