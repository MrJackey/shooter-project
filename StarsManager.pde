// "Star Field" by Nerdvana Productions
// Some of the original code has been changed, moved and/or been 
// removed. New code has also been added. Changes has been made
// to fit our purpose. 
// From: https://www.openprocessing.org/sketch/65037/#

class StarsManager {
	Star[] stars;

	StarsManager (int ammount) {
		stars = new Star[ammount];

		for (int i = 0; i < stars.length; ++i) {
			stars[i] = new Star();
		}
	}

	void draw() {
		noStroke();
		fill(0, 0, 0);
		
		for (int i = 0; i < stars.length; ++i) {
			stars[i].draw();
		}
	}
}