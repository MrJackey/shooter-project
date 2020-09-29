// Jacob

class Squid extends Enemy {

  Squid() {
    super();
    this.pos.set(width * 0.25, height / 2);
  }

  void draw() {
    super.draw();
    stroke(255);
    triangle(pos.x - radius, pos.y, pos.x, pos.y - radius, pos.x + radius, pos.y);
    line(pos.x, pos.y, pos.x - radius, pos.y + radius);
    line(pos.x, pos.y, pos.x + radius, pos.y + radius);
  }
}