// Jacob

class Enemy extends GameObject {
  float fireRate;
  int radius,
    speed = 10,
    anim = 0,
    pointValue = 0;
  Bullet bullet;
  
  Enemy(float x, float y) {
    super();
    this.pos.set(x, y);
    this.vel.set(speed, 0);
    this.dir.set(0, 1);
    this.objWidth = 32;
    this.objHeight = objWidth;
    this.radius = objWidth / 2;
  }

  void draw() {
    fill(255);
    stroke(255);
    if (bullet != null) {
      bullet.move();
      if (bullet.isColliding(player)) {
        bullet = null;
        sceneManager.setState(GameState.GAMEOVER);
      } else
        bullet.draw();
    }
    strokeWeight(3);
  }

  void drawEyes() {
    fill(0);
    noStroke();
    PVector oppositeDir = PVector.mult(dir, -1);

    rectMode(CENTER);

    PVector leftEye = PVector.fromAngle(oppositeDir.heading() - HALF_PI + 0.5).mult(radius * 0.4);
    rect(pos.x + leftEye.x, pos.y + leftEye.y, objWidth * 0.15, objWidth * 0.15);

    PVector rightEye = PVector.fromAngle(oppositeDir.heading() + HALF_PI - 0.5).mult(radius * 0.4);
    rect(pos.x + rightEye.x, pos.y + rightEye.y, objWidth * 0.15, objWidth * 0.15);
  }

  void update() {
    anim = anim == 0 ? 1 : 0;
    pos.add(vel);
  }

  boolean isOutsideBounds() {
    return (pos.x - objWidth + vel.x * 2 < 0 || pos.x + objWidth + vel.x * 2 > width);
  }

  void fire(){
    bullet = new Bullet(pos, 1);
  }
}