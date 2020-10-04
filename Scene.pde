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

    fill(201, 248, 255);
    stroke(201, 248, 255);

    ellipse(width * 0.2, (height * 0.1 + 5 * backgroundPos) % height, 5, 5);

    ellipse(width * 0.4, (height * 0.35 + 7 * backgroundPos) % height, 7, 7);

    ellipse(width * 0.1, (height * 0.75 + 10 * backgroundPos) % height, 10, 10);

    ellipse(width * 0.3, (height * 0.4 + 5 * backgroundPos) % height, 5, 5);

    ellipse(width * 0.8, (height * 0.8 + 10 * backgroundPos) % height, 10, 10);

    ellipse(width * 0.9, (height * 0.1 + 7 * backgroundPos) % height, 7, 7);

    ellipse(width * 0.5, (height * 0.9 + 15 * backgroundPos) % height, 15, 15);

    if (sceneManager.scene == GameScenes.GAME && state == GameStates.RUNNING)
      backgroundPos += 0.1;
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
