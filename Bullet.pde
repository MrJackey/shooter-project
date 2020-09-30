//Shooter project 08
//Robin
//Bullet

public class Bullet extends GameObject{
	int speed = 800;
	boolean removeMe = false;

	Bullet(PVector startPos, int direction)
	{
		pos = startPos.copy();
		this.vel.set(0, direction);
		this.objWidth = 5;
		this.objHeight = objWidth * 3;
	}

	void draw(){
		rectMode(CENTER);
		rect(pos.x, pos.y, objWidth, objHeight);
	}

	void move(){
		OutOfBounds();

		pos.add(PVector.mult(vel, Time.deltaTime * speed));
	}

	void OutOfBounds(){
		if (pos.y < 0)
			removeMe = true;
	}

	boolean isColliding(GameObject object) {
		// Check if wrong y -- TopBullet > BotEnemy || BotBullet < TopEnemy
		if (pos.y - objHeight / 2 > object.pos.y + object.objHeight / 2 || pos.y + objHeight / 2 < object.pos.y - object.objHeight / 2)
			return false;
		// Check if wrong x -- LeftBullet > RightEnemy || RightBullet < LeftEnemy
		else if (pos.x - objWidth / 2 > object.pos.x + object.objWidth / 2 || pos.x + objWidth / 2 < object.pos.x - object.objWidth / 2) {
			return false;
		}
		else
			return true;
	}
}
