class MouseIcon
{
  MouseIcon()
  {
    miX = mouseX;
    miY = mouseY;
    
    img = LoadImage("");
  }
  
  MouseIcon(float miX, float miY)
  {
    this.miX = miX;
    this.miY = miY;
  }
  
  float miX;
  float miY;
  PImage img;
  
  void render()
  {
    cursor(img, miX, miY);
  }
}
