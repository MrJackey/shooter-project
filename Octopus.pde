class Octopus extends Enemy {

  Octopus(float x, float y) {
    super(x, y);
  }

  void draw() {
    super.draw();
    arc(pos.x, pos.y, size, size, PI, TWO_PI);
    line(pos.x, pos.y, pos.x - radius, pos.y + radius);
    line(pos.x, pos.y, pos.x + radius, pos.y + radius);
  }
}