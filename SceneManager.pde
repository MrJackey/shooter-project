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

    for (Enemy enemy : enemies) {
      enemy.draw();
    }

    player.draw();
    player.move();
  }
}
