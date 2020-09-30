//Jacob
enum GameState {
  TITLESCREEN,
  GAME,
}

class SceneManager {
  GameState state;
  Button[] buttons;

  SceneManager() {
    state = GameState.TITLESCREEN;
  }

  void loadTitleScreen() {
    buttons = new Button[2];
    buttons[0] = new Button(width / 2, height / 2, 150, 50, "Start Game", 20, eventFunctions.startGame());
    buttons[1] = new Button(width / 2, height * 0.67, 100, 33, "Quit", 15, eventFunctions.exitGame());
    player = new Player(100, height - 100);
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
    player = new Player(player.pos.x, player.pos.y);
    enemyManager.loadEnemies();
    state = GameState.GAME;
  }

  void drawGame() {
    background(0);

    player.move();
    enemyManager.update();

    enemyManager.draw();
    player.draw();
  }
}
