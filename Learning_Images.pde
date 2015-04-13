PImage helicopter;
float y = 0;
int x = 0;
float enemySpawn = 0;
float enemyX = 0;
float enemyY = 0;

void setup()
{
  //
  // set the size of the canvas
  //
  size(500, 300);

  //
  //saying that helicopter is the name of the file
  //
  helicopter = loadImage("helicopter left to right.gif");

  //
  //run newHeli
  //
  newHeli();
}

void draw()
{
  //
  //make the background
  //
  background(233);

  //
  //make the helicopter image appear
  //
  image(helicopter, x, y);
  
  //
  //the enemy will be a box for testing purposes
  //
  rect(enemyX, enemyY, 25, 25);

  //
  //update x position
  //
  x += 1; 

  //
  //the enemy will "fall" (increase in the y) from the origin
  //
  enemyY += 1;


  //
  //when the heli reaches the end of the screen (plus a little) make another
  //
  if (x == 600)
  {
    newHeli();
  }

  //
  //when the helicopter reaches where the enemy will spawn run newEnemy
  //
  if ( x == enemySpawn)
  {
    newEnemy();
  }
  
  //
  //Make the ground, just a rectangle
  //
  fill(0);
  rect(0, 250, 500, 100);
}

//
//this is where the helicopter spawn points are
//
void newHeli()
{
  //
  //the x is set off the screen so that you will see it "fly" on to the screen.
  //
  x = -100;

  //
  ///random y position in between 0 and 50
  //
  y = random(0, 50); 

  //
  //Pick a random enemy spawn point(that corresponds with the heli)
  //
  enemySpawn = random(100, 300);
}

//
//this is what spawns the enemy once the helicopter is in the right place
//
void newEnemy()
{
  //
  //the enemy x will be the same as the helicopters x
  //
  enemyX = x;
  //
  //the enemy y will be the same as the heicopter when it spawns
  //
  enemyY = y;


}
