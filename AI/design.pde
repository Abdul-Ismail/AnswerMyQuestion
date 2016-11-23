class design{
  float angle1 = 0;
float angle2 = 0;



void circleDesign(){
  
  noFill();

  strokeWeight(2);
  ellipse(width/2, height/2, 175, 175);
  noFill();

  strokeWeight(2);
  ellipse(width/2, height/2, 325, 325);
  
    
  strokeWeight(2);

   arc(width/2, height/2, 185, 185,  0, HALF_PI/2);
   line(613, 261, 640, 260);
   line(587, 326, 605, 345 );
   arc(width/2, height/2, 240, 240,  0, HALF_PI/2);
   println(mouseX,mouseY);
   
   
   arc(width/2, height/2, 185, 185, HALF_PI, PI);
   line(428, 262, 392, 263);
   line(521, 355, 520, 390 );
   arc(width/2, height/2, 260, 260, HALF_PI, PI);


  pushMatrix();
    translate(width/2, height/2);
       rotate(radians(angle1));
       angle1++;
  
  arc(width/2, height/2, 325, 325, 0, HALF_PI);
  noFill();
  
  strokeWeight(5);
  arc(0, 0, 345, 345, HALF_PI, PI);
  
  strokeWeight(20);
  arc(0, 0, 365, 365, PI+QUARTER_PI, TWO_PI);
  
     rotate(radians(angle2));
       angle2-=2;
     strokeWeight(2);
    arc(0, 0, 395, 395, 0, HALF_PI);
    popMatrix(); 
}


}