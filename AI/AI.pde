user_input input;
animation ui;
timeUI time;
design designUI;
int value = 0;
float[] angle = new float[2]; //used to store angle 
float timeDistance;
float timeX= 100;
float timeY= 120;

void setup() {
  size(1040, 520, P3D);
  input = new user_input();
  ui = new animation();
  time = new timeUI();
  designUI = new design();
}

void draw() {
  background(0);
  
  ui.hoverCircle(mouseX, mouseY, width/2, height/2, 100);
  
  //if (value == 10 ) {
   // value = ui.loadingScreen();
 // }else
  if (value !=10 && value!=5){
    angle = ui.circleSpin();
    //timeDistance = time.timeDisplay(timeX, timeY);
    designUI.circleDesign();
  }else   {input.rotateCard();
  }
  
  if (value == 4) {
    value = ui.loading();
  }

  if (value == 3)
  {
    value = input.answer();
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

  void mouseDragged() 
  {
    if (timeDistance > 70 && timeDistance < 90) {

      timeX = mouseX;
      timeY = mouseY;
    }
  }