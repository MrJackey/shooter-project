// Jacob

class Player extends GameObject {
  int speed = 195,
    id,
    shootCoolDown = 500;
  float leftBounds, 
    rightBounds;
  color col = color(0, 205, 0);
  Timer shootTimer;

  Player(int id) {
    super();
    this.objWidth = 50;
    this.objHeight = 20;
    this.id = id;

    float boundaries = width / playerManager.playerCount;
    this.leftBounds = boundaries * id; 
    this.rightBounds = boundaries * (id + 1);
    this.pos.set(leftBounds + objWidth, height - 100);

    shootTimer = new Timer(shootCoolDown);
		shootTimer.start();
  }

  void move() {
    PVector inputTemp = inputAxis(id);

    if (pos.x <= (leftBounds + objWidth / 2) && inputTemp.x < 0)
     inputTemp.x = 0;
   else if (pos.x >= (rightBounds - objWidth / 2) && inputTemp.x > 0)
     inputTemp.x = 0;

   pos.add(inputTemp.mult(Time.deltaTime * speed));
 }

  void draw() {
    noStroke();
    fill(col);
    rectMode(CENTER);

    rect(pos.x, pos.y, objWidth, objHeight, 7);
    rect(pos.x, pos.y - objHeight / 2, objWidth * 0.25, objHeight * 0.9, 5);

    stroke(255);
    strokeWeight(1);

    // Draw line to show player boundaries
    if (rightBounds < width * 0.99)
      line(rightBounds, pos.y - objHeight, rightBounds, pos.y + objHeight);

    // Draw circle to show reloading
    float cdRemaining = (float)shootTimer.currentTime() / shootCoolDown;
    if (cdRemaining >= 1)
      cdRemaining = 1;

    noFill();

    arc(pos.x - objWidth / 2 + (objWidth / 2) * cdRemaining, pos.y + objHeight, 
      objHeight / 2, objHeight / 2, 
      HALF_PI, PI + HALF_PI);
    arc(pos.x + objWidth / 2 - (objWidth / 2) * cdRemaining, pos.y + objHeight,
      objHeight / 2, objHeight / 2, 
      PI + HALF_PI, TWO_PI + HALF_PI);
  }

  void fire() { 
    if (sceneManager.getState() != GameStates.RUNNING)
      return;
    if (!shootTimer.time()) 
      return;

    bulletManager.instantiateAsPlayer(pos, id);
  }
}
