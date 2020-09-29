// Jacob

class Enemy extends GameObject {
  float fireRate, 
    moveRate;
  int size = 32,
    radius = size / 2;

  Enemy() {
    super();
  }

  void draw() {
    fill(255);
    stroke(255);
  }
}