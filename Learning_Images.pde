PImage helicopterltr;
PImage helicopterrtl;
int xltr = 0;
int xrtl = 300;
float y = 0;
int x = 0;
void setup()
{
  size(300, 300);
  helicopterrtl = loadImage("helicopter right to left.gif");
  helicopterltr = loadImage("helicopter left to right.gif");
  newHeliLeft();

}

void draw()
{
 background(233);
 image(helicopterltr, x, y);
 //image(helicopterltr, xltr, y);
 
 x = x + 1; //update x poistion
 
}

void newHeliLeft()
{
 x = 0; //horizontal poistion
 y = random(0, 50); //random y position in between 0 and 50
  
}
