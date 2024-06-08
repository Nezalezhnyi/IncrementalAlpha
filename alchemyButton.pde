class AlchemyButton
{
  int buttonToCaveColourBg;
  float resource;
  boolean buttonToCavePressed;
  float rectButtonX, rectButtonY;
  boolean isButtonPressed, buttonState;
  int buttonsBgColour = 255;
  int buttonX, buttonY, textSize, textX, textY;
  String buttonText;
  int mechanic, colourFilled;
  float filled;
  int strButtons;
  int strokeColour;

  ArrayList <AlchemyButton> connections = new ArrayList <AlchemyButton> (5);

  public AlchemyButton(int bX, int bY, String str, int textS, int tX, int tY, int mech, int clr)
  {

    buttonX = bX;
    buttonY = bY;
    buttonText = str;
    textSize = textS;
    textX = tX;
    textY = tY;
    mechanic = mech;
    colourFilled = clr;

    filled = 0;
    strButtons = 2;
    strokeColour = 0;
  }

  void addConnections(AlchemyButton b)
  {
    connections.add(b);
  }

  void drawConnections()
  {
    if (InterfaceAlchemyShowed)
    {
      for (AlchemyButton b : connections)
      {
        if (buttonState)
          stroke(255, 0, 0);
        else
          stroke(0);

        strokeWeight(2);
        line(buttonX+100, buttonY+40, b.buttonX+100, b.buttonY+40);
        strokeWeight(1);
        stroke(0);
      }
    }
  }

  void alchemyButtons()
  {

    float alphaClots = r1.getResourceClots();
    float betaClots = r2.getResourceClots();
    float gammaClots = r3.getResourceClots();
    float dreams = c1.getDreams();
    float hopes = c1.getHopes();
    float zeals = c1.getZeals();
    fill(colourFilled);

    //0 - dream, 1 - alpha, 2- beta, 3 - gamma, 4 - hope, 5 - zeal, 6 - autoA, 7 - AF,
    //8 - GF, 9 - autoB, 10 - BF, 11 - autoG, 12 - sing, 13 - sphere, 14 - delta
    if (InterfaceAlchemyShowed && mouseX >= buttonX && mouseX <= buttonX + 200 && mouseY >= buttonY && mouseY <= buttonY+80)
    {
      if (mousePressed && !isButtonPressed)
      {
        isButtonPressed = true;

        //buttonsBgColour = buttonState ? color(180) : color(255);
      } else if (!mousePressed && isButtonPressed && InterfaceAlchemyShowed)
      {
        buttonState = !buttonState;
        isButtonPressed = false;
        strokeColour = 0;
      }
    }
    if (buttonState && filled <= 200-2*strButtons)
    {
      switch(mechanic)
      {
      case 0:
        {
          strokeColour = #FF3030;
          if (dreams > 0)
          {
            c1.setDreams((int)dreams - 1);
            filled += 1;
          }
        }
        break;
      case 1:
        {
          strokeColour = #FF3030;
          if (alphaClots >1)
          {
            r1.setResourceClots(alphaClots - 1);
            filled += 1;
          }
        }
        break;
      case 2:
        {
          strokeColour = #FF3030;
          if (betaClots > 1)
          {
            r2.setResourceClots(betaClots - 1);
            filled += 1;
          }
        }
        break;
      case 3:
        {
          strokeColour = #FF3030;
          if (gammaClots > 1)
          {
            r3.setResourceClots(gammaClots - 1);
            filled += 1;
          }
        }
        break;
      case 4:
        {
          strokeColour = #FF3030;
          if (hopes > 1)
          {
            c1.setHopes((int)hopes - 1);
            filled += 1;
          }
        }
        break;
        case 5:
        {
          strokeColour = #FF3030;
          if (zeals > 1)
          {
            c1.setZeals((int)zeals - 1);
            filled += 1;
          }
        }
        break;
      }



      //resource.addClots(-(int)resource.getClots());
    }
    //println("4343",resource.getClots());

    if (InterfaceAlchemyShowed)
    {
      strokeWeight(strButtons);
      fill(buttonsBgColour);
      stroke(strokeColour);
      rect(buttonX, buttonY, 200, 80);
      fill(colourFilled);
      strokeWeight(0);
      rect(buttonX+strButtons, buttonY+strButtons, filled, 80-strButtons-1);
      textSize(textSize);
      fill(0);
      text(buttonText, textX, textY);
      fill(255);
      strokeWeight(1);
    }
  }
}
