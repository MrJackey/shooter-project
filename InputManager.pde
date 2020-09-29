//Shooter project 08
//Robin
//Input manager

PVector inputAxis = new PVector(0,0);
boolean fire = false;
boolean left = false;
boolean right = false;

void keyPressed()
{
	//---MOVEMENT---
	if (keyCode == LEFT || key == 'a' || key == 'A')
		left = true;
	if (keyCode == RIGHT || key == 'd' || key == 'D')
		right = true;
	
	//---ACTIONS---
	if(key == ' ')
		fire = true;
}

void keyReleased()
{
	if (keyCode == LEFT || key == 'a' || key == 'A')
		left = false;
	if (keyCode == RIGHT || key == 'd' || key == 'D')
		right = false;

	if(key == ' ')
		fire = false;
}

PVector inputAxis(){
	inputAxis.set(0, 0);
	if (left)
		inputAxis.x -= 1;
	if (right)
		inputAxis.x += 1;

	return inputAxis.copy();
}

boolean inputFire(){
	return fire;
}