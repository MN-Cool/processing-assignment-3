class MouseIcon
{
  MouseIcon()
  {
    miX = mouseX;
    miY = mouseY;
  }
  
  MouseIcon(float miX, float miY)
  {
    this.miX = miX;
    this.miY = miY;
  }
  
  float miX;
  float miY;
  
  void render()
  {
    cursor(HAND);
  }
  
  void mouseClicked()
  {
    
  }
}
