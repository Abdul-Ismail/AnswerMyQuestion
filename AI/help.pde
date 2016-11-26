class help{
 boolean inRange = false;
  
  
  void displayHelp(){
    if (inRange == true)    fill(121, 120, 120); //changes color of button when hovering over
    rect(width-140, 20, 100, 30, 10);
    noFill();
     fill(255);
     text("Help", width-115, 42);
     noFill();
    
    //checks if its hovering over given area
    if (mouseX >= width-140 && mouseX <= width-140+100 && 
     mouseY >= 20 && mouseY <= 20+30) {
      inRange = true;// if the mouse is within given distance then this boolean will be true
    cardScreen();
    textScreen();
    
    //will fill the background at a transparancy of 100
    fill(255, 0 ,0, 100);
    rect(0,0,width,height);
    noFill();
    
    generalDescription();
    description();
    
    
    } else inRange = false;
  }
}

void cardScreen() {
    
    //stroke(69, 298, 208);
    strokeWeight(5);
    line(685, 260, 870, 260);
    line(870, 260, 870, 295);
    rect(759, 295, 225, 150,20);
  }
  
  void textScreen(){
    strokeWeight(5);
    fill(0);
    rect(70, 200, 150,250,20);
  }

  void generalDescription(){
    strokeWeight(2);
    //for the time
    noFill();
    ellipse(403, 275, 15,15);
    line(403, 275, 355, 414);
    line(355, 414, 315, 414);
    
    //for the sphere
    ellipse(484, 171, 25,25);
    line(484, 171, 382, 76);
    line(382, 76, 352, 76);
    
    //for settings
    ellipse(52,35,15,15); 
    line(52,35, 115, 123);
    line(115, 123, 135, 123);
    
    //sphere description
    ellipse(606,167,10,10); 
    ellipse(567,145,10,10); 
    line(606,167, 696, 80);
    line(567, 145, 696, 80);
    
    //text screen description
    strokeWeight(2);
    ellipse(194,223,20,20);
    line(194,223, 160, 158);
    line(160,158, 110, 158);
    
    // cardScreen description()
    strokeWeight(2);
    ellipse(935,308,20,20);
    line(935,308, 898, 206);
    line(898,206, 850, 206);

    
    
  }
  
  void description(){
    //description for sphere
    fill(255);
    textSize(15);
    text("Click on the sphere to \ninteract with your AI!", 180, 76);
    
    //description for time
    textSize(12);
    text("Displays the \nreal time", 237, 414);
    
    //description for setting
    textSize(12);
    text("change color, speaker or\n AI name", 140, 123);
    
    //description for sphere buttons
    textSize(12);
    text("Adjusts speed \n of the sphere", 711, 73);
    
    //description for sphere
    textSize(14);
    text("interact with AI\n through this \n screen", 15, 145);
    
    //description for card screen
    textSize(12);
    text("This screen displays\n the card and is\n animated if required", 721, 196);
    
    noFill();
  }