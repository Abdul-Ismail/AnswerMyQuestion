class design {
  float angle1 = 0;
  float angle2 = 0;
  float speed1= 1;
  float speed2= 2;
  int button1=0;
  int button2=0;
  float line1X = 685;
  float line2Y = 260;
  float rectY = 0;
  float middlelineX1 = 870;
  float middlelineX2 = 870;
  float rectStart = 870;
  float rectWidth = 0;



  design() {
  }

  void circleDesign() {



    strokeWeight(2);
    ellipse(width/2, height/2, 175, 175);

    strokeWeight(2);
    ellipse(width/2, height/2, 325, 325);

    //button2
    ellipse(600, 180, 35, 35);
    line(590, 180, 610, 180);

    //button1
    ellipse(560, 155, 35, 35);
    line(550, 155, 570, 155);
    line(560, 165, 560, 145);
   

    strokeWeight(2);

    arc(width/2, height/2, 185, 185, 0, HALF_PI/2);
    line(613, 261, 640, 260);
    line(587, 326, 605, 345 );
    arc(width/2, height/2, 240, 240, 0, HALF_PI/2);


    arc(width/2, height/2, 185, 185, HALF_PI, PI);
    line(428, 262, 392, 263);
    line(521, 355, 520, 390 );
    arc(width/2, height/2, 260, 260, HALF_PI, PI);


    pushMatrix();


    translate(width/2, height/2);
    rotate(radians(angle1));
    angle1+=speed1;

    arc(width/2, height/2, 325, 325, 0, HALF_PI);
    noFill();

    strokeWeight(5);
    arc(0, 0, 345, 345, HALF_PI, PI);

    strokeWeight(20);
    arc(0, 0, 365, 365, PI+QUARTER_PI, TWO_PI);

    rotate(radians(angle2));
    angle2-=speed2;
    strokeWeight(2);
    arc(0, 0, 395, 395, 0, HALF_PI);
    popMatrix(); 


    //time 

    int mainX = width/2;
    int mainY = 500;
    int s = second();  // Values from 0 - 59
    int m = minute();  // Values from 0 - 59
    int h = hour();    // Values from 0 - 23

    pushMatrix();
    translate(413, 282);
    rotate(7.2);
    textSize(25);
    text(h, 7, 20); 
    text(":", 20, 20); 
    text(m, 30, 20);

    popMatrix();

    pushMatrix();
    translate(413, 282);
    rotate(7);
    text(":", 58, 33);
    textSize(20);
    text(s, 65, 35);
    popMatrix();
  }

  void cardScreen() {
    
    stroke(69, 298, 208);
    strokeWeight(5);
    //slows down the moving arvs around center
    if (speed1 > 0) {
      speed1 -=0.01;
    }

    if (speed2 > 0) {
      speed2 -=0.01;
    }


    if (line1X < 870 && speed1 <0)
    {
      line1X+=2;
    } else if (line2Y < 295 && speed1 <0)
    {
      line2Y +=2;
    } else if (rectStart > 759 && speed1 < 0) {
      rectStart -=2;
      rectWidth +=4;
    } else if (rectY < 150 && speed1 < 0) {
      rectY += 2;
    }

    line(685, 260, line1X, 260);
    line(870, 260, 870, line2Y);



    rect(rectStart, 295, rectWidth, rectY);
  }

  void removeCardScreen() {
    
    stroke(69, 298, 208);
    strokeWeight(5);

    //slows down the moving arvs around center
    if (speed1 < 1) {
      speed1 +=0.01;
    }

    if (speed2 < 2) {
      speed2 +=0.01;
    }


    if (rectY > 0 && speed1 > 0) {
      rectY -= 2;
    } else if (rectStart < 871 && speed1 > 0) {
      rectStart +=2;
      rectWidth -=4;
    } else if (line2Y > 260 && speed1 >0)
    {
      line2Y -=2;
    } else if (line1X > 685 && speed1 >0)
    {
      line1X-=2;
    }


    line(685, 260, line1X, 260);
    line(870, 260, 870, line2Y);

    rect(rectStart, 295, rectWidth, rectY);
  }

  boolean overButton(float circleCenterX, float circleCenterY, float x, float y, float diameter) {
    boolean onCircle;
    float disX = circleCenterX - x;
    float disY = circleCenterY - y;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return onCircle = true;
    } else return onCircle = false;
  }


}