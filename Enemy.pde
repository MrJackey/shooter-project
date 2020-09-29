// Jacob

class Enemy extends GameObject {
  float fireRate;
  int size = 32,
    radius = size / 2,
    speed = 10;

  Enemy(float x, float y) {
    super();
    this.pos.set(x, y);
    this.vel.set(speed, 0);
    this.dir.set(0, 1);
  }

  void draw() {
    fill(255);
    stroke(255);
  }

  void update() {
    pos.add(vel);
  }

  boolean isOutsideBounds() {
    return (pos.x - size + vel.x * 2 < 0 || pos.x + size + vel.x * 2 > width);
  }
}