// Jacob

class VictoryScene extends Scene {

	VictoryScene() {
		super();
		buttons = new Button[1];
    buttons[0] = new Button(width / 2, height * 0.6, 250, 50, "Return to title screen", 20, eventFunctions.loadTitleScreen());
	}

	void draw() {
		super.draw();

		textAlign(CENTER, CENTER);
    textSize(64);
    text("YOU WON", width / 2, height * 0.33);
    text(String.format("You scored: %d", scoreManager.playerScore), width / 2, height * 0.45);

    for (Button button : buttons) {
      button.draw();
    }
	}
}
