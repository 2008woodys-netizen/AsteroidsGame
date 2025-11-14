class Bullet extends Floater{
  Bullet(){
    xSpeed = ship.getxSpeed() + Math.cos(ship.getmyAngle()) * 5;
    ySpeed = ship.getySpeed() + Math.sin(ship.getmyAngle()) * 5;
    numCorners = 0;
    xPos = ship.getxPos();
    yPos = ship.getyPos();
  }
  void show(){
    fill(0,255,0);
    ellipse((float)xPos, (float)yPos, 3, 3);
  }
  void move(){
    xPos += xSpeed;
    yPos += ySpeed;
    if(xPos >= 1100)
      xPos = -100;
    if(xPos <= -100)
      xPos = 1100;
    if(yPos >= 900)
      yPos = -100;
    if(yPos <= -100)
      yPos = 900;
  }
}
