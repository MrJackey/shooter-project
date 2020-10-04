//
// Robin
// Sound manager

public class Sounds {
	PApplet parent;

	SoundFile playerFire;
	SoundFile enemyFire;

	SoundFile buttonPressed;
	
	SoundFile defeat;
	SoundFile victory;
	SoundFile explosion;
	SoundFile bulletHit;

	Sounds(PApplet parent) {
		this.parent = parent;

		playerFire = new SoundFile(this.parent, "playerFire.wav");

		enemyFire = new SoundFile(this.parent, "enemyFire.wav");

		buttonPressed = new SoundFile(this.parent, "buttonPressed.wav");

		defeat = new SoundFile(this.parent, "defeat.wav");
		victory = new SoundFile(this.parent, "victory.wav");
		explosion = new SoundFile(this.parent, "explosion.wav");
		bulletHit = new SoundFile(this.parent, "bulletHit.wav");
	}
}
