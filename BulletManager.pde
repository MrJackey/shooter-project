//Shooter project 08
//Robin
//Bullet manager

class BulletManager{
	color cpBullet = #00BBBB;
	color ceBullet = #FF0000;
	Bullet[] pBullets = new Bullet[2];
	Bullet[] eBullets = new Bullet[15];

	int pShootCooldown = 100;
	int pCoolTime = 500;
	Timer timerCoolDown;

	BulletManager(){
		//Move to player
		timerCoolDown = new Timer(pCoolTime);
		timerCoolDown.start();
	}

	public void instantiateAsEnemy(PVector position){
		for (int i = 0; i < eBullets.length; ++i) {
			if (eBullets[i] == null) {
				eBullets[i] = new Bullet(position, 1, ceBullet);
				break;
			}
		}
	}

	public void instantiateAsPlayer(PVector position){
		if (!timerCoolDown.time())
			return;

		for (int i = 0; i < pBullets.length; ++i) {
			if (pBullets[i] == null) {
				pBullets[i] = new Bullet(position, -1, cpBullet);
				particleManager.instaniate(player.pos, pShootCooldown);
				break;
			}
		}
	}

	public void update(){
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
				if (eBullets[i].isColliding(player)) {
					eBullets[i] = null;
					sceneManager.setState(sceneManager.state.GAMEOVER);
				} else if (eBullets[i].removeMe) {
					eBullets[i] = null;
					continue;
				} 
			}
		}
	}

	public void draw(){
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
};