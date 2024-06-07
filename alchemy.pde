class Alchemy
{
  //I need 15 rects in total 0_0
  int buttonToCaveColourBg;
  boolean buttonToCavePressed;
  float rectButtonX, rectButtonY;
  
  
  public Alchemy()
  {
    
    
    buttonToCaveColourBg = 255;
    buttonToCavePressed = false;
  }
  
  void alchemyButtons(float bx, float by, String text, int tSize, int tx, int ty)
  {
    rect(bx, by, 200, 80);
    textSize(tSize);
    fill(0);
    text(text, tx, ty);
    fill(255);
  }
  
  
  void additionalText(String text, float x, float y)
  {
    fill(0);
    text(text, x, y);
    fill(255);
  }
  
  void buttonConnections(float x1, float y1, float x2, float y2)
  {
    line(x1, y1, x2, y2);
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
