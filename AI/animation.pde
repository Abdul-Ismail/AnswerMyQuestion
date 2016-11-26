class animation {
  user_input input2;
  int nextCall;
  PShape button;
  PGraphics load;
  float loadingAngle = 270;
  int size = 250;
  boolean hover;
  int loadingScreenSpeech = 0;
  PShape screen;
  int rectY = 0;
  float speedButtonX = 50;
  float sphereAngle;
  float sphereSpeed = 1;


  animation() {
    input2 = new user_input();
    load = createGraphics(width+50, height+160);
    button = createShape(SPHERE, 80); // main circle in screen, will be accessed by other functions
      screen = createShape(RECT, 70, 200, 150, 250); 
  }

  float[] circleSpin() {
    int x = width/2;
    int y = height/2;
    float newx, newy;
    int radius =50;
    float speed = 2;
    noFill();
    //stroke(69, 298, 208);

   /* for (int i = 0; i<2; i++)
    {
      newx = mouseX + cos(radians(angle[i]))*30;
      newy = mouseY +sin(radians(angle[i]))*(30);
      if (i == 0) {  
        angle[i] += speed;
      } else {  
        angle[i] -= speed;
      }
      ellipse(newx, newy, 12, 12);
    }*/

    pushMatrix();
    translate(width/2, height/2);
    rotateX(radians(sphereAngle));
    rotateY(radians(sphereAngle));
    sphereAngle +=sphereSpeed;
    if (hover != true){ //if mouse is not over sphere display this color   
         button.setFill(color(255, 0, 0));
    }
    button.setStroke(color(69, 298, 208));
    sphereDetail(100);
    shape(button);
    popMatrix();
   
    return angle;
  }
  
  void sphereSpeed(int i){
    ellipse(speedButtonX,50,10,10);
    line(40,50, 110, 50);
        if (overCircle(speedButtonX, 50,mouseX, mouseY,10)){
         
      
          if (i ==1){
            if (mouseX >= 50 && mouseX <= 100)
            {
            speedButtonX = mouseX;
            sphereSpeed = speedButtonX /10;

            }
          }
        }  
  }

  int loadingScreen() {
     if (loadingScreenSpeech ==0 ){
       input2.speech("My name is Jarvis and I am here to assist you");
       loadingScreenSpeech += 1;
     }
    stroke(69, 298, 208);
    fill(color(255, 0, 0));
    pushMatrix();
    translate(width/2, height/2);
    rotateX(radians(frameCount*1));
    rotateY(radians(frameCount*1));
    sphereDetail(100);
    sphere(size);
    size-=0.5; 
    if (size <90){
      return 0;
    }
    
    popMatrix();
    return 10;
  }

  int circleClicked(float circleCenterX, float circleCenterY, float x, float y, int diameter) {
    boolean clicked = false;
    nextCall = 0; // if not the right area is clicked then return 0
    clicked = overCircle(circleCenterX, circleCenterY, x, y, diameter);
    if (clicked == true)
    {
      button.setFill(color(255, 25, 25));
      input2.speech("how may i be of assistance");
      nextCall = 1;
    }
    return nextCall;
  }

  void hoverCircle(float circleCenterX, float circleCenterY, float x, float y, int diameter) {
    hover = false;
    hover = overCircle(circleCenterX, circleCenterY, x, y, diameter);
    if (hover == true)
    {
          button.setFill(color(255, 50, 100));
    }
  }


  //this function will measure to see if mouse is within circle, it will be called by functions in this class
  boolean overCircle(float circleCenterX, float circleCenterY, float x, float y, int diameter) {
    boolean onCircle;
    float disX = circleCenterX - x;
    float disY = circleCenterY - y;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return onCircle = true;
    } else return onCircle = false;
  }

  int loading()
  {
    nextCall = 4;
    float speed = 3 ;
    float newx, newy;
    float x =width/2-120;
    float y =height/2-60;

    load.beginDraw();
    load.noStroke();
    load.fill(255, 0, 0);
    load.strokeWeight(10);

    newx = x + cos(radians(loadingAngle))*80;
    newy = y +sin(radians(loadingAngle))*80;
    if (loadingAngle < 30 || loadingAngle > 260)
    {
      load.stroke(242, 13, 59);
    } else if (loadingAngle < 150)
    {
      load.stroke(242, 227, 13);
    } else {
      load.stroke(13, 242, 59);
    }
    load.line(newx, newy, newx, newy);
    loadingAngle += speed;

    if (loadingAngle >360) {
      loadingAngle = 0;
    }

    if (loadingAngle >265 && loadingAngle < 270)
    {
      nextCall = 3; //once loading has reached full circle it will display answer by calling the function due ot nextCall being change
      load.clear(); // to clear previous loading bar in order to load again
    }

    load.endDraw();

    // Draw the offscreen buffer to the screen with image() 
    image(load, 120, 60);

    return nextCall;
  }
  
  void textScreen(){
    screen.setFill(color(0));
    strokeWeight(5);
    
    if (rectY <=250)
    {
     rectY +=3;
    }
    
   if (rectY >= 250)
   {
       shape(screen);
  
    }  
    noFill();
    rect(70, 200, 150, rectY,20);
  }
  
  void removeTextScreen(){
    screen.setFill(color(0));
    strokeWeight(5);
    
    if (rectY !=0)
    {
     rectY -=3;
    }

    noFill();
    rect(70, 200, 150, rectY,20);
  }
}