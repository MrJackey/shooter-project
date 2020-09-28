Player player;

void setup() {
  size(800, 800);

  player = new Player(width / 2, height - 100);
}

void draw() {
  background(0);

  player.draw();
}
