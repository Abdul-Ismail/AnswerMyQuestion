user_input input;
animation ui;
int value = 10;
float[] angle = new float[2]; //used to store angle 

void setup() {
  size(1040, 520, P3D);
  input = new user_input();
  ui = new animation();
}

void draw() {
  background(0);
 
  
  ui.hoverCircle(mouseX, mouseY, width/2, height/2, 100);
  
  if (value == 10) {
    value = ui.loadingScreen();
  }else  angle = ui.circleSpin();
  
  if (value == 4) {
    value = ui.loading();
  }

  if (value == 3)
  {
    value = input.answer();
  }
  
    if (value == 5)
  {
    input.rotateCard();
  }
}

void keyPressed()
{
  if (value == 1)
  {
    value = input.ask();
  } 

  if (value == 2)
  {
    value = input.question();
  }
}

void mousePressed() {
  if (value != 10){
  value = ui.circleClicked(mouseX, mouseY, width/2, height/2, 160);
  }
}