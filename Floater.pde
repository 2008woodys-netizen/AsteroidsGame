class Floater{
  protected double xSpeed, ySpeed, xPos, yPos, myAngle, mySpeed;
  protected int numCorners;
  protected double[] xCorners, yCorners;
  Floater(){
    mySpeed = 0;
    xSpeed = 0;
    ySpeed = 0;
    xPos = 0;
    yPos = 0;
    myAngle = 0;
    numCorners = 0;
    xCorners = new double[numCorners];
    yCorners = new double[numCorners];
  }
  Floater(int silly){
    mySpeed = 0;
    xSpeed = 0;
    ySpeed = 0;
    xPos = 0;
    yPos = 0;
    myAngle = 0;
    numCorners = silly;
    xCorners = new double[numCorners];
    yCorners = new double[numCorners];
  }
  
  public void show(){
    fill(0);
    beginShape();
    for(int i = 0; i<numCorners; i++)
      vertex((float)xCorners[i], (float)yCorners[i]);
    endShape();
    ellipse((float)xPos,(float)yPos,20,20);
  }
  public void move(){
    xSpeed = Math.cos(myAngle) * mySpeed;
    ySpeed = Math.sin(myAngle) * mySpeed;
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
  
  //super annoying getters and setters 
  public double getmySpeed(){
    return mySpeed;}
  public void setmySpeed(double KCR){
    mySpeed = KCR;}
  public double getxSpeed(){
    return xSpeed;}
  public void setxSpeed(double x){
    xSpeed = x;}
  public double getySpeed(){
    return ySpeed;}
  public void setySpeed(double y){
    ySpeed = y;}
  public double getxPos(){
    return xPos;}
  public void setxPos(double KCR){
    xPos = KCR;}
  public double getyPos(){
    return yPos;}
  public void setyPos(double KCR){
    yPos = KCR;}
  public double getmyAngle(){
    return myAngle;}
  public void setmyAngle(double KCR){
    myAngle = KCR;}
  public int getnumCorners(){
    return numCorners;}
  public void setnumCorners(int KCR){
    numCorners = KCR;}
  public double getxCorner(int KCR){
    if(KCR >= 0 && KCR < xCorners.length)
      return xCorners[KCR];
    return 0;}
  public void setxCorner(int index, double value){
    if(index >= 0 && index < xCorners.length)
      xCorners[index] = value;}
  public void setyCorner(int index, double value){
    if(index >= 0 && index < yCorners.length)
      yCorners[index] = value;}
  public double getyCorner(int KCR){
    if(KCR >= 0 && KCR < yCorners.length)
      return yCorners[KCR];
    return 0;}
}
Starship ship;
public void settings(){
  size(1000,800);
}
void setup(){
  ship = new Starship();
}


void draw(){
  background(200);
  ship.show();
  ship.move(); 
  //println(starship.getmySpeed());
}

void keyPressed(){
  if(keyCode == UP){
    ship.setxSpeed(ship.getxSpeed()+0.2 * Math.cos(ship.getmyAngle()));
    ship.setySpeed(ship.getySpeed()+0.2 * Math.sin(ship.getmyAngle()));}
  if(keyCode == LEFT)
    ship.setmyAngle(ship.getmyAngle()-0.2);
  if(keyCode == RIGHT)
    ship.setmyAngle(ship.getmyAngle()+0.2);

}
class Star{
  private float xPos, yPos;
  private color myColor;
  Star(){
    xPos = (float)(Math.random()*1001);
    yPos = (float)(Math.random()*801);
    myColor = color((int)(Math.random()*50 + 200), (int)(Math.random()*50 + 200), (int)(Math.random()*50 + 200));
  }
  void show(){
    fill(myColor);
    ellipse(xPos, yPos, 3, 3);
  }
}
    class Starship extends Floater{
  Starship(){
    mySpeed = 0;
    xSpeed = 0;
    ySpeed = 0;
    xPos = 500;
    yPos = 400;
    myAngle = 0;
    numCorners = 3;
    xCorners = new double[]{20,-20,-20};
    yCorners = new double[]{0, -14, 14};
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
    fill(0);
    pushMatrix();
    translate((float)xPos,(float)yPos);
    rotate((float)myAngle);
    beginShape();
    for(int i = 0; i<numCorners; i++)
      vertex((float)xCorners[i], (float)yCorners[i]);
    endShape();
    popMatrix();
    println("x: " + xPos);
    println("y: " + yPos);
  }
}
