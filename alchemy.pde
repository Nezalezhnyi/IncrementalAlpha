class Alchemy
{
  //I need 15 rects in total 0_0
  int buttonToCaveColourBg;
  boolean buttonToCavePressed;
  float rectButtonX, rectButtonY;
  boolean isButtonPressed;
  int buttonsBgColour;

  ArrayList <AlchemyButton> AlchemyButtonArray = new ArrayList <AlchemyButton> (15);

  public Alchemy()
  {


    buttonToCaveColourBg = 255;
    buttonToCavePressed = false;
    isButtonPressed = false;
    buttonsBgColour = 255;
  }

  public void add(AlchemyButton b)
  {
    AlchemyButtonArray.add(b);
  }

  public void addConnections()
  {
    //0 - dream, 1 - alpha, 2- beta, 3 - gamma, 4 - hope, 5 - zeal, 6 - autoA, 7 - AF,
    //8 - GF, 9 - autoB, 10 - BF, 11 - autoG, 12 - sing, 13 - sphere, 14 - delta
    AlchemyButton b;
    
    b = AlchemyButtonArray.get(6);
    b.addConnections(AlchemyButtonArray.get(0));
    b.addConnections(AlchemyButtonArray.get(1));
    
    b = AlchemyButtonArray.get(7); //-> alpha-fountain
    b.addConnections(AlchemyButtonArray.get(1)); //alpha ->
    b.addConnections(AlchemyButtonArray.get(4)); //hope ->
    
    b = AlchemyButtonArray.get(8);
    b.addConnections(AlchemyButtonArray.get(3));
    b.addConnections(AlchemyButtonArray.get(4));
    
    b = AlchemyButtonArray.get(9);
    b.addConnections(AlchemyButtonArray.get(0));
    b.addConnections(AlchemyButtonArray.get(2));
    
    b = AlchemyButtonArray.get(10);
    b.addConnections(AlchemyButtonArray.get(2));
    b.addConnections(AlchemyButtonArray.get(5));
    
    b = AlchemyButtonArray.get(11);
    b.addConnections(AlchemyButtonArray.get(3));
    b.addConnections(AlchemyButtonArray.get(5));
    
    b = AlchemyButtonArray.get(12);
    b.addConnections(AlchemyButtonArray.get(6));
    b.addConnections(AlchemyButtonArray.get(7));
    b.addConnections(AlchemyButtonArray.get(8));
    
    b = AlchemyButtonArray.get(13);
    b.addConnections(AlchemyButtonArray.get(9));
    b.addConnections(AlchemyButtonArray.get(10));
    b.addConnections(AlchemyButtonArray.get(11));
    
    b = AlchemyButtonArray.get(14);
    b.addConnections(AlchemyButtonArray.get(12));
    b.addConnections(AlchemyButtonArray.get(13));
    
    
    
  }

  public void show()
  {
    
    for (AlchemyButton b : AlchemyButtonArray)
      b.drawConnections();
    for (AlchemyButton b : AlchemyButtonArray)
      b.alchemyButtons();
  }



  void additionalText(String text, float x, float y)
  {
    fill(0);
    text(text, x, y);
    fill(255);
  }

  void buttonConnections(float x1, float y1, float x2, float y2)
  {
    strokeWeight(2);
    line(x1, y1, x2, y2);
    strokeWeight(1);
  }






















































  void buttonToCave()
  {
    int x = 1770;
    int y = height-160;
    int w = 100;
    int h = 100;
    fill(buttonToCaveColourBg);
    rect(x, y, w, h);
    fill(0);
    textSize(70);
    text("←", x+20, y+70);
    fill(255);

    if (mousePressed && mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y+h)
    {
      buttonToCaveColourBg = 180;
      buttonToCavePressed = true;
    } else if (!mousePressed && buttonToCavePressed)
    {
      buttonToCaveColourBg = 255;
      buttonToCavePressed = false;
      InterfaceAlchemyShowed = false;
      InterfaceCaveShowed = true;
    }
  }
}
