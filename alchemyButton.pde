class AlchemyButton
{
  int buttonToCaveColourBg;
  boolean buttonToCavePressed;
  float rectButtonX, rectButtonY;
  boolean isButtonPressed, buttonState;
  int buttonsBgColour = 255;
  int buttonX, buttonY, textSize, textX, textY;
  String buttonText;

  ArrayList <AlchemyButton> connections = new ArrayList <AlchemyButton> (5);

  public AlchemyButton(int bX, int bY, String str, int textS, int tX, int tY)
  {
    buttonX = bX;
    buttonY = bY;
    buttonText = str;
    textSize = textS;
    textX = tX;
    textY = tY;
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
        stroke(255,0,0);
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
    if (mouseX >= buttonX && mouseX <= buttonX + 200 && mouseY >= buttonY && mouseY <= buttonY+80)
    {
      if (mousePressed && !isButtonPressed) {
        isButtonPressed = true;
        buttonState = !buttonState;
        //buttonsBgColour = buttonState ? color(180) : color(255);
      } else if (!mousePressed) {
        isButtonPressed = false;
      }
    }
    

    strokeWeight(2);
    fill(buttonsBgColour);
    rect(buttonX, buttonY, 200, 80);
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
