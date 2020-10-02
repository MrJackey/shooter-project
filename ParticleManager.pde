//Shooter project 08
//Robin
//Particle manager

class ParticleManager {
	Particle[] particles = new Particle[10];

	void instantiate(Particle particle) {
		for (int i = 0; i < particles.length; ++i) {
			if (particles[i] == null)
				particles[i] = particle;
		}
	}

	void draw() {
		for (int i = 0; i < particles.length; ++i) {
			if (particles[i] == null)
				return;

			if (particles[i].removeMe) {
				particles[i] = null;
				continue;
			}

			particles[i].draw();
		}
	}
}