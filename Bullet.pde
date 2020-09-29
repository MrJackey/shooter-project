//Shooter project 08
//Robin
//Bullet

public class Bullet extends GameObject{
	float speed = 800,
	bWidth = 5,
	bHeight = bWidth * 3;
	int fireHeight = 20;
	boolean removeMe = false;

	Bullet()
	{
		pos = player.pos.copy();
		pos.y -= fireHeight;
	}

	void draw(){
		rect(pos.x, pos.y, bWidth, bHeight);
	}

	void move(){
		OutOfBounds();

		PVector move = new PVector(0, -1);
		pos.add(move.mult(Time.deltaTime * speed));
	}

	void OutOfBounds(){
		if (pos.y < 0)
			removeMe = true;
	}
};