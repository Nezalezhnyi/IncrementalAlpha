class Resources
{
  int youHaveResourceX, resourceColour, bgColour;
  float resource, maxResource, resourceParticlesPerSecond, lastResourceCount;
  double thresholdUpgrades, pthresholdUpgrades;
  String resourceName;
  boolean resourcePressed;
  float resourceClots;
  int alphaChanger, betaChanger;

  public Resources(float r, String rn, int textX, int colour, boolean pressed, int clots, int bgCol, int max)
  {
    resource = r;
    resourceName = rn;
    resourcePressed = pressed;
    youHaveResourceX = textX;
    resourceColour = colour;
    resourceClots = clots;
    bgColour = bgCol;
    maxResource = max;

    pthresholdUpgrades = thresholdUpgrades;
    maxResource = 2;
    resourceParticlesPerSecond = 0;
    lastResourceCount = 0;
    bgColour = 255;
    maxResource = 2;
    alphaChanger = (int)pow(a, (int)resourceClots+1);
    
  }

  void addResource(float r)
  {
    resource += r;
  }

  float getResource()
  {
    return resource;
  }


  void currentAlphaParticles()
  {
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
      text("You have ", youHaveResourceX, 90);
      fill(resourceColour);
      text(round(resource), youHaveResourceX + textWidth("You have "), 90);
      fill(0);
      text(" " + resourceName + "-particles", youHaveResourceX + textWidth("You have ") + textWidth(str((int)resource)), 90);
    } else
    {
      fill(0);
      textSize(70);
      float mantissa = resource / pow(10, exponent);
      text("You have ", youHaveResourceX, 90);
      fill(resourceColour);
      text(nf(mantissa, 0, 1) + "e" + exponent, youHaveResourceX + textWidth("You have "), 90);
      fill(0);
      text(" " + resourceName + "-particles", youHaveResourceX + textWidth("You have ") + textWidth(nf(mantissa, 0, 1) + "e" + exponent), 90);
    }
  }



  void alphaParticlesProductionSpeed()
  {
    float deltaAlphas = resource - lastResourceCount;
    resourceParticlesPerSecond = deltaAlphas * 60;
    textSize(30);
    fill(30);
    text("You are gaining " + nf(resourceParticlesPerSecond, 0, 1) + " " + resourceName + "-particles per second", youHaveResourceX+30+textWidth(str((int)resource)), 145);
    lastResourceCount = resource;
  }


  void currencyType (int textbuttonX, int rectY)
  {
    ///////THE RED-GREEN TEXT
    textSize(20);
    float distClots = textWidth("You have ") + textWidth(nf(resourceClots, 0, 0)) + textWidth(" clots of " + resourceName + "-energy");
    float distTime = textWidth("Make a clot of " + resourceName + "-energy with ") + textWidth(str((int)pow(a, (int)resourceClots+1))) + textWidth(" " + resourceName + "-particles");
    int stabiliserClots = 240;
    int stabiliserTime = 20;
    if (resource < (int)pow(a, (int)resourceClots+1))
    {
      strokeWeight(3);
      stroke(#FF5B5B);
      fill(#FF5B5B);
      text("Make a clot of " + resourceName + "-energy with " + (int)pow(a, (int)resourceClots+1) + " " + resourceName + "-particles", distClots+stabiliserClots, 250+33 + (rectY-250) );
    } else
    {
      strokeWeight(3);
      stroke(#3CFF63);
      fill(#3CFF63);
      text("Make a clot of " + resourceName + "-energy with " + (int)pow(a, (int)resourceClots+1) + " " + resourceName + "-particles", distClots+stabiliserClots, 250+33 + (rectY-250) );
    }


    ///////THE BUTTON
    fill(bgColour);
    rect(40, rectY, 160, 50, 10); //rectY is initially += 100
    fill(0);
    textSize(20);
    text("Unite " + resourceName + "-particles", 40+textbuttonX, 250+33 + (rectY-250) );

    fill(0);
    textSize(20);
    //if (alphas < pow(2,(float)alphaFactories)
    text("You have ", 52+153+10, 250+33 + (rectY-250));
    fill(#66FFFF);
    text(nf(resourceClots, 0, 0), 52+153+10+textWidth("You have "), 250+33 + (rectY-250));
    fill(0);
    text(" clots of " + resourceName + "-energy", (52+153+3+10)+textWidth("You have ")+textWidth(nf(resourceClots, 0, 0)), 250+33 + (rectY-250));

    strokeWeight(1);
    stroke(0);

    float timeToNextAlphaClot = ((int)pow(a, (int)resourceClots+1) - resource) / resourceParticlesPerSecond;
    fill(255);
    if (resourceParticlesPerSecond == 0)
      text("Accumulation paused or not started", 100+153+240+390, 250+33 + (rectY-250));
    else
    {
      if (timeToNextAlphaClot > 0)
      {
        int minutes = (int)(timeToNextAlphaClot / 60); // Calculate full minutes
        float seconds = (timeToNextAlphaClot % 60); // Calculate remaining seconds
        text("You're gonna be able to buy next clot in " + minutes + " minutes " + nf(seconds, 0, 1) + " seconds", (distClots+stabiliserClots) + distTime+stabiliserTime, 250+33 + (rectY-250));
      } else {
        text("You're gonna be able to buy next clot RIGHT NOW!", (distClots+stabiliserClots) + distTime+stabiliserTime, 250+33 + (rectY-250));
      }
    }
  }

  void mouseControl(int x, int y, int w, int h)
  {
    if (mousePressed && !resourcePressed && mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h)
    {
      bgColour = 175;
      resourcePressed = true;
    } else if (!mousePressed && resourcePressed)
    {
      bgColour = 255;
      if (resource - pow(a, (float)resourceClots+1) >= 0) //if we have enough possible purchases and purchasing of a factory (pow(a,(float)alphaClots+1)) - the cost of the next factory) won`t give us a negative number (we have enough money), then give a new factory, decrease the amount of alpha-particles (-money) and decrease available purchases
      {
        resourceClots += 1;
        resource -= pow(a, (float)resourceClots);
      }
      resourcePressed = false;
    }
  }
}
