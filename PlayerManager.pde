// Jacob

class PlayerManager {
  Player[] players = new Player[0];
  int playerCount = 1,
    loseY = height - 100;

  PlayerManager() {}

  void setPlayers(int totalPlayers) {
    playerCount = totalPlayers;
    players = new Player[playerCount];

    for (int i = 0; i < players.length; i++) {
      players[i] = new Player(i);
    }
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

  void fire(int playerID) {
    if (players.length - 1 >= playerID)
      players[playerID].fire();
  }

  boolean bulletIsColliding(Bullet bullet) {
    for (Player player : players) {
      if (bullet.isColliding(player)) {
        sceneManager.setState(sceneManager.state.GAMEOVER);
        soundManager.explotion.play();
        soundManager.defeat.play();
        return true;
      }
    }
    return false;
  }
}
