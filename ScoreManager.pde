//Shooter project 08
//Robin
//Score Manager

class ScoreManager {
	int playerScore;
	int textSize = 20;
	color textColor = #ED6C00;
	PVector pos = new PVector();

	ScoreManager() {
		this.pos.x = width * 0.2;
		this.pos.y =  height * 0.4;
	}

	void draw() {
		textAlign(LEFT);
		textSize(35);
		fill(textColor);

		text(playerScore,
			pos.x,
			pos.y);
	}
	
	void enemyKilled(Enemy enemy) {
		playerScore += enemy.pointValue = 30;
	}

	void resetScore() {
		playerScore = 0;
	}
}