//Shooter project 08
//Robin
//Particle base

class Particle {
	boolean removeMe = false;
	color particleColor = #FFAA00;
	Timer pLifeTime;

	PVector pos = new PVector();

	Particle(PVector pos, int lifeTime) {
		this.pos = pos;
		this.pLifeTime = new Timer(lifeTime);
		this.pLifeTime.start();
	}

	void draw() {
		if (pLifeTime.time()) {
			removeMe = true;
			return;
		}

		stroke(particleColor);
		fill(particleColor);
	}
}