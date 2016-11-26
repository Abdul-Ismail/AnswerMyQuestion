user_input input;
animation ui;
design designUI;
setting set;
help helpOption;
int value = 0;
float[] angle = new float[2]; //used to store angle 
PImage bg;
float timeCounter;
float currentTime;
boolean callOnce = false;
boolean over = false;


void setup() {
  size(1040, 520, P3D);
   bg = loadImage("background.jpg");
  input = new user_input();
  ui = new animation();
  designUI = new design();
  set = new setting();
  helpOption = new help();
}

void draw() {
  background(bg);
  timeCounter = millis() - currentTime;
  ui.increaseSphereSpeed(0);
  ui.decreaseSphereSpeed(0);

  if (value !=10){
     
    angle = ui.circleSpin();
    designUI.circleDesign();
    ui.hoverCircle(mouseX, mouseY, width/2, height/2, 200);
    set.settingButton(0);
  }else    value = ui.loadingScreen();
  
  if (value == 5)
    {
          if( over == false && callOnce == true){       
            designUI.cardScreen();
          }
        if( timeCounter > 7000 && timeCounter < 15000 && callOnce == true){
                 input.rotateCard();
          }else if (timeCounter > 15000 && callOnce == true){
            designUI.removeCardScreen();
            over = true; //stops calling cardscreen once this needs to be called
          }
          
      if (callOnce == false) {
         currentTime = millis();; //sets counter back to zero
         callOnce = true;
      }

    }
  
  if (value == 4) {
    value = ui.loading();
    ui.removeTextScreen();
  }

  if (value == 3)
  {
    value = input.answer();
  }
  
  if (value == 1 || value ==2){
        ui.textScreen();
         input.printText();
  }
   //helpOption.displayHelp();
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
  ui.increaseSphereSpeed(1);
  set.settingButton(1);
  ui.decreaseSphereSpeed(1);


  }
}

  void mouseDragged() 
  {    
        set.colorButton1(1);
        set.colorButton2(1);
        set.colorButton3(1);
  }