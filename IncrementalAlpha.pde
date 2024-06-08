float alphas =  82000;
float a;

float betas = 33302;
float b = 10;

float resourceClots;

int dreamX, dreamY, hopeX, hopeY, zealX, zealY, alphaX, alphaY, autoAlphaX, autoAlphaY, alphaFX, alphaFY,
  betaX, betaY, autoBetaX, autoBetaY, betaFX, betaFY, gammaX, gammaY, autoGammaX, autoGammaY, gammaFX,
  gammaFY, singX, singY, sphereX, sphereY, deltaX, deltaY;

Resources r1 = new Resources(alphas, 0, "α", 570, #EFFF66, false, 0, 255, 0);
Resources r2 = new Resources(betas, 1, "β", 1050, #A2CEFF, false, 0, 255, 1);

Fountain f1 = new Fountain (80, 90+100 + 50, 100, 600, #EFFF66, #A2CEFF, r1, "α");
Fountain f2 = new Fountain (80+500, 90+100 + 50, 100, 600, #A2CEFF, #72FF77, r2, "β");

float betaClots = r2.getResourceClots();


Cave c1 = new Cave();
Cave c2 = new Cave();

Alchemy al1 = new Alchemy();



void setup()
{
  frameRate(60);
  size(1920, 1080);
  font = createFont("Arial Unicode MS", 16);
  textFont(font);

  rectXD = 120;
  rectYD = height/2 + 80;
  rectWidthD = width-2*rectXD;
  rectHeightD = 250;

  lowerButtonX = 20;
  lowerButtonY = height - 160;
  lowerButtonWidth = 100;
  lowerButtonHeight = lowerButtonWidth;

  fountainX = 80;
  fountainY = 90+100 + 50; //currentlocation Y coordinate + 50
  fountainWidth = 80;
  fountainHeight = 600;
  fountainFilled = 0;

  buttonfountainBg_Pressed = false;
  buttonfountainBg = 255;
  buttonfountainX = fountainX + fountainWidth + 30;
  buttonfountainHeight = 40;
  buttonfountainY = fountainY + fountainHeight - buttonfountainHeight;
  buttonfountainWidth = 160;

  a = 2;
  b = 10;

  dreamX = 850;
  dreamY = 200;
  hopeX = 100;
  hopeY = 750;
  zealX = width-100-200;
  zealY = 750;
  alphaX = 100;
  alphaY = 250;
  autoAlphaX = (850+100)/2;
  autoAlphaY = 350;
  alphaFX = 100;
  alphaFY = (250+750)/2;
  betaX = width-100-200;
  betaY = 250;
  autoBetaX = (850+(width-100-200))/2;
  autoBetaY = 350;
  betaFX = width-100-200;
  betaFY = (250+750)/2;
  gammaX = 850;
  gammaY = 800;
  autoGammaX = (850+(width-100-200))/2;
  autoGammaY = 650;
  gammaFX = (850+100)/2;
  gammaFY = 650;
  singX = (850+100)/2;
  singY = (350+650)/2;
  sphereX = (850+(width-100-200))/2;
  sphereY = (350+650)/2;
  deltaX = 850;
  deltaY = (200+800)/2;

  al1.add(new AlchemyButton(dreamX, dreamY, "Dream", 30, dreamX+52, dreamY+35)); //Dream
  al1.add(new AlchemyButton(alphaX, alphaY, "α", 40, alphaX+85, alphaY+40)); //Alpha
  al1.add(new AlchemyButton(betaX, betaY, "β", 40, betaX+85, betaY+40)); //Beta    //-100 - x-coordinate, 200 - the width of rects
  al1.add(new AlchemyButton(gammaX, gammaY, "γ", 40, gammaX+85, gammaY+40)); //Gamma
  al1.add(new AlchemyButton(hopeX, hopeY, "Hope", 30, hopeX+63, hopeY+35)); //Hope
  al1.add(new AlchemyButton(zealX, zealY, "Zeal", 30, zealX+70, zealY+35)); //Zeal
  
  al1.add(new AlchemyButton(autoAlphaX, autoAlphaY, "Unlock auto α-clots\nmerging", 20, autoAlphaX+10, autoAlphaY+27)); //auto-alpha
  al1.add(new AlchemyButton(alphaFX, alphaFY, "Unlock and restart\nthe α-fountain", 20, alphaFX+10, alphaFY+27)); //alpha-fountain
  al1.add(new AlchemyButton(gammaFX, gammaFY, "Unlock and restart\nthe γ-fountain", 20, gammaFX+10, gammaFY+27)); //gamma-fountain

  al1.add(new AlchemyButton(autoBetaX, autoBetaY, "Unlock auto β-clots\nmerging", 20, autoBetaX+10, autoBetaY+27)); //auto-beta
  al1.add(new AlchemyButton(betaFX, betaFY, "Unlock and restart\nthe β-fountain", 20, betaFX+11, betaFY+27)); //beta-fountain
  al1.add(new AlchemyButton(autoGammaX, autoGammaY, "Unlock auto γ-clots\nmerging", 20, autoGammaX+10, autoGammaY+27)); //auto-gamma

  al1.add(new AlchemyButton(singX, singY, "Unlock singularity", 20, singX+10, singY+27)); //singularity
  al1.add(new AlchemyButton(sphereX, sphereY, "Unlock auto\nsphere-charging", 20, sphereX+10, sphereY+27)); //auto-sphere-charging
  
  al1.add(new AlchemyButton(deltaX, deltaY, "Unlock\nδ-particles", 25, deltaX+60, deltaY+30)); //delta-particles
  
  
  al1.addConnections();
}


void draw()
{
  float betaClots = r2.getResourceClots();
  
  background(120);
  {
    if (InterfaceParticlesShowed)
    {
      r1.currencyType(8, 250);
      if (achieved4)
        r2.currencyType(8, 350);
    }

    if (InterfaceFountainsShowed)
    {
      f1.drawIt();
      //f2.drawIt();
      f1.act();
      //f2.act();
      f1.tasksAlpha();

      if (achieved4)
      {
        f2.drawIt();
        f2.act();
        f2.tasksBeta();
      }
    }

    ///(((
    c1.mainButton(); //should be achieved4
    if (InterfaceCaveShowed)
    {
      c1.barCircle();
      c1.resourceButtons(); //((90+100+50)+400 - the circle's center, 200 - the circle's radius, 40 - 1/2 of the rect's height
      c1.probabilityMenu();
    }
  }

  if (InterfaceAlchemyShowed)
  {
    al1.buttonToCave();



    al1.show();
    //w = 200, h = 80
    /*al1.buttonConnections(alphaX+200, alphaY + 80/2, autoAlphaX, autoAlphaY + 80/2); //alpha -> autoAlpha
    al1.buttonConnections(dreamX, dreamY + 80/2, autoAlphaX+200, autoAlphaY + 80/2); //dream -> autoAlpha
    al1.buttonConnections(dreamX+200, dreamY + 80/2, autoBetaX, autoBetaY + 80/2); //dream -> autoBeta
    al1.buttonConnections(betaX, betaY+80/2, autoBetaX+200, autoBetaY + 80/2); //dream -> autoBeta

    al1.buttonConnections(gammaX, gammaY + 80/2, gammaFX+200, gammaFY + 80/2); //gamma -> gammaFountain
    al1.buttonConnections(gammaX+200, gammaY + 80/2, autoGammaX, autoGammaY + 80/2); //gamma -> autoGamma
    al1.buttonConnections(hopeX+200, hopeY + 80/2, gammaFX, gammaFY + 80/2); //hope -> gammaFountain
    al1.buttonConnections(zealX, zealY + 80/2, autoGammaX+200, autoGammaY + 80/2); //zeal -> autoGamma

    al1.buttonConnections(alphaX+200/2, alphaY+80, alphaFX+200/2, alphaFY); //alpha -> alphaFountain
    al1.buttonConnections(hopeX+200/2, hopeY, alphaFX+200/2, alphaFY+80); //hope -> alphaFountain
    al1.buttonConnections(betaX+200/2, betaY+80, betaFX+200/2, betaFY); //beta -> betaFountain
    al1.buttonConnections(zealX+200/2, zealY, betaFX+200/2, alphaFY+80); //zeal -> betaFountain

    al1.buttonConnections(alphaFX+200, alphaFY+80/2, singX, singY+80/2); //alpha-fountain -> singularity
    al1.buttonConnections(autoAlphaX+200/2, autoAlphaY+80, singX+200/2, singY); //auto-alpha -> singularity
    al1.buttonConnections(gammaFX+200/2, gammaFY, singX+200/2, singY+80); //gamma-fountain -> singularity

    al1.buttonConnections(betaFX, betaFY + 80/2, sphereX+200, sphereY+80/2); //beta-fountain -> sphere
    al1.buttonConnections(autoBetaX+200/2, autoAlphaY+80, sphereX+200/2, singY); //auto-beta -> sphere
    al1.buttonConnections(autoGammaX+200/2, autoGammaY, sphereX+200/2, sphereY+80); //auto-gamma -> sphere

    al1.buttonConnections(singX+200, singY+80/2, deltaX, deltaY+80/2); //singularity -> delta
    al1.buttonConnections(sphereX, sphereY+80/2, deltaX+200, deltaY+80/2); //sphere -> delta*/
  }





  r1.currentAlphaParticles(betaClots);
  r1.formatAlphaParticlesText();
  r1.alphaParticlesProductionSpeed();
  r1.mouseControl(40, 250, 140, 50);

  if (achieved4)
  {
    r2.currentBetaParticles();
    r2.formatAlphaParticlesText();
    r2.alphaParticlesProductionSpeed();
    r2.mouseControl(40, 250+100, 140, 50);
  }


  currentLocation();
  lowerButtons();




  /////////
  textAlign(LEFT, BASELINE);
  //dialogs();
  textAlign(LEFT, BASELINE);
}




void currentLocation()
{
  fill(0);
  textSize(30);
  text(yourlocationST, 140+630, 90+100);
  fill(#1D1264);
  text(yourlocation, 140+630+textWidth(yourlocationST)+3, 90+100);
}


void dialogs()
{
  if (/*alphaClots == 5 &&*/ page != 21)
  {
    dialog = true;
    if (page == 8)
    {
      dialogbeginning = "I'm glad to see that you have figured out how alpha particles and alpha energy clots work. It's impressive, isn't it?";
      answerbutton = "Well... I guess yes?..";
    }
  } else if (page == 21)
    dialog = false;

  if (dialog == true)
  {
    fill(170);
    rect(rectXD, rectYD, rectWidthD, rectHeightD);
    textSize(50);

    rectdialogbuttonX = rectXD+(rectWidthD-(textWidth(answerbutton)+50))/2;
    rectdialogbuttonY = rectYD+rectHeightD-75;
    rectdialogbuttonWidth = textWidth(answerbutton)+50;
    textdialogbuttonHeight = textAscent() + textDescent();
    rectdialogbuttonHeight = textdialogbuttonHeight + 20;

    fill(button_dialog_colour);
    rect(rectdialogbuttonX, rectdialogbuttonY, rectdialogbuttonWidth, rectdialogbuttonHeight, 10);
    //println(rectdialogbuttonX); 843i - 861m
    //line(rectdialogbuttonX, 0, rectdialogbuttonX ,height);
    fill(0);
    text(answerbutton, rectdialogbuttonX + (rectdialogbuttonWidth - textWidth(answerbutton) )/2, rectdialogbuttonY+(rectdialogbuttonHeight+textdialogbuttonHeight)/2 - textDescent()/2); //textAscent()/2 - середина між baseline та серединою прямокутника
    //line(0,rectbuttonY+rectbuttonHeight/2,width,rectbuttonY+rectbuttonHeight/2);
    //line(0, rectbuttonY+(rectbuttonWidth-textWidth(answer_button) )/2 + buttontextHeight/2,width, rectbuttonY+(rectbuttonWidth-textWidth(answer_button) )/2 + buttontextHeight/2 );

    //line(0,rectbuttonY+rectbuttonHeight/2,width,rectbuttonY+rectbuttonHeight/2); //baseline
    //line(0, txtY-textAscent()+textbuttonHeight/2,width,txtY-textAscent()+textbuttonHeight/2); //buttonmiddle

    //Значення rectbuttonX + (rectbuttonWidth-textWidth(answer_button) )/2
    //було підраховано шляхом складних розрахунків у IMG buttondialogXlocation


    fill(0);
    textSize(40);
    float textXD = rectXD + 20;
    float textYD = rectYD + 50;

    StringBuilder dialogline = new StringBuilder();
    String [] words = dialogbeginning.split(" ");

    for (String word : words)
    {
      if (rectXD + textWidth(dialogline.toString() + word) > rectXD + rectWidthD - 15)
      {
        text(dialogline.toString(), textXD, textYD);
        textYD += textAscent() + textDescent() + 15;
        dialogline = new StringBuilder();
      }
      dialogline.append(word).append(" ");
    }
    text(dialogline.toString(), textXD, textYD);
  }
}



void lowerButtons()
{
  if (!InterfaceAlchemyShowed)
  {
    strokeWeight(1);

    fill(lowerButtonParticlesBg);
    rect(lowerButtonX, lowerButtonY, lowerButtonWidth, lowerButtonHeight);
    fill(0);
    textSize(70);
    textAlign(CENTER, CENTER);
    text("≡", (lowerButtonX)+(lowerButtonWidth/2), lowerButtonY+(lowerButtonHeight/2)-7);

    if (true)//page >= 21)
    {
      fill(lowerButtonFountainsBg);
      rect(lowerButtonX+(lowerButtonWidth+30), lowerButtonY, lowerButtonWidth, lowerButtonHeight);
      fill(0);
      textSize(70);
      textAlign(CENTER, CENTER);
      text("╬", (lowerButtonX+(lowerButtonWidth+30) )+(lowerButtonWidth/2), lowerButtonY+(lowerButtonHeight/2)-7);
    }

    if (true)//achieved2)
    {
      fill(lowerButtonCaveBg);
      rect(lowerButtonX+2*(lowerButtonWidth+30), lowerButtonY, lowerButtonWidth, lowerButtonHeight);
      fill(0);
      textSize(70);
      textAlign(CENTER, CENTER);
      text("¤", (lowerButtonX+2*((lowerButtonWidth+30) )+(lowerButtonWidth/2)), lowerButtonY+(lowerButtonHeight/2));
    }
  }
}
