// Jacob

class Player extends GameObject {
  int speed = 195;
  color col = color(0, 205, 0);
  
  Bullet[] bullets = new Bullet[5];

  Player(float x, float y) {
    super();
    this.pos.set(x, y);
    objWidth = 50;
    objHeight = 20;
  }

  void draw() {
    noStroke();
    fill(col);
    rectMode(CENTER);

    rect(pos.x, pos.y, objWidth, objHeight, 7);
    rect(pos.x, pos.y - objHeight / 2, objWidth * 0.25, objHeight * 0.9, 5);

    updateBullets();
  }

  void move()
  {
    PVector inputTemp = inputAxis();

    if (pos.x <= (objWidth / 2) && inputTemp.x < 0)
     inputTemp.x = 0;
   else if (pos.x >= (width - objWidth / 2) && inputTemp.x > 0)
     inputTemp.x = 0;

   pos.add(inputTemp.mult(Time.deltaTime * speed));
 }

  void updateBullets() {
    for (int i = 0; i < bullets.length; ++i){
      if (bullets[i] == null)
        continue;
      if (bullets[i].removeMe){
        bullets[i] = null;
        continue;
      }

      if (enemyManager.bulletIsColliding(bullets[i]))
        bullets[i] = null;
      else {
        bullets[i].move();
        bullets[i].draw();
      }
    }
  }

  void fire() { 
    if (sceneManager.state == GameState.GAMEOVER)
      return;

    for (int i = bullets.length - 2; i >= 0; i--) {
      if (bullets[i] == null)
        continue;

      bullets[i+1] = bullets[i];
    }
    bullets[0] = new Bullet(pos, -1);
  }
}