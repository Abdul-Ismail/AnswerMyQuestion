class timeUI{
  
  float timeDisplay(float x, float y) {
  float mainX= 150;
  float mainY =400;
  float d;
  PVector v1;
  PVector v2 ;
  float a;
  noFill();

  //calculates the distance between the two vectors which is the centre and moving ball
  v1 = new PVector(width/2, height/2);
  v2 = new PVector(x, y); 
  a = PVector.angleBetween(v1, v2);


  int b = int(degrees(a)); //converts a into degrees and then into an integeer
  d = dist(mainX, mainY, mouseX, mouseY);
    stroke(b*10, b*1, b*6);
  ellipse(mainX, mainY, 130, 130);
  ellipse(mainX, mainY, 180, 180);

  //fill(b*5, b*21, b*15);
  ellipse(x, y, 25, 25);

  //display time
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  textSize(25);
  text(h, mainX-40, mainY); 
  text(":", mainX-10, mainY); 
  text(m, mainX, mainY);
  text(":", mainX+30, mainY);
  textSize(20);
  text(s, mainX+35, mainY);
  return d;
}

/*

  void mouseDragged() 
  {
    if (timeDistance > 70 && timeDistance < 90) {

      timeX = mouseX;
      timeY = mouseY;
    }
    */
}