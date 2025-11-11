class Starship extends Floater{
  Starship(){
    mySpeed = 0;
    xSpeed = 0;
    ySpeed = 0;
    xPos = 500;
    yPos = 400;
    myAngle = 0;
    numCorners = 4;
    xCorners = new double[]{20,-20,-20,20};
    yCorners = new double[]{0, -14, 14,0};
  }
  public void move(){
    xPos += xSpeed;
    yPos += ySpeed;
    if(xPos>1050)
      xPos = -50;
    if(xPos<-50)
      xPos = 1050;
    if(yPos>850)
      yPos = -50;
    if(yPos<-50)
      yPos = 850;
  }
  public void show(){
    fill(200,100,100);
    pushMatrix();
    translate((float)xPos,(float)yPos);
    rotate((float)myAngle);
    beginShape();
    for(int i = 0; i<numCorners; i++)
      vertex((float)xCorners[i], (float)yCorners[i]);
    endShape();
    popMatrix();
  }
  public void hyperspace(){
    if(shiftPressed == true){
      xPos = Math.random()*1000;
      yPos = Math.random()*800;
      xSpeed = 0;
      ySpeed = 0;
      myAngle = Math.random()*2*PI;}
    }
}
