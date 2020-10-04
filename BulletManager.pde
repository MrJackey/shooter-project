//Shooter project 08
//Robin
//Bullet manager

class BulletManager {
	color cpBullet = #00BBBB;
	color ceBullet = #FF0000;
	Bullet[] pBullets = new Bullet[0];
	Bullet[] eBullets = new Bullet[0];

	int pShootEffectDuration = 100;

	BulletManager() {}

	public void update() {
		//----Bullet update Player----
		for (int i = 0; i < pBullets.length; ++i) {
			if (pBullets[i] == null || enemyManager.bulletIsColliding(pBullets[i])){
				pBullets[i] = null;
				continue;
			}

			pBullets[i].move();

			if (pBullets[i].removeMe) {
				pBullets[i] = null;
				continue;
			}
		}
		//----Bullet update enemy----
		for (int i = 0; i < eBullets.length; ++i) {
			if(eBullets[i] != null){
				eBullets[i].move();
				if (playerManager.bulletIsColliding(eBullets[i]))
					eBullets[i] = null;
				else if (eBullets[i].removeMe) {
					eBullets[i] = null;
					continue;
				} 
			}
		}
	}

	public void draw() {
		//Draw player bullets
		for (int i = 0; i < pBullets.length; ++i) {
			if (pBullets[i] != null)
				pBullets[i].draw();
		}
		//Draw enemy bullets
		for (int i = 0; i < eBullets.length; ++i) {
			if (eBullets[i] != null)
				eBullets[i].draw();
		}
	}

	void reset() {
		pBullets = new Bullet[playerManager.playerCount * 2];
		eBullets = new Bullet[15];
	}

	public void instantiateAsPlayer(PVector position, int playerID) {
		for (int i = 0; i < pBullets.length; ++i) {
			if (pBullets[i] == null) {
				pBullets[i] = new Bullet(position, -1, cpBullet);
				soundManager.playerFire.play();
				particleManager.instantiate(new FireEffect(playerManager.players[playerID].pos, pShootEffectDuration));
				break;
			}
		}
	}

	public void instantiateAsEnemy(PVector position) {
		for (int i = 0; i < eBullets.length; ++i) {
			if (eBullets[i] == null) {
				soundManager.enemyFire.play();
				eBullets[i] = new Bullet(position, 1, ceBullet);
				break;
			}
		}
	}
}