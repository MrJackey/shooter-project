// Jacob

class Player extends GameObject {
  int speed = 195;
  int pWidth = 50,
  pHeight = 20;
  color col = color(0, 205, 0);
  
  Bullet[] bullets = new Bullet[5];
  PVector firingPos;
  int firingHeight = 40;

  Player(float x, float y) {
    super();
    this.pos.set(x, y);
  }

  void draw() {
    noStroke();
    fill(col);
    rectMode(CENTER);

    rect(pos.x, pos.y, pWidth, pHeight, 7);
    rect(pos.x, pos.y - pHeight / 2, pWidth * 0.25, pHeight * 0.9, 5);

    UpdateBullets();
  }

  void move()
  {
    PVector inputTemp = inputAxis();

    if (pos.x <= (pWidth / 2) && inputTemp.x < 0)
     inputTemp.x = 0;
   else if (pos.x >= (width - pWidth / 2) && inputTemp.x > 0)
     inputTemp.x = 0;

   pos.add(inputTemp.mult(Time.deltaTime * speed));
   
   firingPos = pos.copy();
   firingPos.y += firingHeight;
 }

 void UpdateBullets() {
  for (int i = 0; i < bullets.length; ++i){
    if (bullets[i] == null)
      continue;
    if (bullets[i].removeMe){
      bullets[i] = null;
      continue;
    }

    bullets[i].draw();
    bullets[i].move();
    }
  }

  void fire() { 
    for (int i = bullets.length - 2; i >= 0; i--) {
      if (bullets[i] == null)
        continue;

      bullets[i+1] = bullets[i];
    }
    bullets[0] = new Bullet();
  }
}