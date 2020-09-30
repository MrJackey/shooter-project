//Shooter project 08
//Robin
//Bullet manager

class BulletManager{

	Bullet[] pBullets = new Bullet[2];
	Bullet[] eBullets = new Bullet[15];

	int pCoolTime = 500;
	Timer timerCoolDown;

	BulletManager(){
		timerCoolDown = new Timer(pCoolTime);
		timerCoolDown.start();
	}

	public void instantiateAsEnemy(PVector position){
		for (int i = 0; i < eBullets.length; ++i) {
			if (eBullets[i] == null) {
				eBullets[i] = new Bullet(position, 1);
				continue;
			}
		}
	}

	public void instantiateAsPlayer(PVector position){

		if (!timerCoolDown.time())
			return;

		if (pBullets[0] == null) {
			pBullets[0] = new Bullet(position, -1);
		}
		else if (pBullets[1] == null) {
			pBullets[1] = new Bullet(position, -1);
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
			pBullets[i].draw();
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
				} else
				eBullets[i].draw();
			}
		}
	}
};