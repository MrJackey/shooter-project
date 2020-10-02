// Jacob

class GameScene extends Scene {

	GameScene(int playerCount) {
		super();
    playerManager.setPlayers(playerCount);
    enemyManager.loadEnemies();
	}

	void draw() {
		super.draw();

		if (state == GameStates.RUNNING) {
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

    if (state != GameStates.RUNNING) 
      drawState();
	}
}