//Shooter project 08
//Robin
//Particle manager

class ParticleManager{

	Particle[] particles = new Particle[10];

	void instaniate(PVector position, int lifeTime, int effect){
		for (int i = 0; i < particles.length; ++i) {
			if (particles[i] == null)
				switch (effect) {
					case 1: particles[i] = new FireEffect(position, lifeTime);
					return;
					case 2: particles[i] = new StarEffect(position, lifeTime);
					return;
				}
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
	};