class Floater{
  protected double xSpeed, ySpeed, xPos, yPos, myAngle, mySpeed;
  protected int numCorners;
  protected double[] xCorners, yCorners;
  public Floater(int silly){
    mySpeed = 0;
    xSpeed = 0;
    ySpeed = 0;
    xPos = 500;
    yPos = 400;
    myAngle = 0;
    numCorners = silly;
    xCorners = new double[numCorners];
    yCorners = new double[numCorners];
  }
  
  public void show(){
    pushMatrix();
    translate((float)xPos, (float)yPos);
    rotate((float)myAngle);
    fill(0);
    beginShape();
    for(int i = 0; i<numCorners; i++)
      vertex((float)xCorners[i], (float)yCorners[i]);
    endShape();
    popMatrix();
  }
  public void move(){
    xSpeed = Math.cos(myAngle) * mySpeed;
    ySpeed = Math.sin(myAngle) * mySpeed;
    xPos += xSpeed;
    yPos += ySpeed;
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
void keyPressed(){
  if(keyCode == UP){
    println("after:" + starship.getmySpeed());
    starship.setmySpeed(starship.getmySpeed()+1);
    println("before:" + starship.getmySpeed());}
  if(keyCode == DOWN)
    starship.setmySpeed(starship.getmySpeed()-1);
  if(keyCode == LEFT)
    starship.setmyAngle(starship.getmyAngle()-0.2);
  if(keyCode == RIGHT)
    starship.setmyAngle(starship.getmyAngle()+0.2);
}

Floater starship;
void setup(){
  size(1000, 800);
  starship = new Floater(3);
}
void draw(){
  background(200);
  starship.setxCorner(0, starship.getxPos() + 30);
  starship.setyCorner(0, starship.getyPos());
  starship.setxCorner(1, starship.getxPos() - 26);
  starship.setyCorner(1, starship.getyPos() - 14);
  starship.setxCorner(2, starship.getxPos() - 26);
  starship.setyCorner(2, starship.getyPos() + 14);
  starship.show();
  starship.move(); 
  //println(starship.getmySpeed());
}
