boolean shiftPressed = false;
Starship ship;
Star[] sky = new Star[200];
void setup(){
  size(1000,800);
  background(20);
  ship = new Starship();
  for(int i = 0; i<sky.length; i++)
    sky[i] = new Star();
}


void draw(){
  background(20);
  ship.show();
  ship.move();
  ship.hyperspace();
  for(int i = 0; i<sky.length; i++)
    sky[i].show();
  //println(starship.getmySpeed());
  shiftPressed = false;
}

void keyPressed(){
  if(keyCode == UP){
    ship.setxSpeed(ship.getxSpeed()+0.2 * Math.cos(ship.getmyAngle()));
    ship.setySpeed(ship.getySpeed()+0.2 * Math.sin(ship.getmyAngle()));}
  if(keyCode == LEFT)
    ship.setmyAngle(ship.getmyAngle()-0.2);
  if(keyCode == RIGHT)
    ship.setmyAngle(ship.getmyAngle()+0.2);
  if(keyCode == SHIFT)
    shiftPressed = true;

}
