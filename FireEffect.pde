//Shooter project 08
//Robin
//Fire effect

class FireEffect extends Particle {
	
	int posBuffer = 20;
	int maxXSize = 12;
	int ySize = 1;
	int activeXSize = 1;
	int sizeInc = 1;

	FireEffect(PVector pos, int lifeTime){
		super(pos, lifeTime);
		particleColor = #FFAA00;
	}

	void draw(){
		stroke(particleColor);
		strokeWeight(1);
		fill(particleColor);

		if (activeXSize >= maxXSize && pLifeTime.time()) {
			removeMe = true;
			return;
		}

		rect(drawPos.x, drawPos.y - posBuffer,
			activeXSize >= maxXSize ? (activeXSize = maxXSize) : (activeXSize += sizeInc),
			ySize);
	}
}