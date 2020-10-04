//Jacob

enum GameScenes {
  TITLESCREEN,
  GAME,
  VICTORY,
}

class SceneManager {
  GameScenes scene;
  Scene currentScene;

  SceneManager() {}

  void draw() {
    currentScene.draw();
  }

  void loadTitleScreen() {
    currentScene = new TitleScreenScene();
    
    scene = GameScenes.TITLESCREEN;
  }

  void loadGame(int playerCount) {
    currentScene = new GameScene(playerCount);

    scene = GameScenes.GAME;
  }

  void loadVictory() {
    currentScene = new VictoryScene();
    
    scene = GameScenes.VICTORY;
  }

  GameStates getState() {
    return currentScene.state;
  }
  
  void setState(GameStates newState) {
    if (scene == GameScenes.GAME) {
      currentScene.state = newState;
    }
  }

  void togglePause() {
    if (currentScene.state != GameStates.GAMEOVER && scene == GameScenes.GAME)
      currentScene.state = currentScene.state == GameStates.RUNNING ? GameStates.PAUSED : GameStates.RUNNING;
  }

  void reset() {
    if (currentScene.state == GameStates.GAMEOVER) {
      loadTitleScreen();
      scoreManager.resetScore();
    }
  }
}
