// Jacob

class EnemyManager {
  int enemyRowCount = 5,
  enemyPerRowCount = 11,
  moveCooldDown = 1000,
  fireCoolDown = 1000,
  gridY = 50;
  Enemy[][] enemyRows = new Enemy[enemyRowCount][enemyPerRowCount];
  int[] deadRows = new int[enemyPerRowCount];
  Timer moveTimer;
  Timer fireTimer;

  EnemyManager() {
    moveTimer = new Timer(moveCooldDown);
    moveTimer.start();
    fireTimer = new Timer(fireCoolDown);
    fireTimer.start();
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

    if (fireTimer.time()) {
      EnemyFire(int(random(0, enemyPerRowCount)));
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
    checkPlayerCollision();
  }

  void checkPlayerCollision() {
    for (int i = enemyRowCount - 1; i >= 0; i--) {
      if (deadRows[i] == 1)
        continue;

      for (int j = enemyPerRowCount - 1; j >= 0; j--) {
        if (enemyRows[i][j] == null) 
          continue;
        
        Enemy enemy = enemyRows[i][j];
        if (abs(enemy.pos.y - player.pos.y) < enemy.objHeight) {
          sceneManager.setState(GameState.GAMEOVER);
          return;
        }
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
  void EnemyFire(int randColumn) {
    for (int i = enemyRowCount - 1; i >= 0; i--) {

      if (deadRows[randColumn] != 1 && enemyRows[i][randColumn] != null){
        //Fire from enemy
        enemyRows[i][randColumn].fire();
        return;
      }
      //If no enemies are alive on the
      if (i == 0 || deadRows[randColumn] == 1) {
        deadRows[randColumn] = 1;
        randColumn = int(random(0, enemyPerRowCount));
        i = enemyRowCount - 1;
      }
      //If no enemies are alive
      if (!contains(deadRows, 0)) {
        enemyRowCount = 0;
      }
    } 
}
  boolean bulletIsColliding(Bullet bullet) {
    for (Enemy[] enemyRow : enemyRows) {
      for (int i = 0; i < enemyRow.length; i++) {
        if (enemyRow[i] == null) continue;

        if (bullet.isColliding(enemyRow[i])) {
          scoreManager.enemyKilled(enemyRow[i]);
          enemyRow[i] = null;
          return true;
        }
      }
    }
    return false;
  }
}