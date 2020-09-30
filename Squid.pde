// Jacob

class Squid extends Enemy {

  Squid(float x, float y) {
    super(x, y);
    pointValue = 30;
  }

  void draw() {
    super.draw();
    stroke(255);

    triangle(pos.x - radius, pos.y, pos.x, pos.y - radius, pos.x + radius, pos.y);

    if (anim == 0) {
      line(pos.x, pos.y, pos.x - radius, pos.y + radius);
      line(pos.x, pos.y, pos.x + radius, pos.y + radius);
    } else {
      noFill();
      arc(pos.x, pos.y + radius / 2, radius * 1.5, radius, HALF_PI + QUARTER_PI, PI + QUARTER_PI);
      arc(pos.x, pos.y + radius / 2, radius * 1.5, radius, TWO_PI - QUARTER_PI, TWO_PI + QUARTER_PI);
    }

    drawEyes();
  }
}