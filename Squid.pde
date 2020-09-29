// Jacob

class Squid extends Enemy {

  Squid(float x, float y) {
    super(x, y);
  }

  void draw() {
    super.draw();
    stroke(255);
    triangle(pos.x - radius, pos.y, pos.x, pos.y - radius, pos.x + radius, pos.y);
    line(pos.x, pos.y, pos.x - radius, pos.y + radius);
    line(pos.x, pos.y, pos.x + radius, pos.y + radius);
  }
}