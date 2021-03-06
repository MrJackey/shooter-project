// Jacob

enum GameStates {
  RUNNING,
  PAUSED,
  GAMEOVER,
}

class Scene {
	Button[] buttons = new Button[0];
	int backgroundPos = 0;
	GameStates state = GameStates.RUNNING;

	Scene() {
		enemyManager.reset();
		bulletManager.reset();
	}

	void draw() {
		drawBackground();
	}

	void drawBackground() {
    background(0);
    starsManager.draw();
  }

	void drawState() {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(64);
    text(state.name(), width / 2, height / 2);

    if (state == GameStates.GAMEOVER) {
      textSize(40);
      text("Press 'R' to return to the title screen", width / 2, height / 2 + 64);
    }
  }
}
