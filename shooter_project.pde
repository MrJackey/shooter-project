SceneManager sceneManager = new SceneManager();
Player player;

void setup() {
	size(800, 800);

	((java.awt.Canvas) surface.getNative()).requestFocus(); //Sets focus to window
	surface.setLocation(0,0);

	player = new Player(width / 2, height - 100);
}

void draw() {
	DeltaTimeBegin();

	switch (sceneManager.state) {
		case INGAME :
		sceneManager.drawGame();
		break;	
	}

	DeltaTimeEnd();
}

//Run function as first command in draw()
void DeltaTimeBegin()
{
	Time.currentTime = millis();
	Time.deltaTime = (Time.currentTime - Time.time);
	Time.deltaTime *= Time.MULTI_DELTA;
}
//Run function as last command in draw()
void DeltaTimeEnd()
{
	Time.time = Time.currentTime;
}