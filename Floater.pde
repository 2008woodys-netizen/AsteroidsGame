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

    
