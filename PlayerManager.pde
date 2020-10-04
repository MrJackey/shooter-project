// Jacob

class PlayerManager {
  Player[] players = new Player[0];
  int playerCount = 1,
  playerHealth = 3,
  loseY = height - 100;

  PlayerManager() {}

  void resetPlayers(int totalPlayers) {
    playerCount = totalPlayers;
    players = new Player[playerCount];

    for (int i = 0; i < players.length; i++) {
      players[i] = new Player(i);
    }

    playerHealth = 3;
  }

  void update() {
    for (Player player : players) {
      player.move();
    }
  }

  void draw() {
    for (Player player : players) {
      player.draw();
    }
  }

  void drawLives() {
    fill(0, 205, 0);
    textSize(32);
    textAlign(RIGHT, BOTTOM);
    text(String.format("Lives: %d", playerHealth), width - 10, height - 10);
  }

  void fire(int playerID) {
    if (players.length - 1 >= playerID)
      players[playerID].fire();
  }

  boolean bulletIsColliding(Bullet bullet) {
    for (Player player : players) {
      if (bullet.isColliding(player)) {
        soundManager.explotion.play();
        takeDamage();
        return true;
      }
    }
    return false;
  }

  void takeDamage() {
    playerHealth--;

    if (playerHealth <= 0) {
      soundManager.defeat.play();
      sceneManager.setState(GameStates.GAMEOVER);
    }
  }
}
