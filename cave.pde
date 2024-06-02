class Cave
{
  float caveBarX, caveBarY, caveBarW, caveBarH, caveCircleDiameter, caveFilled,
    caveButtonX, caveButtonY, caveButtonW, caveButtonH, increment;
  boolean caveButtonPressed, buttonCaveBg_Pressed, buttonHasBeenPressed;
  int buttonCaveColour = #CCE9FF;
  int buttonCaveColour_Pressed = #94D1FF;
  int seconds = 20;
  int totalFrames = seconds * 60;

  float originalX, originalY;  // Original center position of the rectangle
  float moveLX, moveLY, moveRX, moveRY;          // Current movement offsets
  float velLX, velLY, velRX, velRY;            // Velocities in x and y directions             // Constant speed for movement
  int lastDirectionChange = 0; // Frame count when the last direction change occurred
  int directionChangeInterval = 120; // Change direction every 120 frames
  float boundary = 50;         // Movement boundary
  boolean isMoving = false;    // Movement flag


  public Cave()
  {
    caveFilled = 0;
    originalX = originalY = 0;
    moveLX = moveLY = moveRX = moveRY = 0;
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

    increment = caveBarW/totalFrames;

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
    fill(buttonCaveColour);
    rect(caveButtonX, caveButtonY, caveButtonW, caveBarH, 15); //the main button
    if (mousePressed && !wasCaveMousePressed && mouseX >= caveButtonX && mouseX <= caveButtonX + caveButtonW && mouseY >= caveButtonY
      && mouseY <= caveButtonY + caveBarH && caveFilled/caveBarW <= 1 && caveFilled <= caveBarW)
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
      if (caveFilled >= caveBarW-1)
      {
        caveFilled = 0;
        caveStartFilling = false;
      }
    }

    wasCaveMousePressed = mousePressed;
    //println(increment);
  }

  void resourseButtons() {
    int w = 200;
    int LX = (width/2 - 200) - 600;
    int RX = (width/2 + 200) + 600 - w;
    int y = ((int)caveBarY+400)-40;
    int h = 80;

    // Set original position once
    if (!isMoving) {
      isMoving = true;
      moveLX = moveLY = moveRX = moveRY = 0;
      float angleL = random(TWO_PI);
      float angleR = random(TWO_PI);
      velLX = cos(angleL);
      velLY = sin(angleL);
      velRX = cos(angleR);
      velRY = sin(angleR);
    }

    // Check if it's time to change direction
    if (frameCount - lastDirectionChange > directionChangeInterval) {
      // Random angle
      float angleL = random(TWO_PI);
      float angleR = random(TWO_PI);
      velLX = cos(angleL);
      velLY = sin(angleL);
      velRX = cos(angleR);
      velRY = sin(angleR);
      lastDirectionChange = frameCount;
    }
    float retarder = 0.2;
    moveLX += retarder *velLX;
    moveLY += retarder *velLY;
    moveRX += retarder *velRX;
    moveRY += retarder *velRY;

    // Boundary checks to reverse direction if necessary
    if (abs(moveLX) > boundary || abs(moveLY) > boundary) {
      velLX *= -1;
      velLY *= -1;
      moveLX = constrain(moveLX, -boundary, boundary);
      moveLY = constrain(moveLY, -boundary, boundary);
    }
    if (abs(moveRX) > boundary || abs(moveRY) > boundary) {
      velRX *= -1;
      velLY *= -1;
      moveRX = constrain(moveRX, -boundary, boundary);
      moveRY = constrain(moveRY, -boundary, boundary);
    }

    // Draw the rectangle at the new position
    strokeWeight(2);
    rect(LX + moveLX, y + moveLY, w, h);
    line(LX + moveLX + w, y + moveLY + h/2, width/2 - caveCircleDiameter/2, y + h/2);
    rect(RX + moveRX, y + moveRY, w, h);
    line(RX + moveRX, y + moveRY + h/2, width/2 + caveCircleDiameter/2, y + h/2);
  }
}
