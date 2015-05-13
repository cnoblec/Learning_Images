PImage helicopter;
PImage StickManWithGun;
PImage StickManWithGun2;
float heliY = 0;
float heliX = 0;
float enemySpawn = 0;
float fallSpeed = 1;
float angle = 0;
float health = 1000;
float healthBar = 0;
float bulletX = 10000;
boolean bullet = false;
float a = 0;
float h = 0;
float x = 0;
float y = 0;
float k = 0;

//
//set the enemy spawn off of the screen
//
float enemyX = -100;
int enemyY = -1000;

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
  //name the enemy image "StickManWithGun"
  //
  StickManWithGun = loadImage("StickManWithGun.gif");
  StickManWithGun2 = loadImage("StickManWithGun2.gif");

  //
  //set up the variables for the parabola
  //
  a = 0.01;
  h = 400;
  x = 5000;
  y = 5000;
  k = 0;

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
  noStroke();

  //
  //make the helicopter image appear
  //
  image(helicopter, heliX, heliY);

  //
  //the enemy will be a box for testing purposes
  //
  //fill(0);
  //rect(enemyX, enemyY, 25, 25);

  //
  //Make the enemy that picture of a guy with a gun
  //
  if (enemyX >  width/2) 
  { 
    //image(StickManWithGun, enemyX, enemyY, 20, 30);
    image(StickManWithGun2, enemyX, enemyY, 20, 30);
  } 
  else
  {
    image(StickManWithGun, enemyX, enemyY, 20, 30);
  }


  //
  //update x position
  //
  heliX += 1;

  //
  //the enemy will "fall" (increase in the y) from the origin
  //
  enemyY += fallSpeed;
  //enemyY = enemyY*fallSpeed;

  if (enemyY == 220)
  {
    fallSpeed = 0;
    if (frameCount % 60 == 0)
    {
      if (bullet == false && enemyX > width/2)
      {
        bulletX = enemyX;
      }
      if (bullet == false && enemyX < width/2)
      {
        println("BANGARANG");
        bulletX = enemyX + 20;
      }
      bullet = true;
    }
  }
  if (bulletX >215 && bulletX <285 || bulletX == 0 || bulletX == 500 || enemyY != 220)
  {
    if (bullet == true)
    {
      bulletX = -100000;
      bullet = false;
      health -= 25;
    }
  }

  if (health < 0)
  {
    health = 0;
  }

  //
  //when the heli reaches the end of the screen (plus a little) make another
  //
  if (heliX == 600)
  {
    newHeli();
  }

  //
  //when the helicopter reaches where the enemy will spawn run newEnemy
  //
  //println("x is: " + heliX);
  //println("enemySpawn is: " + enemySpawn);
  //println("enemyY is: " + enemyY);
  if (heliX == enemySpawn)
  {
    newEnemy();
  }

  //
  //Make the ground, just a rectangle
  //
  fill(139);
  rect(0, 250, 500, 50);

  //
  //Create the circle on top of the turret base which the barrel will turn around
  //
  ellipse(250, 225, 35, 35);

  //
  //moves the origin point of canvas
  //
  pushMatrix();

  //
  //makes the new origin the center of the circle
  //
  translate(250, 225);
  rotate(angle);
  rect(-5, -15, 10, -17);
  popMatrix();

  //
  //left and right key presses increase or decrease the angle
  //  
  if (keyPressed) 
  {
    if (keyCode == LEFT) 
    {
      angle -= 0.03;
    }
    if (keyCode == RIGHT) 
    {
      angle += 0.03;
    }
  }

  //
  //stop the roatation when the angle is -1.2 and when it is 1.2
  //
  if (angle < -1)
  {
    angle = -1;
  }
  if (angle > 1)
  {
    angle = 1;
  }

  if (angle < 0)
  {
    y = a*pow(-1*(x-h), 2)+k;
    x = x - 1;
  }
  else 
  {
    y = a*pow((x-h), 2)+k;
    x = x + 1;
  }
  if (keyPressed)
  {
    x=250;
    y=220;
  }

  h = 250 + angle*100;
  k = 75 + angle*100;
  println("h is: " + h);
  a = (220-k)/pow(250-h, 2);

  //
  //make a bullet as a small circle
  //
  fill(0);
  ellipse(x, y, 10, 10);

  //
  //keep on picking random enemySpawns until it fits the criteria
  //
  if (enemySpawn >175 && enemySpawn <325)
  {
    enemySpawn = floor(random(50, 450));
    println("enemySpawn is: " + enemySpawn);
  }

  //
  //Create the turret base with rounded edges
  //
  fill(175);
  rect(215, 250, 70, -25, 7, 7, 0, 0);

  // if (enemyY == 220 && frameCount%60 == 0)
  // {
  //   health -= 5;
  // }
  //println("health: " + health);

  //
  //the healthBar is the health /100
  //
  healthBar = health/10;

  //
  //Make a small circle as a bullet when the guy lands on the ground
  //
  if (enemyX > width/2) 
  {
    bulletX -= 5;
  }
  if (enemyX < width/2 )
  {
    bulletX += 5;
  }
  fill(187, 79, 27);
  ellipse(bulletX, 230, 4, 2);
  //println("health is: " + health);
  //if ( enemyY == 220 && bulletX != enemyX)

  //
  //represent the health with a bar and text
  //

  if (health > 0)
  {
    fill(255);
  } 
  else
  {
    fill(360, 0, 0);
  }
  textSize(32);
  text("HP: ", 0, 287);
  rect(60, 260, healthBar, 32);
  stroke(0);
  noFill();
  rect(60, 260, 100, 32);
  noStroke();
}

//
//this is where the helicopter spawn points are
//
void newHeli()
{
  //
  //the x is set off the screen so that you will see it "fly" on to the screen.
  //
  heliX = -100;

  //
  ///random y position in between 0 and 50
  //
  heliY = floor(random(0, 50)); 

  //
  //Pick a random enemy spawn point(that corresponds with the heli)
  //
  enemySpawn = floor(random(50, 450));
}

//
//this is what spawns the enemy once the helicopter is in the right place
//
void newEnemy()
{
  //
  //the enemy x will be the same as the helicopters x
  //
  enemyX = heliX;

  //
  //the enemy y will be the same as the heicopter when it spawns
  //
  enemyY = floor(heliY);

  //
  //change fall speed from 0 to 1
  //
  fallSpeed = 1;
}
