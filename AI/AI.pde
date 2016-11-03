user_input input;


void setup() {
 size(500, 500); 
 input = new user_input();
}

void draw(){

  if (key == ENTER){
      input.display();
      key = 'a';
   }
}

void keyPressed()
 {
   input.ask();
 }