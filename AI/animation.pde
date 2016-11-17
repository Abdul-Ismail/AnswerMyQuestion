class animation {
  user_input input2;
  int nextCall;
  PShape button;
  PGraphics load;
  float loadingAngle = 270;
  int size = 250;


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
    //shape(button);
    //button.setFill(color(255, 50));
    //ellipse(width/2, height/2, 135, 135);

    lights();


    fill(255, 0, 0);
    pushMatrix();
    translate(width/2, height/2);
    rotateX(radians(frameCount*3));
    rotateY(radians(frameCount*3));
    sphereDetail(100);
    sphere(80);
    popMatrix();

    return angle;
  }

  int loadingScreen() {
      fill(255, 0, 0);
       stroke(69, 298, 208);
    pushMatrix();
    translate(width/2, height/2);
    rotateX(radians(frameCount*1));
    rotateY(radians(frameCount*1));
    sphereDetail(100);
    sphere(size);
    if (size != 80){size-=1;} else{
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

    newx = x + cos(radians(loadingAngle))*70;
    newy = y +sin(radians(loadingAngle))*70;
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
}