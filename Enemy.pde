// Jacob

class Enemy extends GameObject {
  float fireRate;
  int size = 32,
    radius = size / 2,
    speed = 10,
    anim = 0;

  Enemy(float x, float y) {
    super();
    this.pos.set(x, y);
    this.vel.set(speed, 0);
    this.dir.set(0, 1);
  }

  void draw() {
    fill(255);
    stroke(255);
    strokeWeight(3);
  }

  void drawEyes() {
    fill(0);
    noStroke();
    PVector oppositeDir = PVector.mult(dir, -1);

    rectMode(CENTER);

    PVector leftEye = PVector.fromAngle(oppositeDir.heading() - HALF_PI + 0.5).mult(radius * 0.4);
    rect(pos.x + leftEye.x, pos.y + leftEye.y, size * 0.15, size * 0.15);

    PVector rightEye = PVector.fromAngle(oppositeDir.heading() + HALF_PI - 0.5).mult(radius * 0.4);
    rect(pos.x + rightEye.x, pos.y + rightEye.y, size * 0.15, size * 0.15);
  }

  void update() {
    anim = anim == 0 ? 1 : 0;
    pos.add(vel);
  }

  boolean isOutsideBounds() {
    return (pos.x - size + vel.x * 2 < 0 || pos.x + size + vel.x * 2 > width);
  }
}