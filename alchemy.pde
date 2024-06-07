class Alchemy
{
  int buttonToCaveColourBg;
  boolean buttonToCavePressed;
  
  
  
  public Alchemy()
  {
    buttonToCaveColourBg = 255;
    buttonToCavePressed = false;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  void buttonToCave()
  {
    int x = 1770;
    int y = height-160;
    int w = 100;
    int h = 100;
    fill(buttonToCaveColourBg);
    rect(x, y, w, h);
    
    if (mousePressed && mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y+h)
    {
      buttonToCaveColourBg = 180;
      buttonToCavePressed = true;
    }
    else if (!mousePressed && buttonToCavePressed)
    {
      buttonToCaveColourBg = 255;
      buttonToCavePressed = false;
      InterfaceAlchemyShowed = false;
      InterfaceCaveShowed = true;
    }
  }
  
  
  
  
  
  
}
