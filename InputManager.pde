//Shooter project 08
//
//Input manager

public PVector inputAxis = new PVector(0,0);
public boolean fire = false;

void keyPressed()
{
	//---MOVEMENT---
	if (keyCode == LEFT || key == 'a' || key == 'A')
		inputAxis.x = (-1);
	if (keyCode == RIGHT || key == 'd' || key == 'D')
		inputAxis.x = (1);
	
	//---ACTIONS---
	if(keyCode == SPACE)
		fire = true;
}

void keyReleased()
{
	if (keyCode == LEFT || key == 'a' || key == 'A')
		inputAxis.x = (0);
	if (keyCode == RIGHT || key == 'd' || key == 'D')
		inputAxis.x = (0);

	if(keyCode == SPACE)
		fire = false;
}