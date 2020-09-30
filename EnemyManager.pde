// Jacob

class EnemyManager {
  int enemyRowCount = 5,
    enemyPerRowCount = 11,
    moveCooldDown = 1000,
    gridY = 50;
  Enemy[][] enemyRows = new Enemy[enemyRowCount][enemyPerRowCount];
  Timer moveTimer;

  EnemyManager() {
    moveTimer = new Timer(moveCooldDown);
    moveTimer.start();
  }

  void loadEnemies() {
    float gridX = width / (enemyPerRowCount + 1); 
    for (int i = 0; i < enemyPerRowCount; i++) {
      enemyRows[0][i] = new Squid(gridX * (i + 1), gridY);
    }
    for (int i = 0; i < enemyPerRowCount; i++) {
      enemyRows[1][i] = new Crab(gridX * (i + 1), 2*gridY);
      enemyRows[2][i] = new Crab(gridX * (i + 1), 3*gridY);
    }
    for (int i = 0; i < enemyPerRowCount; i++) {
      enemyRows[3][i] = new Octopus(gridX * (i + 1), 4*gridY);
      enemyRows[4][i] = new Octopus(gridX * (i + 1), 5*gridY);
    }
  }

  void update() {
    boolean advance = false;
    if (moveTimer.time()) {
      for (Enemy[] enemyRow : enemyRows) {
        for (Enemy enemy : enemyRow) {
          if (enemy == null) 
            continue;
          if (enemy.isOutsideBounds())
            advance = true;
          enemy.update();
        }
      }

      moveTimer._waitTime *= 0.99; 
      if (advance)
        advance(gridY);
    }
  }

  void advance(int dist) {
    for (Enemy[] enemyRow : enemyRows) {
      for (Enemy enemy : enemyRow) {
        if (enemy == null) continue;
        enemy.pos.y += dist;
        enemy.vel.x *= -1;
        enemy.update();
      }
    }
  }

  void draw() {
    for (Enemy[] enemyRow : enemyRows) {
      for (Enemy enemy : enemyRow) {
        if (enemy == null) continue;
        enemy.draw();
      }
    }
  }

  boolean bulletIsColliding(Bullet bullet) {
    for (Enemy[] enemyRow : enemyRows) {
      for (int i = 0; i < enemyRow.length; i++) {
        if (enemyRow[i] == null) continue;

        if (bullet.isColliding(enemyRow[i])) {
          enemyRow[i] = null;
          return true;
        }
      }
    }
    return false;
  }
}
