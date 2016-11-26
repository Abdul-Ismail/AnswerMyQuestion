class setting{
  
  boolean value = false;
  float colorButtonX1 = 94/2+100;
  float colorButtonX2 = 224/2+100;
  float colorButtonX3 = 223/2+100;
  int removeX = 100;
  
  void settingButton(int i){
    float d = dist(40, 40, mouseX, mouseY);
    
    stroke(colorButtonX1*2-removeX, colorButtonX2*2-removeX ,colorButtonX3*2-removeX);
    strokeWeight(2);
    text("settings", 40, 40);
    ellipse(40, 40, 50, 50);
    

    
    //boolean value changed if the area is click
    if (i == 1 && d < 50){
      value = !value;
      
    }
        //this will display the following when hovering over or clicked
    if (value == true || d < 50){
      strokeWeight(2);
      fill(0);
      rect( 80, 110, 200, 300);
 //     println(mouseX, mouseY);
      colorButton1(0);
      colorButton2(0);
      colorButton3(0);

    }

  }
  
        void colorButton1(int i){
    ellipse(colorButtonX1,135,10,10);
    removeX = 100;
    line(100,135, 225 , 135);
        float d = dist(colorButtonX1, 135,mouseX, mouseY);
        if (d < 10){
      
          if (i ==1){
            if (mouseX >= 100 && mouseX <= 225)
            {
            colorButtonX1 = mouseX;

            }
          }
        }  
  }
  
  void colorButton2(int i){
    ellipse(colorButtonX2,155,10,10);
    line(100,155, 225, 155);
        float d = dist(colorButtonX2, 155,mouseX, mouseY);
        if (d < 10){
      
          if (i ==1){
            if (mouseX >= 100 && mouseX <= 255)
            {
            colorButtonX2 = mouseX;

            }
          }
        }  
  }
  
  void colorButton3(int i){
    ellipse(colorButtonX3,175,10,10);
    line(100,175, 225, 175);
        float d = dist(colorButtonX3, 175,mouseX, mouseY);
        if (d < 10){
      
          if (i ==1){
            if (mouseX >= 100 && mouseX <= 225)
            {
            colorButtonX3 = mouseX;

            }
          }
        }  
  }
}