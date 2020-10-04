//
// Robin
// Sound manager

public class Sounds {
	PApplet parent;

	SoundFile playerFire;
	SoundFile enemyFire;
	
	SoundFile defeat;
	SoundFile victory;
	SoundFile explosion;
	SoundFile bulletHit;

	Sounds(PApplet parent) {
		this.parent = parent;

		playerFire = new SoundFile(this.parent, "playerFire.wav");

		enemyFire = new SoundFile(this.parent, "enemyFire.wav");

		defeat = new SoundFile(this.parent, "defeat.wav");
		victory = new SoundFile(this.parent, "victory.wav");
		explosion = new SoundFile(this.parent, "explotion.wav");
		bulletHit = new SoundFile(this.parent, "bulletHit.wav");
	}
}
