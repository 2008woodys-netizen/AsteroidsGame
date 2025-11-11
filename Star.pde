class Star{
  private float xPos, yPos;
  private color myColor;
  Star(){
    xPos = (float)(Math.random()*1001);
    yPos = (float)(Math.random()*801);
    myColor = color((int)(Math.random()*80 + 180), (int)(Math.random()*80 + 180), (int)(Math.random()*80 + 180));
  }
  void show(){
    noStroke();
    fill(myColor);
    ellipse(xPos, yPos, 3, 3);
  }
}
