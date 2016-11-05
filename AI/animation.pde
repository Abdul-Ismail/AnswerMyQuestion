class animation{
  user_input input2;
  int nextCall;
  
  animation(){
    input2 = new user_input();
  }
  
  float[] circleSpin() {
  int x = width/2;
  int y = height/2;
  float newx, newy;
  int radius =50;
  float speed = 2;
  noFill();
  stroke(69, 298,208);

  for(int i = 0; i<2; i++)
{
   newx = x + cos(radians(angle[i]))*120;
   newy = y +sin(radians(angle[i]))*(50);
    if (i == 0){  angle[i] += speed; }else {  angle[i] -= speed;}
   ellipse(newx, newy, 12, 12);
   }
    
   noFill();
   ellipse(width/2, height/2, 130, 130);
   ellipse(width/2, height/2, 135, 135);
  
   return angle;
}
 
int circleClicked(float circleCenterX,float circleCenterY, float x, float y, int diameter){
  boolean clicked = false;
  clicked = overCircle(circleCenterX, circleCenterY, x, y, diameter);
  if(clicked == true)
   {
     input2.speech("how may i be of assistance");
     nextCall = 1;
   }
  return nextCall;
}

//this function will measure to see if mouse is within circle, it will be called by functions in this class
boolean overCircle(float circleCenterX,float circleCenterY, float x, float y, int diameter) {
  boolean onCircle;
  float disX = circleCenterX - x;
  float disY = circleCenterY - y;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
  return onCircle = true;
  }else return onCircle = false;
}
}