boolean shiftPressed = false;
boolean shooting = false;
boolean gameLost = false;
boolean gameWon = false;
Starship ship;
ArrayList <Bullet> bullets = new ArrayList<Bullet>();
ArrayList <Asteroid> asteroids = new ArrayList<Asteroid>();
Asteroid Bob;

Star[] sky = new Star[200];
void setup() {
  size(1000, 800);
  background(20);
  ship = new Starship();
  for (int i = 0; i<sky.length; i++)
    sky[i] = new Star();
  for (int i = 0; i<7; i++) {
    Asteroid someAsteroid = new Asteroid(Math.random()*1000, Math.random()*800, 1);
    someAsteroid.show();
    asteroids.add(someAsteroid);
  }
}


void draw() {
  background(20);

  //stars
  for (int i = 0; i<sky.length; i++)
    sky[i].show();

  //asteroids and collision stuff
  for (int i = asteroids.size()-1; i>=0; i--) {
    asteroids.get(i).show();
    asteroids.get(i).move();
    double xship = asteroids.get(i).getxPos() - ship.getxPos();
    double yship = asteroids.get(i).getyPos() - ship.getyPos();
    if(Math.sqrt(xship*xship + yship*yship) <= asteroids.get(i).getRadius())
      gameLost = true;
    for (int j = bullets.size()-1; j>=0; j--) {
      double xDist = asteroids.get(i).getxPos() - bullets.get(j).getxPos();
      double yDist = asteroids.get(i).getyPos() - bullets.get(j).getyPos();
      if (Math.sqrt(xDist * xDist + yDist * yDist) <= asteroids.get(i).getRadius()) {
        for (int p = 0; p<2; p++) {
          Asteroid someasteroid = new Asteroid(asteroids.get(i).getxPos(), asteroids.get(i).getyPos(), asteroids.get(i).getGeneration()+1);
          asteroids.add(someasteroid);
        }
        bullets.remove(j);
        asteroids.remove(i);
      }
    }
    if(asteroids.get(i).getGeneration() >= 4)
      asteroids.remove(i);
  }


  //bullets
  for (int i = 0; i<bullets.size(); i++) {
    bullets.get(i).show();
    bullets.get(i).move();
    if ((bullets.get(i).getxPos()>1000 || bullets.get(i).getxPos() < 0) || (bullets.get(i).getyPos() > 800 || bullets.get(i).getyPos() < 0))
      bullets.remove(i);
  }
  if (shooting == true) {
    Bullet someBullet = new Bullet();
    bullets.add(someBullet);
  }

  //ship
  ship.show();
  ship.move();
  ship.hyperspace();

  //resetting booleans
  shiftPressed = false;
  shooting = false;
  
  //win
  if(asteroids.size() == 0){
    gameWon = true;
    fill(0,255,0);
    rect(300, 200, 400, 400);
    fill(0);
    textSize(50);
    text("You Win", 400, 400);
  }
    
  
  //lose
  if(gameLost == true){
    fill(255,0,0);
    rect(300, 200, 400, 400);
    fill(0);
    textSize(50);
    text("You Lose", 400, 400);
  }
}

void keyPressed() {
  if(gameLost == false && gameWon == false){
  if (keyCode == UP) {
    ship.setxSpeed(ship.getxSpeed()+0.2 * Math.cos(ship.getmyAngle()));
    ship.setySpeed(ship.getySpeed()+0.2 * Math.sin(ship.getmyAngle()));
  }
  if (keyCode == LEFT)
    ship.setmyAngle(ship.getmyAngle()-0.2);
  if (keyCode == RIGHT)
    ship.setmyAngle(ship.getmyAngle()+0.2);
  if (keyCode == SHIFT)
    shiftPressed = true;
  if (keyCode == 32) {
    shooting = true;
  }
  }
}

