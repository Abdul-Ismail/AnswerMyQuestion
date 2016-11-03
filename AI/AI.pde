user_input input;
int value = 0;


void setup() {
 size(500, 500); 
 input = new user_input();
}

void draw(){

}

void keyPressed()
 {
     if (value == 1)
   {
     value = input.ask();
   } 
     
     if (value == 2)
      {
        input.question();
      }
 }
 
 void mousePressed() {
   if (mouseX < width/2)
   {
     value =1;
   }
 }