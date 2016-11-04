class animation{
  
  
  animation(){
    
  }
  
  float[] circleSpin() {
  background(0);
  int x = width/2;
  int y = height/2;
  float newx, newy;
  int radius =50;
  float speed = 2;
  noFill();
  stroke(200);

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
}