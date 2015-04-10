PImage helicopterltr;
PImage helicopterrtl;
float y = 0;
int x = 0;
float enemy = 0;
void setup()
{
  size(300, 300);
  helicopterltr = loadImage("helicopter left to right.gif");
  newHeli();
}

void draw()
{
 background(233);
 image(helicopterltr, x, y);
 x += 1; //update xltr position
 if (x == 350)
 {
   newHeli();
 }
 enemy = random(100, 200);
 if ( x == enemy)
 {
  newEnemy(); 
 }
 
}

void newHeli()
{
 x = -100; //horizontal poistion
 y = random(0, 50); //random y position in between 0 and 50
}

void newEnemy()
{
  
}
