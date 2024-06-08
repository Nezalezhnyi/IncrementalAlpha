class AlchemyButton
{
  Alchemy parentAlchemy;
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
  long[] lastUpdateTimes;
  int updateInterval = 1000;



  ArrayList <AlchemyButton> connections = new ArrayList <AlchemyButton> (5);

  public AlchemyButton(Alchemy parent, int bX, int bY, String str, int textS, int tX, int tY, int mech, int clr)
  {
    this.parentAlchemy = parent;
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
    this.lastUpdateTimes = new long[15];
    Arrays.fill(this.lastUpdateTimes, System.currentTimeMillis());
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
    if (buttonState && filled < 50)
    {
      switch(mechanic)
      {
      case 0:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[0] >= updateInterval)
          {
            if (dreams > 0 && filled < 50)
            {
              c1.setDreams((int)(dreams - 1));
              filled += 1;
            }
            this.lastUpdateTimes[0] = System.currentTimeMillis();
          }
        }
        break;
      case 1:
        {
          if (System.currentTimeMillis() - this.lastUpdateTimes[1] >= updateInterval)
          {
            if (alphaClots > 1 && filled < 50)
            {
              r1.setResourceClots(alphaClots - 1);
              filled += 1;
            }
            this.lastUpdateTimes[1] = System.currentTimeMillis();
          }
          strokeColour = #FF3030;
        }
        break;
      case 2:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[2] >= updateInterval)
          {
            if (betaClots > 1 && filled < 50)
            {
              r2.setResourceClots(betaClots - 1);
              filled += 1;
            }
            this.lastUpdateTimes[2] = System.currentTimeMillis();
          }
        }
        break;
      case 3:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[3] >= updateInterval)
          {
            if (gammaClots > 1 && filled < 50)
            {
              r3.setResourceClots(gammaClots - 1);
              filled += 1;
            }
            this.lastUpdateTimes[3] = System.currentTimeMillis();
          }
        }
        break;
      case 4:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[4] >= updateInterval)
          {
            if (hopes > 0 && filled < 50)
            {
              c1.setHopes((int)hopes - 1);
              filled += 1;
            }
            this.lastUpdateTimes[4] = System.currentTimeMillis();
          }
        }
        break;
      case 5:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[5] >= updateInterval)
          {
            if (zeals > 0 && filled < 50)
            {
              c1.setZeals((int)zeals - 1);
              filled += 1;
            }
            this.lastUpdateTimes[5] = System.currentTimeMillis();
          }
        }
        break;
      case 6:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[6] >= updateInterval)
          {
            AlchemyButton pbutton1 = parentAlchemy.AlchemyButtonArray.get(0);
            AlchemyButton pbutton2 = parentAlchemy.AlchemyButtonArray.get(1);
            AlchemyButton button = parentAlchemy.AlchemyButtonArray.get(6);
            if (pbutton1.filled > 0 && pbutton2.filled > 0 && button.filled < 50) {
              pbutton1.filled -= 1;
              pbutton2.filled -= 1;
              button.filled += 1;
            }
            this.lastUpdateTimes[6] = System.currentTimeMillis();
          }
        }
        break;
      case 7:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[7] >= updateInterval)
          {
            AlchemyButton pbutton1 = parentAlchemy.AlchemyButtonArray.get(1);
            AlchemyButton pbutton2 = parentAlchemy.AlchemyButtonArray.get(4);
            AlchemyButton button = parentAlchemy.AlchemyButtonArray.get(7);
            if (pbutton1.filled > 0 && pbutton2.filled > 0 && button.filled < 50) {
              pbutton1.filled -= 1;
              pbutton2.filled -= 1;
              button.filled += 1;
            }
            this.lastUpdateTimes[7] = System.currentTimeMillis();
          }
        }
        break;
      case 8:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[8] >= updateInterval)
          {
            AlchemyButton pbutton1 = parentAlchemy.AlchemyButtonArray.get(3);
            AlchemyButton pbutton2 = parentAlchemy.AlchemyButtonArray.get(4);
            AlchemyButton button = parentAlchemy.AlchemyButtonArray.get(8);
            if (pbutton1.filled > 0 && pbutton2.filled > 0 && button.filled < 50) {
              pbutton1.filled -= 1;
              pbutton2.filled -= 1;
              button.filled += 1;
            }
            this.lastUpdateTimes[8] = System.currentTimeMillis();
          }
        }
        break;
      case 9:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[9] >= updateInterval)
          {
            AlchemyButton pbutton1 = parentAlchemy.AlchemyButtonArray.get(0);
            AlchemyButton pbutton2 = parentAlchemy.AlchemyButtonArray.get(2);
            AlchemyButton button = parentAlchemy.AlchemyButtonArray.get(9);
            if (pbutton1.filled > 0 && pbutton2.filled > 0 && button.filled < 50) {
              pbutton1.filled -= 1;
              pbutton2.filled -= 1;
              button.filled += 1;
            }
            this.lastUpdateTimes[9] = System.currentTimeMillis();
          }
        }
        break;
        case 10:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[10] >= updateInterval)
          {
            AlchemyButton pbutton1 = parentAlchemy.AlchemyButtonArray.get(2);
            AlchemyButton pbutton2 = parentAlchemy.AlchemyButtonArray.get(5);
            AlchemyButton button = parentAlchemy.AlchemyButtonArray.get(10);
            if (pbutton1.filled > 0 && pbutton2.filled > 0 && button.filled < 50) {
              pbutton1.filled -= 1;
              pbutton2.filled -= 1;
              button.filled += 1;
            }
            this.lastUpdateTimes[10] = System.currentTimeMillis();
          }
        }
        break;
        case 11:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[11] >= updateInterval)
          {
            AlchemyButton pbutton1 = parentAlchemy.AlchemyButtonArray.get(3);
            AlchemyButton pbutton2 = parentAlchemy.AlchemyButtonArray.get(5);
            AlchemyButton button = parentAlchemy.AlchemyButtonArray.get(11);
            if (pbutton1.filled > 0 && pbutton2.filled > 0 && button.filled < 50) {
              pbutton1.filled -= 1;
              pbutton2.filled -= 1;
              button.filled += 1;
            }
            this.lastUpdateTimes[11] = System.currentTimeMillis();
          }
        }
        break;
        case 12:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[12] >= updateInterval)
          {
            AlchemyButton pbutton1 = parentAlchemy.AlchemyButtonArray.get(6);
            AlchemyButton pbutton2 = parentAlchemy.AlchemyButtonArray.get(7);
            AlchemyButton pbutton3 = parentAlchemy.AlchemyButtonArray.get(8);
            AlchemyButton button = parentAlchemy.AlchemyButtonArray.get(12);
            if (pbutton1.filled > 0 && pbutton2.filled > 0 && pbutton3.filled > 0 && button.filled < 50) {
              pbutton1.filled -= 1;
              pbutton2.filled -= 1;
              pbutton3.filled -= 1;
              button.filled += 1;
            }
            this.lastUpdateTimes[12] = System.currentTimeMillis();
          }
        }
        break;
        case 13:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[13] >= updateInterval)
          {
            AlchemyButton pbutton1 = parentAlchemy.AlchemyButtonArray.get(9);
            AlchemyButton pbutton2 = parentAlchemy.AlchemyButtonArray.get(10);
            AlchemyButton pbutton3 = parentAlchemy.AlchemyButtonArray.get(11);
            AlchemyButton button = parentAlchemy.AlchemyButtonArray.get(13);
            if (pbutton1.filled > 0 && pbutton2.filled > 0 && pbutton3.filled > 0 && button.filled < 50) {
              pbutton1.filled -= 1;
              pbutton2.filled -= 1;
              pbutton3.filled -= 1;
              button.filled += 1;
            }
            this.lastUpdateTimes[13] = System.currentTimeMillis();
          }
        }
        break;
        case 14:
        {
          strokeColour = #FF3030;
          if (System.currentTimeMillis() - this.lastUpdateTimes[14] >= updateInterval)
          {
            AlchemyButton pbutton1 = parentAlchemy.AlchemyButtonArray.get(12);
            AlchemyButton pbutton2 = parentAlchemy.AlchemyButtonArray.get(13);
            AlchemyButton button = parentAlchemy.AlchemyButtonArray.get(14);
            if (pbutton1.filled > 0 && pbutton2.filled > 0 && button.filled < 50) {
              pbutton1.filled -= 1;
              pbutton2.filled -= 1;
              button.filled += 1;
            }
            this.lastUpdateTimes[14] = System.currentTimeMillis();
          }
          stroke(0);
        }
        break;
        


        //0 - dream, 1 - alpha, 2- beta, 3 - gamma, 4 - hope, 5 - zeal, 6 - autoA, 7 - AF,
        //8 - GF, 9 - autoB, 10 - BF, 11 - autoG, 12 - sing, 13 - sphere, 14 - delta
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
      rect(buttonX+strButtons, buttonY+strButtons, filled/51 * 200, 80-strButtons-1);
      textSize(17);
      fill(0);
      text((int)filled + "/50", buttonX + 78, buttonY + 73);
      textSize(textSize);
      fill(0);
      text(buttonText, textX, textY);
      fill(255);
      strokeWeight(1);
    }
  }
}
