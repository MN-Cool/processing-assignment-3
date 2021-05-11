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
    noCursor();
    stroke(255, 255, 255);
    noFill();
    ellipse(5, 5, miX, miY);
  }
}
