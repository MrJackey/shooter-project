// Jacob

class TitleScreenScene extends Scene {
	
	TitleScreenScene() {
		super();
		this.buttons = new Button[3];
    this.buttons[0] = new Button(width / 2, height * 0.4, 150, 50, "SinglePlayer", 20, eventFunctions.startSinglePlayer());
    this.buttons[1] = new Button(width / 2, height * 0.4 + 75, 150, 50, "2-Players", 20, eventFunctions.start2Player());
    this.buttons[2] = new Button(width / 2, height * 0.67, 100, 33, "Quit", 15, eventFunctions.exitGame());
    playerManager.resetPlayers(playerManager.playerCount);
    }

    void draw() {
      super.draw();
      bulletManager.update();
      bulletManager.draw();

      playerManager.update();
      playerManager.draw();

      particleManager.draw();

      fill(255);
      textSize(64);
      textAlign(CENTER, CENTER);
      text("Invaders of Space", width / 2, 100);

      for (Button button : buttons) {
          if (button == null) 
            continue;
        button.draw();
    }
}
}
