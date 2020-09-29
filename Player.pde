// Jacob

class Player extends GameObject {
  int w = 50, 
    h = 20,
    speed = 6;
  color col = color(0, 205, 0);

  Player(float x, float y) {
    super();
    this.pos.set(x, y);
  }

  void draw() {
    noStroke();
    fill(col);
    rectMode(CENTER);

    rect(pos.x, pos.y, w, h, 7);
    rect(pos.x, pos.y - h / 2, w * 0.25, h * 0.9, 5);
  }
}
