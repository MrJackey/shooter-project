//Jacob
enum GameScene {
  TITLESCREEN,
  GAME,
}

enum GameState {
  RUNNING,
  PAUSED,
  GAMEOVER,
}

class SceneManager {
  GameScene scene;
  GameState state;
  Button[] buttons;

  SceneManager() {
    scene = GameScene.TITLESCREEN;
    state = GameState.RUNNING;
  }

  void setState(GameState newState) {
    if (scene == GameScene.GAME) {
      state = newState;
    }
  }

  void loadTitleScreen() {
    buttons = new Button[2];
    buttons[0] = new Button(width / 2, height / 2, 150, 50, "Start Game", 20, eventFunctions.startGame());
    buttons[1] = new Button(width / 2, height * 0.67, 100, 33, "Quit", 15, eventFunctions.exitGame());
    player = new Player(100, height - 100);
    
    scene = GameScene.TITLESCREEN;
    state = GameState.RUNNING;
  }

  void drawTitleScreen() {
    background(0);

    player.move();
    player.draw();

    fill(255);
    textSize(64);
    text("Invaders of Space", width / 2, 100);

    for (Button button : buttons) {
      if (button == null) 
        continue;
      button.draw();
    }
  }

  void loadGame() {
    buttons = new Button[0];
    player = new Player(player.pos.x, player.pos.y);
    enemyManager.loadEnemies();
    scene = GameScene.GAME;
    state = GameState.RUNNING;
  }

  void drawGame() {
    background(0);

    if (state == GameState.RUNNING) {
      player.move();
      enemyManager.update();
    }

    enemyManager.draw();
    player.draw();

    if (state != GameState.RUNNING) 
      drawState();
    scoreManager.drawScore();
  }

  void togglePause() {
    if (state != GameState.GAMEOVER && scene == GameScene.GAME)
      state = state == GameState.RUNNING ? GameState.PAUSED : GameState.RUNNING;
  }

  void reset() {
    if (state == GameState.GAMEOVER) {
      loadTitleScreen();
    }
  }

  void drawState() {
    fill(player.col);
    textAlign(CENTER, CENTER);
    textSize(64);
    text(state.name(), width / 2, height / 2);

    if (state == GameState.GAMEOVER) {
      textSize(40);
      text("Press 'R' to return to the title screen", width / 2, height / 2 + 64);
    }
  }
}
