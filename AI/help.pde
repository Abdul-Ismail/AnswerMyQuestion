class help{
 boolean inRange = false;
  
  
  void displayHelp(){
    strokeWeight(2);
    fill(255);
    text("Help", width-115, 42);
    noFill();
    rect(width-140, 20, 100, 30, 10);
    
    //checks if its hovering over given area
     if (mouseX >= width-140 && mouseX <= width-140+100 && 
      mouseY >= 20 && mouseY <= 20+30) {
      inRange = true;
    cardScreen();
    fill(255, 0 ,0, 100);
    rect(0,0,width,height);
    noFill();
      } else inRange = false;
  }
}

void cardScreen() {
    
    stroke(69, 298, 208);
    strokeWeight(5);
    line(685, 260, 870, 260);
    line(870, 260, 870, 295);
    rect(759, 295, 200, 150);
  }