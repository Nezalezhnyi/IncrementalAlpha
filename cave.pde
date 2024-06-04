class Cave
{
  float caveBarX, caveBarY, caveBarW, caveBarH, caveCircleDiameter, caveFilled,
    caveButtonX, caveButtonY, caveButtonW, caveButtonH, increment;
  boolean caveButtonPressed, buttonCaveBg_Pressed, buttonHasBeenPressed;
  int buttonCaveColour = #CCE9FF;
  int buttonCaveColour_Pressed = #94D1FF;
  int buttonCavePurchaseLColour = #CCE9FF;
  int buttonCavePurchaseLColour_Pressed = #94D1FF;
  int buttonCavePurchaseRColour = #CCE9FF;
  int buttonCavePurchaseRColour_Pressed = #94D1FF;
  int buttonCavePurchaseDColour = #CCE9FF;
  int buttonCavePurchaseDColour_Pressed = #94D1FF;
  int seconds;
  int totalFrames;

  float originalX, originalY;
  float moveLX, moveLY, moveRX, moveRY, moveDX, moveDY;
  float velLX, velLY, velRX, velRY, velDX, velDY;
  int lastDirectionChange = 0; // Frame count when the last direction change occurred
  int directionChangeInterval = 120;
  float boundary = 50;
  boolean isMoving = false;
  int lineColour = 0;
  int strLinesW = 1;
  boolean textCostL, textCostR, textCostD;
  boolean firstHopePurchase;
  boolean pressedL, pressedR, pressedD;
  boolean zealHasBeenBought;


  int dreamChargesCost, hopeChargesCost, zealChargesCost;

  float randomCharge;
  int changerDream;
  int changerHope;
  int changerZeal;

  int dreamChargesCurrent;
  int hopeChargesCurrent;
  int zealChargesCurrent;
  int dreamDecreaseSeconds;
  int availablePercents;

  int dreamProbability;
  int hopeProbability;
  int zealProbability;

  String hopeCurrentNothing;
  int currentNothing;
  String hopeNewTextDecrease = "???";
  String openTheHopeMenu =  "Open the posibility menu";

  boolean buttonDreamMinusPressed, buttonDreamPlusPressed, buttonHopeMinusPressed, buttonHopePlusPressed, buttonZealMinusPressed, buttonZealPlusPressed;

  public Cave()
  {
    caveFilled = 0;
    originalX = originalY = 0;
    moveLX = moveLY = moveRX = moveRY = 0;
    moveLX = moveLY = moveRX = moveRY = moveDX = moveDY = 0;
    pressedL = pressedR = pressedD = false;

    dreamChargesCurrent = 45;  //45
    hopeChargesCurrent = 66; //66
    zealChargesCurrent = 30; //30

    dreamDecreaseSeconds = 0;
    seconds = 20;
    textCostL = textCostR = textCostD = true;
    firstHopePurchase = false;
    dreamChargesCost = 1;
    hopeChargesCost = 1;
    zealChargesCost = 30;
    currentNothing = 50;
    availablePercents = 0;
    dreamProbability = 20;
    hopeProbability = 20;
    zealProbability = 10;

    changerDream = changerHope = changerZeal = 0;

    buttonDreamMinusPressed = buttonDreamPlusPressed = buttonHopeMinusPressed = buttonHopePlusPressed = buttonZealMinusPressed = buttonZealPlusPressed = false;

    zealHasBeenBought = false;
  }



  void barCircle()
  {
    caveBarX = 50;
    caveBarY = (90+100+50);
    caveBarW = width-2*50;
    caveBarH = 70;
    caveCircleDiameter = 400;

    caveButtonX = width/2-300/2;
    caveButtonY = caveBarY+100;
    caveButtonW = 300;


    fill(180);
    rect(caveBarX, caveBarY, caveBarW, caveBarH); //the bar
    fill(0);
    textSize(25);
    fill(255);
    strokeWeight(2);
    circle(width/2, caveBarY+400, caveCircleDiameter); //the main circle

    strokeWeight(0);
    fill(#6699FF);
    circle(width/2, caveBarY+400, (caveFilled/caveBarW)*caveCircleDiameter); //the blue circle
    rect(caveBarX+1, caveBarY+0.5, caveFilled, caveBarH); //the blue rect
    fill(0);
    text(nf(caveFilled/caveBarW*100, 0, 2)+"%", caveBarX+caveBarW/2-30, caveBarY+caveBarH/2 +10);

    strokeWeight(1);
  }


  void mainButton()
  {

    totalFrames = seconds * 60;
    increment = caveBarW/totalFrames;
    if (InterfaceCaveShowed)
    {
      textSize(25);
      fill(buttonCaveColour);
      rect(caveButtonX, caveButtonY, caveButtonW, caveBarH, 15); //the main button
      fill(0);

      text("Start charging the sphere", caveButtonX + 10, caveButtonY+45);
      fill(buttonCaveColour);
    }
    if (mousePressed && !wasCaveMousePressed && mouseX >= caveButtonX && mouseX <= caveButtonX + caveButtonW && mouseY >= caveButtonY
      && mouseY <= caveButtonY + caveBarH && caveFilled/caveBarW <= 1 && InterfaceCaveShowed)
    {
      buttonCaveColour = #94D1FF;
      buttonHasBeenPressed = true;
    } else if (!mousePressed && wasCaveMousePressed && buttonHasBeenPressed)
    {
      buttonCaveColour = #CCE9FF;
      caveStartFilling = true;
    }
    if (caveStartFilling && caveFilled < caveBarW)
    {
      caveFilled += increment;
      lineColour = #6699FF;
      strLinesW = 4;
      if (caveFilled >= caveBarW-1)
      {
        caveFilled = 0;
        caveStartFilling = false;
        buttonHasBeenPressed = false;
        lineColour = 0;
        strLinesW = 1;
        randomCharge = int(random(20));

        if (randomCharge <= 3 + changerDream)
        {
          dreamChargesCurrent += 1;
        }
        if (randomCharge >= 4 + changerDream && randomCharge <= 7 + changerDream + changerHope)
        {
          hopeChargesCurrent += 1;
        }
        if (randomCharge >= 8 + changerDream + changerHope && randomCharge <= 9 + changerDream + changerHope + changerZeal)
        {
          zealChargesCurrent += 1;
        }
      }
    }

    wasCaveMousePressed = mousePressed;
  }

  void resourceButtons() {
    int w = 220;
    int LX = (width/2 - 200) - 600;
    int RX = (width/2 + 200) + 600 - w;
    int y = ((int)caveBarY+400)-40;
    int DX = width/2 - w/2;
    int DY = (((int)caveBarY+400) + 200) + 50;
    int h = 80;

    // Set original position once
    if (!isMoving) {
      isMoving = true;
      moveLX = moveLY = moveRX = moveRY = moveDX = moveDY = 0;
      float angleL = random(TWO_PI);
      float angleR = random(TWO_PI);
      float angleD = random(TWO_PI);
      velLX = cos(angleL);
      velLY = sin(angleL);
      velRX = cos(angleR);
      velRY = sin(angleR);
      velDX = cos(angleD);
      velDY = sin(angleD);
    }

    if (frameCount - lastDirectionChange > directionChangeInterval) {
      float angleL = random(TWO_PI);
      float angleR = random(TWO_PI);
      float angleD = random(TWO_PI);
      velLX = cos(angleL);
      velLY = sin(angleL);
      velRX = cos(angleR);
      velRY = sin(angleR);
      velDX = cos(angleD);
      velDY = sin(angleD);
      lastDirectionChange = frameCount;
    }
    float retarder = 0.2;
    moveLX += retarder *velLX;
    moveLY += retarder *velLY;
    moveRX += retarder *velRX;
    moveRY += retarder *velRY;
    moveDX += retarder *velDX;
    moveDY += retarder *velDY;

    if (abs(moveLX) > boundary || abs(moveLY) > boundary) {
      velLX *= -1;
      velLY *= -1;
      moveLX = constrain(moveLX, -boundary, boundary);
      moveLY = constrain(moveLY, -boundary, boundary);
    }
    if (abs(moveRX) > boundary || abs(moveRY) > boundary) {
      velRX *= -1;
      velRY *= -1;
      moveRX = constrain(moveRX, -boundary, boundary);
      moveRY = constrain(moveRY, -boundary, boundary);
    }

    if (abs(moveDX) > boundary+30 || abs(moveDY) > 40) {
      velDX *= -1;
      velDY *= -1;
      moveDX = constrain(moveDX, -(boundary+30), boundary+30);
      moveDY = constrain(moveDY, -40, 40);
    }
    /*println("moveDX: " + moveDX);
     println("moveDY: " + moveDY);
     println("---------");
     println("velDX: " + velDX);
     println("velDY: " + velDY);*/



    strokeWeight(2);
    stroke(lineColour);
    strokeWeight(strLinesW);
    //////////////////////////////////////////////////////////////////////////////////////
    if (mousePressed && mouseX >= LX+moveLX && mouseX <= LX+moveLX+w && mouseY >= y+moveLY && mouseY <= y+moveLY+h)
    {
      buttonCavePurchaseLColour = #94D1FF;
      pressedL = true;
    } else if (!mousePressed && pressedL)
    {
      if (dreamChargesCurrent >= dreamChargesCost && seconds >= 4)
      {
        dreamChargesCurrent -= dreamChargesCost;
        seconds -= 2;
        dreamChargesCost += 1;
      }
      buttonCavePurchaseLColour = #CCE9FF;
      pressedL = false;
    }


    if (mousePressed && mouseX >= RX+moveRX && mouseX <= RX+moveRX+w && mouseY >= y+moveRY && mouseY <= y+moveRY+h && currentNothing >= 5)
    {
      buttonCavePurchaseRColour = #94D1FF;
      pressedR = true;
    } else if (!mousePressed && pressedR)
    {
      if (hopeChargesCurrent >= hopeChargesCost && currentNothing >= 5)
      {
        firstHopePurchase = true;
        hopeChargesCurrent -= hopeChargesCost;
        hopeChargesCost += 1;
        openTheHopeMenu = "Decrease Nothing: -5%";
        if (firstHopePurchase)
        {
          currentNothing -= 5;
          availablePercents += 5;
        }
        hopeNewTextDecrease = "Current Nothing: " + currentNothing + "%";
      }
      buttonCavePurchaseRColour = #CCE9FF;
      pressedR = false;
    }
    
    

    if (mousePressed && mouseX >= DX+moveDX && mouseX <= DX+moveDX+w && mouseY >= DY+moveDY && mouseY <= DY+moveDY+h)
    {
      buttonCavePurchaseDColour = #94D1FF;
      pressedD = true;
    } else if (!mousePressed && pressedD)
    {
      if (zealChargesCurrent >= 30 && !zealHasBeenBought);
      {
        zealChargesCurrent -= 30;
        zealHasBeenBought = true;
      }
      buttonCavePurchaseDColour = #CCE9FF;
      pressedD = false;
    }


    if (seconds <= 2)
    {
      buttonCavePurchaseLColour = #FFA4F4;
      textCostL = false;
    }

    if (currentNothing <= 0)
    {
      buttonCavePurchaseRColour = #FFEEA4;
      textCostR = false;
    }

    if (zealHasBeenBought)
    {
      buttonCavePurchaseDColour = #D5FFE1;
      textCostD = false;
    }

    println(zealChargesCurrent >= 30 && !zealHasBeenBought);
    //////////////////////////////////////////////////////////////////////////////////////


    fill(buttonCavePurchaseLColour);
    rect(LX + moveLX, y + moveLY, w, h);

    fill(buttonCavePurchaseRColour);
    rect(RX + moveRX, y + moveRY, w, h);

    fill(buttonCavePurchaseDColour);
    rect(DX + moveDX, DY + moveDY, w, h);

    line(LX + moveLX + w, y + moveLY + h/2, width/2 - caveCircleDiameter/2, y + h/2);
    line(RX + moveRX, y + moveRY + h/2, width/2 + caveCircleDiameter/2, y + h/2);
    line(DX + moveDX+w/2, DY + moveDY, width/2, caveBarY+400+caveCircleDiameter/2);
    stroke(0);
    strokeWeight(1);


    //text, variables, hopes, dreams and other stuff <3
    fill(0);
    int xStabiliser = 10;
    int ystabiliser = 25;
    int yNextStabiliser = 23;
    textSize(17);
    text("Decrease durability: -2s", (int)(LX + moveLX) + xStabiliser, (int)(y + moveLY) + ystabiliser);
    text("Currently: " + seconds + " seconds", (int)(LX + moveLX) + xStabiliser, (int)(y + moveLY) + ystabiliser + yNextStabiliser);

    text(openTheHopeMenu, (int)(RX + moveRX) + xStabiliser, (int)(y + moveRY) + ystabiliser);
    text(hopeNewTextDecrease, (int)(RX + moveRX) + xStabiliser, (int)(y + moveRY) + ystabiliser + yNextStabiliser);

    text("Unlock Alchemy of Alpha", (int)(DX + moveDX) + xStabiliser, (int)(DY + moveDY) + yNextStabiliser);
    text("(Be careful)", (int)(DX + moveDX) + xStabiliser, (int)(DY + moveDY) + ystabiliser + yNextStabiliser);

    if (dreamChargesCurrent >= dreamChargesCost)
      fill(#228E38);
    else
      fill(#FF5B5B);
    if (textCostL)
      text("Cost: " + dreamChargesCost + " Dream Charges", (int)(LX + moveLX) + xStabiliser, (int)(y + moveLY) + ystabiliser + 2*yNextStabiliser);
    if (hopeChargesCurrent >= hopeChargesCost)
      fill(#228E38);
    else
      fill(#FF5B5B);
    if (textCostR)
      text("Cost: " + hopeChargesCost + " Hope Charges", (int)(RX + moveRX) + xStabiliser, (int)(y + moveRY) + ystabiliser + 2*yNextStabiliser);

    if (zealChargesCurrent >= zealChargesCost)
      fill(#228E38);
    else
      fill(#FF5B5B);
    if (textCostD)
    {
      text("Cost: " + zealChargesCost + " Zeal Charges", (int)(DX + moveDX) + xStabiliser, (int)(DY + moveDY) + ystabiliser + 2*yNextStabiliser);
    }

    int stabiliserDreamX = -35;
    int stabiliserHopeX = -33;
    int stabiliserZealX = -33;


    int stabiliserY = -20;
    textSize(25);
    fill(#FFA4F4);
    text("You have " + dreamChargesCurrent + " Dream Charges", (int)(LX + moveLX) + stabiliserDreamX, (int)(y + moveLY) + stabiliserY);
    fill(#FFEEA4);
    text("You have " + hopeChargesCurrent + " Hope Charges", (int)(RX + moveRX) + stabiliserHopeX, (int)(y + moveRY) + stabiliserY);
    fill(#D5FFE1);
    text("You have " + zealChargesCurrent + " Zeal Charges", (int)(DX + moveDX) + stabiliserZealX, (int)(DY + moveDY) + h + -stabiliserY+15);
  }























  void probabilityMenu()
  {

    if (firstHopePurchase)
    {
      int probabilityMenuX = (int)caveBarX;
      int probabilityMenuY = (int)caveBarY + (int)caveBarH + 20;
      int probabilityMenuW = 500;
      int probabilityMenuH = 180;
      int stabiliseY = 40;

      int butProbW = 30;
      int butProbX = probabilityMenuX + probabilityMenuW - butProbW - 10 - 180;
      int butProbY = probabilityMenuY + 40 - 25; //40
      int butProbH = butProbW;

      int dreamColourMinus = #FFDFFC;
      int dreamColourPlus = #FFDFFC;
      int hopeColourMinus = #FFFFA4;
      int hopeColourPlus = #FFFFA4;
      int zealColourMinus = #ACFFC5;
      int zealColourPlus = #ACFFC5;

      fill(70);
      rect(probabilityMenuX, probabilityMenuY, probabilityMenuW, probabilityMenuH);
      fill(255);
      ///////
      if (mousePressed && mouseX >= butProbX && mouseX <= butProbX + butProbW && mouseY >= butProbY && mouseY <= butProbY + butProbH)
      {
        dreamColourMinus = #FFC3F8;
        if (!buttonDreamMinusPressed)
          buttonDreamMinusPressed = true;
      } else if (!mousePressed && buttonDreamMinusPressed)
      {
        if (changerDream >= 1)
        {
          changerDream -= 1;
          availablePercents += 5;
        }
        buttonDreamMinusPressed = false;
      }

      if (mousePressed && mouseX >= (butProbX) + butProbW + 20 && mouseX <= (butProbX + butProbW)+butProbW + 20
        && mouseY >= butProbY && mouseY <= butProbY + butProbH)
      {
        dreamColourPlus= #FFC3F8;
        if (!buttonDreamPlusPressed)
          buttonDreamPlusPressed = true;
      } else if (!mousePressed && buttonDreamPlusPressed)
      {
        if (availablePercents >= 5)
        {
          changerDream += 1;
          availablePercents -= 5;
        }
        buttonDreamPlusPressed = false;
      } else
        dreamColourPlus = #FFDFFC;

      println(changerHope);
      //println(buttonDreamPlusPressed);
      //println(availablePercents >= 5);



      fill(#FFA4F4);
      text("Dream Charges: ", probabilityMenuX + 20, probabilityMenuY + 40); //40
      text(dreamProbability+changerDream*5 + "%", probabilityMenuX + 20 + textWidth("Dream Charges: "), probabilityMenuY + 40);

      fill(dreamColourMinus); //FFC3F8
      rect(butProbX, butProbY, butProbW, butProbH, 10); //dream minus

      fill(dreamColourPlus);
      rect(butProbX + butProbW + 20, butProbY, butProbW, butProbH, 10); //dream plus

      fill(#FF5B5B);
      textSize(40);
      text("-", butProbX + 9, butProbY + butProbH-3);
      fill(#228E38);
      text("+", (butProbX + butProbW + 20) + 4, butProbY + butProbH-1);
      textSize(25);


      if (mousePressed && mouseX >= butProbX && mouseX <= butProbX + butProbW && mouseY >= (butProbY) + stabiliseY && mouseY <= (butProbY + butProbH) + stabiliseY)
      {
        hopeColourMinus = #FFF66B;
        if (!buttonHopeMinusPressed)
          buttonHopeMinusPressed = true;
      } else if (!mousePressed && buttonHopeMinusPressed)
      {
        if (changerHope >= 1)
        {
          changerHope -= 1;
          availablePercents += 5;
        }
        buttonHopeMinusPressed = false;
      } else
        hopeColourMinus = #FFFFC0;

      if (mousePressed && mouseX >= (butProbX) + butProbW + 20 && mouseX <= (butProbX + butProbW)+butProbW + 20
        && mouseY >= (butProbY) + stabiliseY && mouseY <= (butProbY + butProbH) + stabiliseY)
      {
        hopeColourPlus = #FFF66B;
        if (!buttonHopePlusPressed)
          buttonHopePlusPressed = true;
      } else if (!mousePressed && buttonHopePlusPressed)
      {
        if (availablePercents >= 5)
        {
          changerHope += 1;
          availablePercents -= 5;
        }
        buttonHopePlusPressed = false;
      } else
        hopeColourPlus = #FFFFC0;


      fill(#FFEEA4);
      text("Hope Charges: ", probabilityMenuX + 20, probabilityMenuY + 40 + stabiliseY);
      text(hopeProbability+changerHope*5 + "%", probabilityMenuX + 20 + textWidth("Hope Charges: "), probabilityMenuY + 40 + stabiliseY);

      fill(hopeColourMinus); //FFFFA4
      rect(butProbX, butProbY + stabiliseY, butProbW, butProbH, 10);

      fill(hopeColourPlus);
      rect(butProbX + butProbW + 20, butProbY + stabiliseY, butProbW, butProbH, 10);

      fill(#FF5B5B);
      textSize(40);
      text("-", butProbX + 9, butProbY + stabiliseY + butProbH-3);
      fill(#228E38);
      text("+", (butProbX + butProbW + 20) + 4, butProbY + stabiliseY + butProbH-1);
      textSize(25);











      if (mousePressed && mouseX >= butProbX && mouseX <= butProbX + butProbW && mouseY >= (butProbY) + 2*stabiliseY && mouseY <= (butProbY + butProbH) + 2*stabiliseY)
      {
        zealColourMinus = #ACFFC5;
        if (!buttonZealMinusPressed)
          buttonZealMinusPressed = true;
      } else if (!mousePressed && buttonZealMinusPressed)
      {
        if (changerZeal >= 1)
        {
          changerZeal -= 1;
          availablePercents += 5;
        }
        buttonZealMinusPressed = false;
      } else
        zealColourMinus = #E5FFED;

      if (mousePressed && mouseX >= (butProbX) + butProbW + 20 && mouseX <= (butProbX + butProbW)+butProbW + 20
        && mouseY >= (butProbY) + 2*stabiliseY && mouseY <= (butProbY + butProbH) + 2*stabiliseY)
      {
        zealColourPlus = #ACFFC5;
        if (!buttonZealPlusPressed)
          buttonZealPlusPressed = true;
      } else if (!mousePressed && buttonZealPlusPressed)
      {
        if (availablePercents >= 5)
        {
          changerZeal += 1;
          availablePercents -= 5;
        }
        buttonZealPlusPressed = false;
      } else
        zealColourPlus = #E5FFED;



      fill(#D5FFE1);
      text("Zeal Charges: ", probabilityMenuX + 20, probabilityMenuY + 40 + 2*stabiliseY);
      text(zealProbability + changerZeal*5 + "%", probabilityMenuX + 20 + textWidth("Zeal Charges: "), probabilityMenuY + 40 + 2*stabiliseY);

      fill(zealColourMinus); //FFFFA4
      rect(butProbX, butProbY + 2*stabiliseY, butProbW, butProbH, 10);

      fill(zealColourPlus); //FFFFA4
      rect(butProbX + butProbW + 20, butProbY + 2*stabiliseY, butProbW, butProbH, 10);
      fill(#FF5B5B);
      textSize(40);
      text("-", butProbX + 9, butProbY + 2*stabiliseY + butProbH-3);
      fill(#228E38);
      text("+", (butProbX + butProbW + 20) + 4, butProbY + 2*stabiliseY + butProbH-1);
      textSize(25);

      fill(200);
      text("Available Probabilities: ", probabilityMenuX + 20, probabilityMenuY + 40 + 3*stabiliseY);
      text(availablePercents + "%", probabilityMenuX + 20 + textWidth("Available Probabilities: "), probabilityMenuY + 40 + 3*stabiliseY);


      ///////
    }
  }
}
