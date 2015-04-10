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
  size(300, 300);
  
  //
  //saying that helicopter is the name of the file
  //
  helicopter = loadImage("helicopter left to right.gif");
  
  //
  //make a new helicopter
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
  //update x position
  //
  x += 1; 
  
  //
  //when the heli reaches the end of the screen (plus a little) make another
  //
  if (x == 350)
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
}

//
//
//
void newHeli()
{
  x = -100;
  
  //
  ///random y position in between 0 and 50
  //
  y = random(0, 50); 
  
  //
  //Pick an enemy spawn point(that corresponds with the heli)
  //
  enemySpawn = random(100, 200); //random spawn for the enemy
}

void newEnemy()
{
  enemyX = x;
  enemyY = y;
}
