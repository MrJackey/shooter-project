//Shooter project 08
//Robin
//Input manager

PVector inputAxis = new PVector(0,0);
boolean p1Left = false;
boolean p1Right = false;
boolean p2Left = false;
boolean p2Right = false;

void keyPressed() {
	//---MOVEMENT---
	if (key == 'a' || key == 'A')
		p1Left = true;
	if (key == 'd' || key == 'D')
		p1Right = true;
	if (keyCode == LEFT) 
		p2Left = true;
	if (keyCode == RIGHT)
		p2Right = true;

	//---ACTIONS---
	if(key == ' ')
		playerManager.fire(0);
	if (key == '.')
		playerManager.fire(1);
	if (key == 'p' || key == 'P')
		sceneManager.togglePause();
	if (key == 'r' || key == 'R')
		sceneManager.reset();
}

void keyReleased() {
	if (key == 'a' || key == 'A')
		p1Left = false;
	if (key == 'd' || key == 'D')
		p1Right = false;
	if (keyCode == LEFT) 
		p2Left = false;
	if (keyCode == RIGHT)
		p2Right = false;
}

void mousePressed() {
	for (Button button : sceneManager.currentScene.buttons) {
		if (button.isHovered()) {
			button.function.run();
			sounds.buttonPressed.play();
			break;
		}
	}
}

PVector inputAxis(int playerID) {
	inputAxis.set(0, 0);
	if (playerID == 0) {
		if (p1Left)
			inputAxis.x -= 1;
		if (p1Right)
			inputAxis.x += 1;
	}
	if (playerID == 1) {
		if (p2Left)
			inputAxis.x -= 1;
		if (p2Right)
			inputAxis.x += 1;
	}

	return inputAxis.copy();
}
