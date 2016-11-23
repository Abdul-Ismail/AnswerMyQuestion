class design{
 float angle1 = 0;
float angle2 = 0;
int button1=0;
int button2=0;
PShape screen;

design(){
  screen = createShape(RECT, 70, 200, 150, 250); 
}

void circleDesign(){
  
  noFill();

  strokeWeight(2);
  ellipse(width/2, height/2, 175, 175);
  noFill();

  strokeWeight(2);
  ellipse(width/2, height/2, 325, 325);
  
  //button1 
  ellipse(600,180,35,35);
  if (overButton(600, 180, mouseX, mouseY, 17.6)){
      //
    }else //
    
      if (button1 == 1){
          //println("SSSasasasssSSSSS");
      }else { //println("DDDDDD");
      }
    
      //button2 
  ellipse(560,155,35,35);
  if (overButton(560, 155, mouseX, mouseY, 35)){
      background(0);
    }else //
    
    if (button2 == 1){
         // println("SSSSSSSS");
      }else {// println("DDDDDD");
      }
    

    

  
    
  strokeWeight(2);

   arc(width/2, height/2, 185, 185,  0, HALF_PI/2);
   line(613, 261, 640, 260);
   line(587, 326, 605, 345 );
   arc(width/2, height/2, 240, 240,  0, HALF_PI/2);
   
   
   arc(width/2, height/2, 185, 185, HALF_PI, PI);
   line(428, 262, 392, 263);
   line(521, 355, 520, 390 );
   arc(width/2, height/2, 260, 260, HALF_PI, PI);


  pushMatrix();
    translate(width/2, height/2);
       rotate(radians(angle1));
       angle1++;
  
  arc(width/2, height/2, 325, 325, 0, HALF_PI);
  noFill();
  
  strokeWeight(5);
  arc(0, 0, 345, 345, HALF_PI, PI);
  
  strokeWeight(20);
  arc(0, 0, 365, 365, PI+QUARTER_PI, TWO_PI);
  
     rotate(radians(angle2));
       angle2-=2;
     strokeWeight(2);
    arc(0, 0, 395, 395, 0, HALF_PI);
    popMatrix(); 
}

boolean overButton(float circleCenterX, float circleCenterY, float x, float y, float diameter) {
    boolean onCircle;
    float disX = circleCenterX - x;
    float disY = circleCenterY - y;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return onCircle = true;
    } else return onCircle = false;
  }
  
  //if button one is clicked foloowing operation will be done
      void button1Clicked() {
    boolean Button1clicked = overButton(600, 180, mouseX, mouseY, 50);
    if (Button1clicked == true)
    {
       if (button1 == 1){
             button1 =0;
      }else  button1 = 1;
    } 
  }
  
        void button2Clicked() {
    boolean Button2clicked = overButton(560, 155, mouseX, mouseY, 50);
    if (Button2clicked == true)
    {
      if (button2 == 1){
             button2 =0;
      }else  button2 = 1;

    } 
  }
  
  void textScreen(){
    screen.setFill(color(0));
    shape(screen);
    pushStyle();
    strokeWeight(5);
    rect(70, 200, 150, 250,7);
    pushStyle();
 
  }


}