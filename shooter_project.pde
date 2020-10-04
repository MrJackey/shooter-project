//Shooter project 08
import processing.sound.*;
SceneManager sceneManager;
EnemyManager enemyManager;
ScoreManager scoreManager;
BulletManager bulletManager;
ParticleManager particleManager;
PlayerManager playerManager;
SoundManager soundManager;
StarsManager starsManager;

EventFunction eventFunctions;

static final int FPS = 60;

void setup() {
	size(800, 800);
	frameRate(FPS);

	//Sets focus to window
	((java.awt.Canvas) surface.getNative()).requestFocus();
	surface.setLocation(0, 0);

	sceneManager = new SceneManager();
	enemyManager = new EnemyManager();
	scoreManager = new ScoreManager();
	bulletManager = new BulletManager();
	particleManager = new ParticleManager();
	playerManager = new PlayerManager();
	background(0);
	soundManager = new SoundManager(this);
	starsManager = new StarsManager(100);

	eventFunctions = new EventFunction();

	sceneManager.loadTitleScreen();
}

void draw() {
	deltaTimeBegin();

	sceneManager.draw();
	
	deltaTimeEnd();
}

//Run function as first command in draw()
void deltaTimeBegin() {
	Time.currentTime = millis();
	Time.deltaTime = (Time.currentTime - Time.time);
	Time.deltaTime *= Time.MULTI_DELTA;
}

//Run function as last command in draw()
void deltaTimeEnd() {
	Time.time = Time.currentTime;
}