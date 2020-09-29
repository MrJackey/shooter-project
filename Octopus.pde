class Octopus extends Enemy {

  Octopus() {
    super();
    this.pos.set(width / 2, height / 2);
  }

  void draw() {
    super.draw();
    arc(pos.x, pos.y, size, size, PI, TWO_PI);
    line(pos.x, pos.y, pos.x - radius, pos.y + radius);
    line(pos.x, pos.y, pos.x + radius, pos.y + radius);
  }
}