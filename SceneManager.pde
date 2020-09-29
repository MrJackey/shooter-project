//Jacob
enum GameState {
  TITLESCREEN,
  INGAME,
}

class SceneManager {
  GameState state;

  SceneManager() {
    state = GameState.INGAME;
  }

  void drawGame() {
    background(0);

    player.move();
    enemyManager.update();

    enemyManager.draw();
    player.draw();
  }
}
