class Crab extends Enemy {

  Crab(float x, float y) {
   super(x, y); 
   pointValue = 50;
  }

  void draw() {
    super.draw();
    rectMode(CENTER);
    // Body
    rect(pos.x, pos.y, objWidth, radius, 5);

    // Antennas
    line(pos.x, pos.y, pos.x - radius / 2, pos.y - radius);
    line(pos.x, pos.y, pos.x + radius / 2, pos.y - radius);

    if (anim == 0) {
      // Arms
      line(pos.x - radius, pos.y - radius / 2, pos.x - objWidth * 0.7, pos.y + radius / 2);
      line(pos.x + radius, pos.y - radius / 2, pos.x + objWidth * 0.7, pos.y + radius / 2);

      // Mouth
      line(pos.x - radius, pos.y + radius / 2, pos.x - objWidth * 0.2, pos.y + radius);
      line(pos.x + radius, pos.y + radius / 2, pos.x + objWidth * 0.2, pos.y + radius);
    } else {
      // Arms
      line(pos.x - radius, pos.y - radius / 2, pos.x - objWidth * 0.7, pos.y - radius);
      line(pos.x + radius, pos.y - radius / 2, pos.x + objWidth * 0.7, pos.y - radius);

      // Mouth
      line(pos.x, pos.y, pos.x - radius, pos.y + radius);
      line(pos.x, pos.y, pos.x + radius, pos.y + radius);

    }
    
    drawEyes();
  }
}