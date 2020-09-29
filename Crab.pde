class Crab extends Enemy {

  Crab() {
   super();
   this.pos.set(width * 0.75, height / 2); 
  }

  void draw() {
    super.draw();
    rectMode(CENTER);
    // Body
    rect(pos.x, pos.y, size, radius, 5);

    // Antennas
    line(pos.x, pos.y, pos.x - radius / 2, pos.y - radius);
    line(pos.x, pos.y, pos.x + radius / 2, pos.y - radius);

    // Arms
    line(pos.x - radius, pos.y - radius / 2, pos.x - size * 0.7, pos.y + radius / 2);
    line(pos.x + radius, pos.y - radius / 2, pos.x + size * 0.7, pos.y + radius / 2);


    // Mouth
    line(pos.x - radius, pos.y + radius / 2, pos.x - size * 0.2, pos.y + radius);
    line(pos.x + radius, pos.y + radius / 2, pos.x + size * 0.2, pos.y + radius);
  }
}