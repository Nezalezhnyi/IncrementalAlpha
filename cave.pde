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
  boolean textCostL, textCostR;
  boolean firstHopePurchase;


  int dreamChargesCost, hopeChargesCost, zealChargesCost;
  float randomCharge;

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

  public Cave()
  {
    caveFilled = 0;
    originalX = originalY = 0;
    moveLX = moveLY = moveRX = moveRY = 0;
    moveLX = moveLY = moveRX = moveRY = moveDX = moveDY = 0;

    dreamChargesCurrent = 50;
    hopeChargesCurrent = 50;
    zealChargesCurrent = 0;

    dreamDecreaseSeconds = 0;
    seconds = 20;
    textCostL = true;
    textCostR = true;
    firstHopePurchase = false;
    dreamChargesCost = 1;
    hopeChargesCost = 1;
    currentNothing = 50;
    availablePercents = 0;
    dreamProbability = 20;
    hopeProbability = 20;
    zealProbability = 10;
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
        randomCharge = int(random(10));

        if (randomCharge == 0 || randomCharge == 1)
        {
          dreamChargesCurrent += 1;
        }
        if (randomCharge == 2 || randomCharge == 3)
        {
          hopeChargesCurrent += 1;
        }
        if (randomCharge == 4)
        {
          zealChargesCurrent += 1;
        }
      }
    }

    wasCaveMousePressed = mousePressed;
    //println(increment);
    println(increment);
    println(seconds);
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
      if (dreamChargesCurrent >= dreamChargesCost && seconds >= 4)
      {
        dreamChargesCurrent -= 1;
        seconds -= 2;
        dreamChargesCost += 1;
      }
    } else
    {
      buttonCavePurchaseLColour = #CCE9FF;
    }
    if (mousePressed && mouseX >= RX+moveRX && mouseX <= RX+moveRX+w && mouseY >= y+moveRY && mouseY <= y+moveRY+h && hopeChargesCurrent >= hopeChargesCost)
    {
      buttonCavePurchaseRColour = #94D1FF;
      hopeChargesCurrent -= 1;
      hopeChargesCost += 1;
      openTheHopeMenu = "Decrease Nothing: -5%";
      if (firstHopePurchase && currentNothing >= 5)
      {
        currentNothing -= 5;
        availablePercents += 5;
      }
      hopeNewTextDecrease = "Current Nothing: " + currentNothing + "%";
      firstHopePurchase = true;
    } else
    {
      buttonCavePurchaseRColour = #CCE9FF;
    }
    if (mousePressed && mouseX >= DX+moveDX && mouseX <= DX+moveDX+w && mouseY >= DY+moveDY && mouseY <= DY+moveDY+h)
    {
      buttonCavePurchaseDColour = #94D1FF;
    } else
    {
      buttonCavePurchaseDColour = #CCE9FF;
    }

    if (seconds != 2)
      fill(buttonCavePurchaseLColour);
    else
    {
      fill(#FFA4F4);
      textCostL = false;
    }
    //////////////////////////////////////////////////////////////////////////////////////

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

    text("This button is gonna", (int)(DX + moveDX) + xStabiliser, (int)(DY + moveDY) + ystabiliser);
    text("do something significantly", (int)(DX + moveDX) + xStabiliser, (int)(DY + moveDY) + ystabiliser + yNextStabiliser);
    text("cool (idk what yet)", (int)(DX + moveDX) + xStabiliser, (int)(DY + moveDY) + ystabiliser + 2*yNextStabiliser);

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
    if (currentNothing > 0)
      text("Cost: " + hopeChargesCost + " Hope Charges", (int)(RX + moveRX) + xStabiliser, (int)(y + moveRY) + ystabiliser + 2*yNextStabiliser);


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
      fill(#FFA4F4);
      text("Dream Charges: ", probabilityMenuX + 20, probabilityMenuY + 40); //40
      text(dreamProbability + "%", probabilityMenuX + 20 + textWidth("Dream Charges: "), probabilityMenuY + 40);
      if (mousePressed && mouseX >= butProbX && mouseX <= butProbX + butProbW && mouseY >= butProbY && mouseY <= butProbY + butProbH)
        dreamColourMinus = #FFC3F8;
      else
        dreamColourMinus = #FFDFFC;
      fill(dreamColourMinus); //FFC3F8
      rect(butProbX, butProbY, butProbW, butProbH, 10); //dream minus
      if (mousePressed && mouseX >= (butProbX) + butProbW + 20 && mouseX <= (butProbX + butProbW)+butProbW + 20
        && mouseY >= butProbY && mouseY <= butProbY + butProbH)
        dreamColourPlus= #FFC3F8;
      else
        dreamColourPlus = #FFDFFC;
      fill(dreamColourPlus);
      rect(butProbX + butProbW + 20, butProbY, butProbW, butProbH, 10); //dream plus

      fill(#FF5B5B);
      textSize(40);
      text("-", butProbX + 9, butProbY + butProbH-3);
      fill(#228E38);
      text("+", (butProbX + butProbW + 20) + 4, butProbY + butProbH-1);
      textSize(25);


      fill(#FFEEA4);
      text("Hope Charges: ", probabilityMenuX + 20, probabilityMenuY + 40 + stabiliseY);
      text(hopeProbability + "%", probabilityMenuX + 20 + textWidth("Hope Charges: "), probabilityMenuY + 40 + stabiliseY);
      if (mousePressed && mouseX >= butProbX && mouseX <= butProbX + butProbW && mouseY >= (butProbY) + stabiliseY
        && mouseY <= (butProbY + butProbH) + stabiliseY)
        hopeColourMinus = #FFF66B;
      else
        hopeColourMinus = #FFFFC0;
      fill(hopeColourMinus); //FFFFA4
      rect(butProbX, butProbY + stabiliseY, butProbW, butProbH, 10);
      if (mousePressed && mouseX >= (butProbX) + butProbW + 20 && mouseX <= (butProbX + butProbW) + butProbW + 20
        && mouseY >= (butProbY) + stabiliseY && mouseY <= (butProbY + butProbH) + stabiliseY)
        hopeColourPlus = #FFF66B;
      else
        hopeColourPlus = #FFFFC0;
      fill(hopeColourPlus);
      rect(butProbX + butProbW + 20, butProbY + stabiliseY, butProbW, butProbH, 10);

      fill(#FF5B5B);
      textSize(40);
      text("-", butProbX + 9, butProbY + stabiliseY + butProbH-3);
      fill(#228E38);
      text("+", (butProbX + butProbW + 20) + 4, butProbY + stabiliseY + butProbH-1);
      textSize(25);


      fill(#D5FFE1);
      text("Zeal Charges: ", probabilityMenuX + 20, probabilityMenuY + 40 + 2*stabiliseY);
      text(zealProbability + "%", probabilityMenuX + 20 + textWidth("Zeal Charges: "), probabilityMenuY + 40 + 2*stabiliseY);
      if (mousePressed && mouseX >= butProbX && mouseX <= butProbX + butProbW && mouseY >= (butProbY) + 2*stabiliseY
        && mouseY <= (butProbY + butProbH) + 2*stabiliseY)
        zealColourMinus = #ACFFC5;
      else
        zealColourMinus = #E5FFED;
      fill(zealColourMinus); //FFFFA4
      rect(butProbX, butProbY + 2*stabiliseY, butProbW, butProbH, 10);
      if (mousePressed && mouseX >= (butProbX) + butProbW + 20  && mouseX <= (butProbX + butProbW) + butProbW + 20
        && mouseY >= (butProbY) + 2*stabiliseY && mouseY <= (butProbY + butProbH) + 2*stabiliseY)
        zealColourPlus = #ACFFC5;
      else
        zealColourPlus = #E5FFED;
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
