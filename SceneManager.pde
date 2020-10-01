//Jacob
enum GameScene {
  TITLESCREEN,
  GAME,
  VICTORY,
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
  float backgroundPos = 0;

  SceneManager() {
    scene = GameScene.TITLESCREEN;
    state = GameState.RUNNING;
  }

  void setState(GameState newState) {
    if (scene == GameScene.GAME) {
      state = newState;
    }
  }

  void drawBackground() {
    background(0);

    fill(201, 248, 255);
    stroke(201, 248, 255);

    ellipse(width * 0.2, (height * 0.1 + 5 * backgroundPos) % height, 5, 5);

    ellipse(width * 0.4, (height * 0.35 + 7 * backgroundPos) % height, 7, 7);

    ellipse(width * 0.1, (height * 0.75 + 10 * backgroundPos) % height, 10, 10);

    ellipse(width * 0.3, (height * 0.4 + 5 * backgroundPos) % height, 5, 5);

    ellipse(width * 0.8, (height * 0.8 + 10 * backgroundPos) % height, 10, 10);

    ellipse(width * 0.9, (height * 0.1 + 7 * backgroundPos) % height, 7, 7);

    ellipse(width * 0.5, (height * 0.9 + 15 * backgroundPos) % height, 15, 15);

    if (scene == GameScene.GAME && state == GameState.RUNNING)
      backgroundPos += 0.1;
  }

  void loadTitleScreen() {
    buttons = new Button[3];
    buttons[0] = new Button(width / 2, height * 0.4, 150, 50, "SinglePlayer", 20, eventFunctions.startSinglePlayer());
    buttons[1] = new Button(width / 2, height * 0.4 + 75, 150, 50, "2-Players", 20, eventFunctions.start2Player());
    buttons[2] = new Button(width / 2, height * 0.67, 100, 33, "Quit", 15, eventFunctions.exitGame());
    playerManager.setPlayers(playerManager.playerCount);
    bulletManager.reset();
    
    scene = GameScene.TITLESCREEN;
    state = GameState.RUNNING;
  }

  void drawTitleScreen() {
    drawBackground();

    bulletManager.update();
    bulletManager.draw();

    playerManager.update();
    playerManager.draw();

    particleManager.draw();

    fill(255);
    textSize(64);
    text("Invaders of Space", width / 2, 100);

    for (Button button : buttons) {
      if (button == null) 
        continue;
      button.draw();
    }
  }

  void loadGame(int playerCount) {
    buttons = new Button[0];
    playerManager.setPlayers(playerCount);
    enemyManager.loadEnemies();
    enemyManager.resetTimers();
    bulletManager.reset();

    scene = GameScene.GAME;
    state = GameState.RUNNING;
  }

  void drawGame() {
    drawBackground();

    if (state == GameState.RUNNING) {
      playerManager.update();
      bulletManager.update();
      enemyManager.update();
    }

    //---Draw functions---
    enemyManager.draw();
    playerManager.draw();
    bulletManager.draw();
    scoreManager.draw();
    particleManager.draw();

    if (state != GameState.RUNNING) 
      drawState();
  }

  void loadVictory() {
    buttons = new Button[1];
    buttons[0] = new Button(width / 2, height * 0.6, 250, 50, "Return to title screen", 20, eventFunctions.loadTitleScreen());
    
    scene = GameScene.VICTORY;
    state = GameState.RUNNING;
  }

  void drawVictory() {
    drawBackground();

    textAlign(CENTER, CENTER);
    textSize(64);
    text("YOU WON", width / 2, height * 0.33);
    text(String.format("You scored: %d", scoreManager.playerScore), width / 2, height * 0.45);

    for (Button button : buttons) {
      button.draw();
    }
  }

  void togglePause() {
    if (state != GameState.GAMEOVER && scene == GameScene.GAME)
      state = state == GameState.RUNNING ? GameState.PAUSED : GameState.RUNNING;
  }

  void reset() {
    if (state == GameState.GAMEOVER) {
      loadTitleScreen();
      scoreManager.resetScore();
    }
  }

  void drawState() {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(64);
    text(state.name(), width / 2, height / 2);

    if (state == GameState.GAMEOVER) {
      textSize(40);
      text("Press 'R' to return to the title screen", width / 2, height / 2 + 64);
    }
  }
}
