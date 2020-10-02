// Jacob

class Explosion extends Particle {
  int angleCount = 16;
  float expansionRate = 1.03;
  PVector[] angles = new PVector[angleCount];

  Explosion(PVector pos, int duration) {
    super(pos, duration);
    this.particleColor = #FFAA00;

    for (int i = 0; i < angleCount; i++) {
      this.angles[i] = PVector.fromAngle((TWO_PI / angleCount) * i);
    }
  }

  void draw() {
    super.draw();

    for (PVector angle : angles) {
      line(drawPos.x, drawPos.y, drawPos.x + angle.x, drawPos.y + angle.y);
      angle.mult(expansionRate);
    }
  }
}
