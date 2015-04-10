PImage helicopterltr;
PImage helicopterrtl;
int xltr = 0;
int xrtl = 300;
void setup()
{
  size(300, 300);
  helicopterrtl = loadImage("helicopter right to left.gif");
  helicopterltr = loadImage("helicopter left to right.gif");

}

void draw()
{
 background(233);
 image(helicopterrtl, xrtl, random(50));
 image(helicopterltr, xltr, random(50));
 
 xltr += 1;
 xrtl -= 1;
}
