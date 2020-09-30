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
  }

  void draw() {
    for (Enemy[] enemyRow : enemyRows) {
      for (Enemy enemy : enemyRow) {
        if (enemy == null) continue;
        enemy.draw();
      }
    }
  }

  void EnemyFire(int random) {
    for (int i = enemyRowCount - 1; i >= 0; i--) {

      if (deadRows[random] != 1 && enemyRows[i][random] != null){
        //Fire from enemy
        enemyRows[i][random].fire();
        return;
      }
      if (i == 0 || deadRows[random] == 1) {
        deadRows[random] = 1;
        random = int(random(0, enemyPerRowCount));
        i = enemyRowCount - 1;
      }
      if (!contains(deadRows, 0)) {
        enemyRowCount = 0;
      }
    } 
  }
}

public boolean contains(int[] arr, int check) {
  for (int i = 0; i < arr.length; ++i) {
    if (arr[i] == check) {
      return true;
    }
  }
  return false;
}