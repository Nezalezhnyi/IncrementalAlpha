class AlchemyButton
{
  int buttonToCaveColourBg;
  boolean buttonToCavePressed;
  float rectButtonX, rectButtonY;
  boolean isButtonPressed, buttonState;
  int buttonsBgColour = 255;
  int buttonX, buttonY, textSize, textX, textY;
  String buttonText;
  int mechanic, colourFilled;
  float filled;
  int strButtons;

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
  }

  void addConnections(AlchemyButton b)
  {
    connections.add(b);
  }

  void drawConnections()
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

  void alchemyButtons()
  {
    fill(colourFilled);

    //0 - dream, 1 - alpha, 2- beta, 3 - gamma, 4 - hope, 5 - zeal, 6 - autoA, 7 - AF,
    //8 - GF, 9 - autoB, 10 - BF, 11 - autoG, 12 - sing, 13 - sphere, 14 - delta
    if (mouseX >= buttonX && mouseX <= buttonX + 200 && mouseY >= buttonY && mouseY <= buttonY+80)
    {
      if (mousePressed && !isButtonPressed)
      {
        isButtonPressed = true;

        //buttonsBgColour = buttonState ? color(180) : color(255);
      } else if (!mousePressed && isButtonPressed)
      {
        buttonState = !buttonState;
        isButtonPressed = false;
      }
    }
    if (buttonState && filled <= 200-2*strButtons)
      filled += 1;

    strokeWeight(strButtons);
    fill(buttonsBgColour);
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

  void buttonConnections(float x1, float y1, float x2, float y2)
  {
    strokeWeight(2);
    line(x1, y1, x2, y2);
    strokeWeight(1);
  }
}
