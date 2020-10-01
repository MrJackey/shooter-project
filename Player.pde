// Jacob

class Player extends GameObject {
  int speed = 195;
  color col = color(0, 205, 0);

  Player(float x, float y) {
    super();
    this.pos.set(x, y);
    objWidth = 50;
    objHeight = 20;
  }

  void draw() {
    noStroke();
    fill(col);
    rectMode(CENTER);

    rect(pos.x, pos.y, objWidth, objHeight, 7);
    rect(pos.x, pos.y - objHeight / 2, objWidth * 0.25, objHeight * 0.9, 5);
  }

  void move()
  {
    PVector inputTemp = inputAxis();

    if (pos.x <= (objWidth / 2) && inputTemp.x < 0)
     inputTemp.x = 0;
   else if (pos.x >= (width - objWidth / 2) && inputTemp.x > 0)
     inputTemp.x = 0;

   pos.add(inputTemp.mult(Time.deltaTime * speed));
 }

  void fire() { 
    if (sceneManager.state == GameState.GAMEOVER)
      return;

    bulletManager.instantiateAsPlayer(pos);
  }
}