

public class StarEffect extends Particle{

	float maxSize = 50;
	float activeSize = 1;
	int sizeInc = 1;
	int lifetime = 1000;

	int widthOffset = 10;
	int topOffset = 20;
	int botOffset = 65;

	color starColor = #e1f4f4;
	boolean growing = true;

	StarEffect(PVector pos, int lifeTime){
		super(pos, lifeTime);
		drawPos = new PVector(
			random(widthOffset, width - widthOffset),
			random(topOffset, height - botOffset));
	}

	void draw(){
		noStroke();
		fill(starColor);
		//Liten -> stor -> liten

		if (growing) {
			ellipse(drawPos.x, drawPos.y,
				(activeSize >= maxSize ? (activeSize = maxSize) : (activeSize += sizeInc)),
				activeSize);
			//Other solution??
			if (activeSize >= maxSize)
				growing = false;

		} else if (!growing) {
			ellipse(drawPos.x, drawPos.y,
				activeSize <= 1 ? (activeSize = 1) : (activeSize -= sizeInc),
				activeSize);
			if (activeSize == 1)
				removeMe = true;
		}
	}
}