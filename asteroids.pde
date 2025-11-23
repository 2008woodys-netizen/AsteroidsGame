class Asteroid extends Floater {
  boolean shot;
  int radius;
  double rotationSpeed;
  int generation;
  Asteroid(double x, double y, int gen) {
    generation = gen;
    rotationSpeed = Math.random() * 6 - 3;
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
    beginShape();
    for (int i = 0; i<numCorners; i++) {
      vertex((float)xCorners[i] + (float)xPos, (float)yCorners[i] + (float)yPos);
    }
    endShape();
  }
  void move(){
    super.move();
    pushMatrix();
    translate((float)xPos, (float)yPos);
    rotate((float)rotationSpeed);
    popMatrix();
    }
  int getGeneration(){
    return generation;}
  int getRadius(){
    return radius;}
}
