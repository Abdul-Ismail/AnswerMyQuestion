class setting{
  
  boolean value = false;
  float colorButtonX1 = 94/2+100;
  float colorButtonX2 = 224/2+100;
  float colorButtonX3 = 223/2+100;
  int removeX = 100;
  boolean inRange = false;
  
  void settingButton(int i){
    float d = dist(40, 40, mouseX, mouseY);
    
    stroke(colorButtonX1*2-removeX, colorButtonX2*2-removeX ,colorButtonX3*2-removeX);
    strokeWeight(2);
    fill(255);
    text("settings", 40, 40);
    noFill();
    ellipse(40, 40, 50, 50);
    
    //checks if its hovering over given area
    if (d < 50){
      inRange = true;
    }else inRange = false;
    //boolean value changed if the area is click
    if (i == 1 && d < 50){
      value = !value; //changes evertime you click within the button
      
    }
        //this will display the following when hovering over or clicked
    if (value == true || d < 50){
      strokeWeight(2);
      fill(0);
      rect( 80, 110, 200, 300);
      fill(255);
      textSize(15);
      text("theme color:", 100, 130);
      noFill();
      
      
      //buttons for the color
      colorButton1(0);
      colorButton2(0);
      colorButton3(0);

    }

  }
  
        void colorButton1(int i){
      if (inRange == true || value == true){
        ellipse(colorButtonX1,135,10,10);
        line(100,135, 225 , 135);
        removeX = 100;
      }
        float d = dist(colorButtonX1, 135,mouseX, mouseY);
        if (d < 10){
      
          if (i ==1 && d < 10){
            if (mouseX >= 100 && mouseX <= 225)
            {
            colorButtonX1 = mouseX;

            }
          }
        }  
  }
  
  void colorButton2(int i){
    if (inRange == true || value == true){
    ellipse(colorButtonX2,155,10,10);
    line(100,155, 225, 155);
    removeX = 100;
    }
        float d = dist(colorButtonX2, 155,mouseX, mouseY);
        if (d < 10){
      
          if (i ==1 && d < 10){
            if (mouseX >= 100 && mouseX <= 255)
            {
            colorButtonX2 = mouseX;

            }
          }
        }  
  }
  
  void colorButton3(int i){
    //only prints out shapes when hovering or setting is click
    if (inRange == true || value == true){
        ellipse(colorButtonX3,175,10,10);
        line(100,175, 225, 175);
        removeX = 100;
    }
        float d = dist(colorButtonX3, 175,mouseX, mouseY);
        println(d);
        if (d < 10){
      
          if (i ==1 && d < 10){
            if (mouseX >= 100 && mouseX <= 225)
            {
              colorButtonX3 = mouseX;

            }
          }
        }  
  }
  
}