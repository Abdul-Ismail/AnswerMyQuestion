user_input input;
animation ui;
int value = 0;
float[] angle = new float[2]; //used to store angle 
 


void setup() {
 size(1280,640);
 input = new user_input();
 ui = new animation();
}

void draw(){
  angle = ui.circleSpin();
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
      
      if (value ==3)
       {
         input.answer();
       }
 }
 
void mousePressed() {
  value = ui.overCircle(mouseX, mouseY, width/2, height/2, 100);
}