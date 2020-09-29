SceneManager sceneManager = new SceneManager();
EnemyManager enemyManager = new EnemyManager();
Player player;

void setup() {
	size(800, 800);

	((java.awt.Canvas) surface.getNative()).requestFocus(); //Sets focus to window
	surface.setLocation(0,0);

	player = new Player(width / 2, height - 100);
  enemyManager.loadEnemies();
}

void draw() {
	deltaTimeBegin();

	switch (sceneManager.state) {
		case INGAME :
		sceneManager.drawGame();
		break;	
	}

	deltaTimeEnd();
}

//Run function as first command in draw()
void deltaTimeBegin()
{
	Time.currentTime = millis();
	Time.deltaTime = (Time.currentTime - Time.time);
	Time.deltaTime *= Time.MULTI_DELTA;
}
//Run function as last command in draw()
void deltaTimeEnd()
{
	Time.time = Time.currentTime;
}