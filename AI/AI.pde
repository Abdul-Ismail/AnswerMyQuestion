user_input input;
int value = 1;


void setup() {
 size(500, 500); 
 input = new user_input();
}

void draw(){
  if (value == 1)
   {
     value = input.ask();
   } 
     
  //if (key == ENTER){
      //input.display();
     // key = 'a';
  // }
}

void keyPressed()
 {
 
 }