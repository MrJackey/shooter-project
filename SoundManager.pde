//
// Robin
// Sound manager

public class SoundManager {

	PApplet parent;

	SoundFile playerFire;
	SoundFile enemyFire;
	
	SoundFile defeat;
	SoundFile victory;
	SoundFile explotion;
	SoundFile bulletHit;

	SoundManager(PApplet parent) {
		this.parent = parent;

		playerFire = new SoundFile(this.parent, "playerFire.wav");

		enemyFire = new SoundFile(this.parent, "enemyFire.wav");

		defeat = new SoundFile(this.parent, "defeat.wav");
		victory = new SoundFile(this.parent, "victory.wav");
		explotion = new SoundFile(this.parent, "explotion.wav");
		bulletHit = new SoundFile(this.parent, "bulletHit.wav");
	}
}
