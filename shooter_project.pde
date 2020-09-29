SceneManager sceneManager = new SceneManager();
Player player;

void setup() {
  size(800, 800);

  player = new Player(width / 2, height - 100);
}

void draw() {
  switch (sceneManager.state) {
    case INGAME :
      sceneManager.drawGame();
    break;	
  }
}
