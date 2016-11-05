class animation {
  user_input input2;
  int nextCall;
  PShape button;
  PGraphics load;
 float loadingAngle = 270;


  animation() {
    input2 = new user_input();
      load = createGraphics(width+50, height+160);
    button = createShape(ELLIPSE, width/2, height/2, 130, 130); // main circle in screen, will be accessed by other functions
  }

  float[] circleSpin() {
    int x = width/2;
    int y = height/2;
    float newx, newy;
    int radius =50;
    float speed = 2;
    noFill();
    stroke(69, 298, 208);

    for (int i = 0; i<2; i++)
    {
      newx = x + cos(radians(angle[i]))*120;
      newy = y +sin(radians(angle[i]))*(50);
      if (i == 0) {  
        angle[i] += speed;
      } else {  
        angle[i] -= speed;
      }
      ellipse(newx, newy, 12, 12);
    }

    noFill();
    shape(button);
    button.setFill(color(255, 50));
    ellipse(width/2, height/2, 135, 135);

    return angle;
  }

  int circleClicked(float circleCenterX, float circleCenterY, float x, float y, int diameter) {
    boolean clicked = false;
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
    boolean hover = false;
    hover = overCircle(circleCenterX, circleCenterY, x, y, diameter);
    if (hover == true)
    {
      button.setFill(color(255, 25, 25));
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

  void loading()
  {

    float speed = 0.5 ;
    float newx, newy;
    float x =width/2-120;
    float y =height/2-60;

    load.beginDraw();
    load.noStroke();
    load.fill(255, 0, 0);
    load.strokeWeight(10);

    newx = x + cos(radians(loadingAngle))*70;
    newy = y +sin(radians(loadingAngle))*70;
    if (loadingAngle < 30 || loadingAngle > 270)
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

    load.endDraw();

    // Draw the offscreen buffer to the screen with image() 
    image(load, 120, 60);
  }
}