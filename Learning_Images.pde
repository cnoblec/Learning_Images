PImage helicopterltr;
PImage helicopterrtl;
void setup()
{
  size(300, 300);
  helicopterrtl = loadImage("helicopter right to left.gif");
  helicopterltr = loadImage("helicopter left to right.gif");

}

void draw()
{
 image(helicopterrtl, 0, 0);
 image(helicopterltr, 0, 50);
}
