class Asteroid extends Floater {
  protected boolean shot;
  protected int radius;
  protected double rotationSpeed;
  protected double angle;
  protected int generation;
  Asteroid(double x, double y, int gen) {
    generation = gen;
    //rotationSpeed = Math.random() * 6 - 3;
    rotationSpeed = Math.random() * 0.05;
    numCorners = (int)(Math.random()*5+10);
    xSpeed = Math.random()*5 - 2;
    ySpeed = Math.random()*5 - 2;
    xPos = x;
    yPos = y;
    radius = 40/generation;
    xCorners = new double[numCorners];
    yCorners = new double[numCorners];
    for (int i = 0; i<numCorners; i++) {
      xCorners[i] = Math.cos((2*PI)/numCorners * i)*radius + Math.random()*20 - 5;
      yCorners[i] = Math.sin((2*PI)/numCorners * i)*radius + Math.random()*20 - 5;
    }
  }
  void show() {
    noStroke();
    fill(200, 170, 170);
    pushMatrix();
    translate((float)xPos, (float)yPos);
    rotate((float)angle);
    beginShape();
    for (int i = 0; i<numCorners; i++) {
      vertex((float)xCorners[i], (float)yCorners[i]);
    }
    endShape();
    popMatrix();
  }
  void move(){
    angle += rotationSpeed;
    super.move();
    }
  int getGeneration(){
    return generation;}
  int getRadius(){
    return radius;}
}
