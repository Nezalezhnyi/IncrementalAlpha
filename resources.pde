class Resources
{
  int youHaveResourceX, resourceColour, bgColour;
  float resource, maxResource, resourceParticlesPerSecond, lastResourceCount;
  double thresholdUpgrades, pthresholdUpgrades;
  String resourceName;
  boolean resourcePressed;
  float resourceClots;
  int alphaChanger, betaChanger;
  int typeResource, mechanic;
  float threshold;
  float betaClots;

  public Resources(float r, int tr, String rn, int textX, int colour, boolean pressed, int clots, int bgCol, int mech)
  {
    resource = r;
    typeResource = tr;
    resourceName = rn;
    youHaveResourceX = textX;
    resourceColour = colour;
    resourcePressed = pressed;
    resourceClots = clots;
    bgColour = bgCol;
    mechanic = mech;

    pthresholdUpgrades = thresholdUpgrades;
    maxResource = 2;
    resourceParticlesPerSecond = 0;
    lastResourceCount = 0;
    bgColour = 255;
    maxResource = 2;
    threshold = 0;
  }

  void addResource(float r)
  {
    resource += r;
  }

  float getResource()
  {
    return resource;
  }






  void currentAlphaParticles(float betaClots)
  {
    println(betaClots);
    if (achievedBeta1)
      resource += (betaClots/10+1) * alphaIncreaser1*(resourceClots/100);
    else
      resource += alphaIncreaser1*(resourceClots/100);

    if (resource > maxResource) //variable maxalphas will contain the greatest value of alphas which has been reached during a simulation
      maxResource = resource;   //in order to save the value of the next threshold of alpha particles we will be able to buy next factory with
  }

  void currentBetaParticles()
  {
    resource += (resourceClots)/60;

    if (resource > maxResource) //variable maxalphas will contain the greatest value of alphas which has been reached during a simulation
      maxResource = resource;   //in order to save the value of the next threshold of alpha particles we will be able to buy next factory with
  }


  void formatAlphaParticlesText()
  {
    int stabiliser = 0;
    if (achieved4)
    {
      switch(typeResource)
      {
      case 0:
        stabiliser = -530;
        break;
      case 1:
        stabiliser = -30;
        break;
      }
    }
    int exponent;
    if (resource != 0)
    {
      exponent = (int)Math.log10(resource);
    } else
    {
      exponent = 0;
    }

    if (resource <= 100000)
    {

      fill(0);
      textSize(70);
      text("You have ", youHaveResourceX + stabiliser, 90);
      fill(resourceColour);
      text((int)resource, youHaveResourceX + stabiliser + textWidth("You have "), 90);
      fill(0);
      text(" " + resourceName + "-particles", youHaveResourceX + stabiliser + textWidth("You have ") + textWidth(str((int)resource)), 90);
    } else
    {
      fill(0);
      textSize(70);
      float mantissa = resource / pow(10, exponent);
      text("You have ", youHaveResourceX + stabiliser, 90);
      fill(resourceColour);
      text(nf(mantissa, 0, 1) + "e" + exponent, youHaveResourceX + stabiliser + textWidth("You have "), 90);
      fill(0);
      text(" " + resourceName + "-particles", youHaveResourceX + stabiliser + textWidth("You have ") + textWidth(nf(mantissa, 0, 1) + "e" + exponent), 90);
    }
  }



  void alphaParticlesProductionSpeed()
  {
    int stabiliser = 0;
    if (achieved4)
    {
      switch(typeResource)
      {
      case 0:
        stabiliser = -470;
        break;
      case 1:
        stabiliser = 0;
        break;
      }
    }
    float deltaAlphas = resource - lastResourceCount;
    resourceParticlesPerSecond = deltaAlphas * 60;
    textSize(30);
    fill(30);
    text("You are gaining " + nf(resourceParticlesPerSecond, 0, 1) + " " + resourceName + "-particles per second", youHaveResourceX+30+textWidth(str((int)resource)) + stabiliser, 145);
    lastResourceCount = resource;
  }


  void currencyType (int textbuttonX, int rectY)
  {
    ///////THE RED-GREEN TEXT
    textSize(20);
    float distClots = textWidth("You have ") + textWidth(nf(resourceClots, 0, 0)) + textWidth(" clots of " + resourceName + "-energy");
    float distTime = textWidth("Make a clot of " + resourceName + "-energy with ") + textWidth(str(round(threshold))) + textWidth(" " + resourceName + "-particles");
    int stabiliserClots = 240;
    int stabiliserTime = 20;
    if (resource < threshold)
    {
      strokeWeight(3);
      stroke(#FF5B5B);
      fill(#FF5B5B);
      text("Make a clot of " + resourceName + "-energy with " + round(threshold) + " " + resourceName + "-particles", distClots+stabiliserClots, 250+33 + (rectY-250) );
    } else
    {
      strokeWeight(3);
      stroke(#3CFF63);
      fill(#3CFF63);
      text("Make a clot of " + resourceName + "-energy with " + round(threshold) + " " + resourceName + "-particles", distClots+stabiliserClots, 250+33 + (rectY-250) );
    }


    ///////THE BUTTON
    fill(bgColour);
    rect(40, rectY, 170, 50, 10); //rectY is initially += 100
    fill(0);
    textSize(20);
    text("Merge " + resourceName + "-particles", 40+textbuttonX, 250+33 + (rectY-250) );

    fill(0);
    textSize(20);
    //if (alphas < pow(2,(float)alphaFactories)
    text("You have ", 52+153+10+10, 250+33 + (rectY-250));
    fill(#66FFFF);
    text(nf(resourceClots, 0, 0), 52+153+20+textWidth("You have "), 250+33 + (rectY-250));
    fill(0);
    text(" clots of " + resourceName + "-energy", (52+153+3+17)+textWidth("You have ")+textWidth(nf(resourceClots, 0, 0)), 250+33 + (rectY-250));

    strokeWeight(1);
    stroke(0);

    float timeToNextResourceClot = 0;
    switch (mechanic)
    {
    case 0:
      timeToNextResourceClot = (pow(a, resourceClots+1) - resource) / resourceParticlesPerSecond;
      break;
    case 1:
      timeToNextResourceClot = (b*resourceClots+10 - resource) / resourceParticlesPerSecond;
      break;
    }


    fill(255);
    if (resourceParticlesPerSecond == 0)
      text("Accumulation paused or not started", 100+153+240+390, 250+33 + (rectY-250));
    else
    {
      if (timeToNextResourceClot > 0)
      {
        int minutes = (int)(timeToNextResourceClot / 60); // Calculate full minutes
        float seconds = (timeToNextResourceClot % 60); // Calculate remaining seconds
        text("You're gonna be able to buy next clot in " + minutes + " minutes " + nf(seconds, 0, 1) + " seconds", (distClots+stabiliserClots) + distTime+stabiliserTime, 250+33 + (rectY-250));
      } else {
        text("You're gonna be able to buy next clot RIGHT NOW!", (distClots+stabiliserClots) + distTime+stabiliserTime, 250+33 + (rectY-250));
      }
    }
  }

  void mouseControl(int x, int y, int w, int h)
  {

    switch (mechanic)
    {
    case 0:
      threshold = pow(a, resourceClots+1);
      break;
    case 1:
      threshold = resourceClots*b+10;
      break;
    }


    if (mousePressed && !resourcePressed && mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h)
    {
      bgColour = 175;
      resourcePressed = true;
    } else if (!mousePressed && resourcePressed)
    {
      bgColour = 255;
      if (resource - threshold >= 0) //if we have enough possible purchases and purchasing of a factory (pow(a,(float)alphaClots+1)) - the cost of the next factory) won`t give us a negative number (we have enough money), then give a new factory, decrease the amount of alpha-particles (-money) and decrease available purchases
      {

        resource -= threshold;
        resourceClots += 1;
      }
      resourcePressed = false;
    }
  }

  float getResourceClots()
  {
    return resourceClots;
  }
  
}
