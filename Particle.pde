//Shooter project 08
//Robin
//Particle base

class Particle {

	boolean removeMe = false;
	color particleColor = #FFAA00;
	Timer pLifeTime;

	PVector drawPos = new PVector();

	Particle(PVector pos, int lifeTime) {
		drawPos = pos;
		pLifeTime = new Timer(lifeTime);
		pLifeTime.start();
	}

	void draw(){
		if (pLifeTime.time()) {
			removeMe = true;
			return;
		}

		stroke(particleColor);
		fill(particleColor);
	}
};