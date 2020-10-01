//Shooter project 08
//Robin
//Score Manager

class ScoreManager{

	int playerScore;
	int textSize = 20;
	color textColor = #ED6C00;
	PVector displayPos = new PVector();

	ScoreManager(){
		displayPos.x = width * 0.2;
		displayPos.y =  height * 0.4;
	}

	void enemyKilled(Enemy enemy){
		playerScore += enemy.pointValue = 30;
	}

	void draw(){
		textAlign(LEFT);
		textSize(35);
		fill(textColor);
		text(playerScore,
			displayPos.x,
			displayPos.y);
	}

	void resetScore(){
		playerScore = 0;
	}
};