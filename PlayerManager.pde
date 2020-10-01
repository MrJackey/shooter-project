// Jacob

class PlayerManager {
  Player[] players = new Player[0];
  int playerCount = 1,
    loseY;

  PlayerManager() {}

  void setPlayers(int totalPlayers) {
    playerCount = totalPlayers;
    players = new Player[playerCount];
    loseY = height - 100;

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
    if (players[playerID] != null)
      players[playerID].fire();
  }

  boolean bulletIsColliding(Bullet bullet) {
    for (Player player : players) {
      if (bullet.isColliding(player)) {
        particleManager.instantiate(new Explosion(player.pos, 150));
        sceneManager.setState(sceneManager.state.GAMEOVER);
        return true;
      }
    }
    return false;
  }
}
