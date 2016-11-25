class setting{
  
  boolean value = false;
  float colorButtonX1 = 50;
  float colorButtonX2 = 50;
  float colorButtonX3 = 50;
  
  void settingButton(int i){
    float d = dist(100, 100, mouseX, mouseY);
    
    strokeWeight(2);
    ellipse(100, 100, 50, 50);
    

    
    //boolean value changed if the area is click
    if (i == 1 && d < 50){
      value = !value;
      
    }
        //this will display the following when hovering over or clicked
    if (value == true || d < 50){
      strokeWeight(2);
      rect( 110, 110, 100, 100);
      colorButton1(0);
      colorButton2(0);
      colorButton3(0);

    }

  }
  
        void colorButton1(int i){
    ellipse(colorButtonX1,100,10,10);
    line(40,100, 110, 100);
        float d = dist(colorButtonX1, 100,mouseX, mouseY);
        if (d < 10){
      
          if (i ==1){
            if (mouseX >= 50 && mouseX <= 100)
            {
            colorButtonX1 = mouseX;

            }
          }
        }  
  }
  
  void colorButton2(int i){
    ellipse(colorButtonX2,130,10,10);
    line(40,130, 110, 130);
        float d = dist(colorButtonX2, 140,mouseX, mouseY);
        if (d < 10){
      
          if (i ==1){
            if (mouseX >= 50 && mouseX <= 100)
            {
            colorButtonX2 = mouseX;

            }
          }
        }  
  }
  
  void colorButton3(int i){
    ellipse(colorButtonX3,160,10,10);
    line(40,160, 110, 160);
        float d = dist(colorButtonX3, 160,mouseX, mouseY);
        if (d < 10){
      
          if (i ==1){
            if (mouseX >= 50 && mouseX <= 100)
            {
            colorButtonX3 = mouseX;

            }
          }
        }  
  }
}