SceneManager sceneManager = new SceneManager();
EnemyManager enemyManager = new EnemyManager();
EventFunction eventFunctions = new EventFunction();
ScoreManager scoreManager = new ScoreManager();
BulletManager bulletManager = new BulletManager();
ParticleManager particleManager = new ParticleManager();
PlayerManager playerManager = new PlayerManager();
Player player;
static final int FPS = 60;

void setup() {
	size(800, 800);
	frameRate(FPS);

	((java.awt.Canvas) surface.getNative()).requestFocus(); //Sets focus to window
	surface.setLocation(0,0);

	sceneManager.loadTitleScreen();
}

void draw() {
	deltaTimeBegin();

	switch (sceneManager.scene) {
		case TITLESCREEN :
			sceneManager.drawTitleScreen();
		break;	
		case GAME :
			sceneManager.drawGame();
		break;	
		case VICTORY : 
			sceneManager.drawVictory();
		break;
		default : 
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
