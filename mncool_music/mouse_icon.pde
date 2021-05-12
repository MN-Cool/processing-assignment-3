class MouseIcon
{
  MouseIcon()
  {
    img = loadImage("music.png");
  }
  
  MouseIcon(PImage img)
  {
    this.img = img;
  }
  
  PImage img;
  
  void render()
  {
    cursor(img);
  }
}
