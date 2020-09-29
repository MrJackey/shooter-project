//Shooter project 08
//Robin
//Bullet

public class Bullet extends GameObject{
	float speed = 800,
	bWidth = 5,
	bHeight = bWidth * 3;
	int dir;
	boolean removeMe = false;

	Bullet(PVector startPos, int direction)
	{
		pos = startPos.copy();
		dir = direction;
	}

	void draw(){
		rect(pos.x, pos.y, bWidth, bHeight);
	}

	void move(){
		OutOfBounds();

		PVector move = new PVector(0, dir);
		pos.add(move.mult(Time.deltaTime * speed));
	}

	void OutOfBounds(){
		if (pos.y < 0)
			removeMe = true;
	}
};