boolean shiftPressed = false;
boolean shooting = false;
Starship ship;
ArrayList <Bullet> bullets = new ArrayList<Bullet>();

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
  ship.hyperspace();
  for(int i = 0; i<sky.length; i++)
    sky[i].show();
  for(int i = 0; i<bullets.size(); i++){
    bullets.get(i).show();
    bullets.get(i).move();}
  ship.show();
  ship.move();
  if(shooting == true){
   Bullet someBullet = new Bullet();
   bullets.add(someBullet);}
  shiftPressed = false;
  shooting = false;
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
  if(keyCode == 32){
    shooting = true;
  }
}
