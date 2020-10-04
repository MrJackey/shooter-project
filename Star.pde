// "Star Field" by Nerdvana Productions
// Some of the original code has been changed, moved and/or been 
// removed. New code has also been added. Changes has been made
// to fit our purpose. 
// From: https://www.openprocessing.org/sketch/65037/#

class Star {
	int xPos, yPos, starSize;
	int starSizeMax = 5,
		starSizeMin = 2;
	int xMax = width,
		yMax = height;
	float flickerRate, light;
	float flickerMax = 5,
		  flickerMin = 2;
	float lightMax = 245,
		  lightMin = 10;

	boolean rise;

	Star(){
		light = random(lightMin, lightMax);
		recreate();
		rise = true;
	}

	void draw(){
		if(light >= lightMax)
			rise = false;
		else if(light <= lightMin)
			recreate();

		if(rise == true)
			light += flickerRate;
		else if(rise == false)
			light -= flickerRate;

		fill(light);
		rect(xPos, yPos, starSize, starSize);
	}

	void recreate() {
		starSize = int(random(starSizeMin, starSizeMax));
		xPos = int(random(0, width - starSize));
		yPos = int(random(0, height - starSize));
		flickerRate = random(flickerMin, flickerMax);
		rise = true;
	}
}