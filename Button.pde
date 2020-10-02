// Jacob

class Button extends GameObject {
  String text;
  int textSize;
  IFunction function;

  Button(float x, float y, int objWidth, int objHeight, String text, int textSize, IFunction function) {
    super();
    this.pos.set(x, y);
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    this.text = text;
    this.textSize = textSize;
    this.function = function;
  }

  void draw() {
    rectMode(CENTER);
    fill(255);
    stroke(0);  
    if (isHovered())
      strokeWeight(1);
    else 
      strokeWeight(5);
      
    rect(pos.x, pos.y, objWidth, objHeight);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    text(text, pos.x, pos.y);
  }

  boolean isHovered() {
		// Check if wrong y -- mouseY < TopButton || mouseY > BotButton
		if (mouseY < pos.y - objHeight / 2 || mouseY > pos.y + objHeight / 2)
			return false;
		// Check if wrong x -- mouseX < LeftButton || mouseX > RightButton
		else if (mouseX < pos.x - objWidth / 2 || mouseX > pos.x + objWidth / 2) {
			return false;
		}
		else 
			return true;
  }
}
