// Jacob

class Octopus extends Enemy {
  
  Octopus(float x, float y) {
    super(x, y);
    this.pointValue = 40;
  }

  void draw() {
    super.draw();
    noStroke();
    
    // Body
    arc(pos.x, pos.y, objWidth, objHeight, PI, TWO_PI);
    
    stroke(255);

    // Legs
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
