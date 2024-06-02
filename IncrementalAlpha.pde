Fountain f1 = new Fountain (80, 90+100 + 50, 100, 600);

Cave c1 = new Cave();
Cave c2 = new Cave();

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
}


void draw()
{

  background(120);
  if (InterfaceParticlesShowed)
  {
    currencyType(button_bg_alphaClots, 8, 250, alphaClots, "Unite α-particles");
  }

  if (InterfaceFountainsShowed)
  {
    f1.drawIt();
    //f2.drawIt();
    f1.act();
    //f2.act();
    f1.tasks();
  }
  
  if (InterfaceCaveShowed)
  {
    c1.barCircle();
    c1.mainButton();
    c1.resourseButtons(); //((90+100+50)+400 - the circle's center, 200 - the circle's radius, 40 - 1/2 of the rect's height
}
  currentAlphaParticles();
  formatAlphaParticlesText();
  alphaParticlesProductionSpeed();
  currentLocation();
  lowerButtons();
  



  /////////
  textAlign(LEFT, BASELINE);
  //dialogs();
  textAlign(LEFT, BASELINE);
}


void currentAlphaParticles()
{
  alphas += alphaIncreaser1*(alphaClots/100);

  if (alphas > maxalphas) //variable maxalphas will contain the greatest value of alphas which has been reached during a simulation
    maxalphas = alphas;   //in order to save the value of the next threshold of alpha particles we will be able to buy next factory with

  thresholdUpgrades = (int)(log(maxalphas)/log(a))+1; //log₂(maxalphas)  // the power of a (initially 2) of the cost of the next factory

  if (thresholdUpgrades != pthresholdUpgrades) //if the current thresholdUpgrades doesn`t equal himself previous (it happens when we buy a new factory)
  {


    pthresholdUpgrades = thresholdUpgrades; //now we don`t have previous thresholdUpgrades, they`re equal. Now we just wait for the next changing to repeat the loop
  }
}


void formatAlphaParticlesText()
{
  int exponent;
  if (alphas != 0)
  {
    exponent = (int)Math.log10(alphas);
  } else
  {
    exponent = 0;
  }

  if (alphas <= 100000)
  {

    fill(0);
    textSize(70);
    text("You have ", 140+470, 90);
    fill(#EFFF66);
    text(round(alphas), 140+470 + textWidth("You have "), 90);
    fill(0);
    text(" α-particles", 140+470 + textWidth("You have ") + textWidth(str((int)alphas)), 90);
  } else
  {
    fill(0);
    float mantissa = alphas / pow(10, exponent);
    text("You have ", 140+470, 90);
    fill(#EFFF66);
    text(nf(mantissa, 0, 1) + "e" + exponent, 140+470 + textWidth("You have "), 90);
    fill(0);
    text(" α-particles", 140+470 + textWidth("You have ") + textWidth(nf(mantissa, 0, 1) + "e" + exponent), 90);
  }
}



void alphaParticlesProductionSpeed() {
  float deltaAlphas = alphas - lastAlphaCount;
  alphaParticlesPerSecond = deltaAlphas * 60;
  textSize(30);
  fill(30);
  text("You are gaining " + nf(alphaParticlesPerSecond, 0, 1) + " α-particles per second", 700, 145);
  lastAlphaCount = alphas;
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
  if (alphaClots == 5 && page != 21)
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

void currencyType (int bg, int textbuttonX, int rectY, float currency, String buyName)
{
  ///////THE RED-GREEN TEXT
  textSize(20);
  if (alphas < (int)pow(a, (int)alphaClots+1))
  {
    strokeWeight(3);
    stroke(#FF5B5B);
    fill(#FF5B5B);
    text("Make a clot of α-energy with " + (int)pow(a, (int)alphaClots+1) + " α-particles", 100+153+240, 250+33 + (rectY-250) );
  } else
  {
    strokeWeight(3);
    stroke(#3CFF63);
    fill(#3CFF63);
    text("Make a clot of α-energy with " + (int)pow(a, (int)alphaClots+1) + " α-particles", 100+153+240, 250+33 + (rectY-250) );
  }


  ///////THE BUTTON
  fill(bg);
  rect(40, rectY, 160, 50, 10); //rectY is initially += 100
  fill(0);
  textSize(20);
  text(buyName, 40+textbuttonX, 250+33 + (rectY-250) );

  fill(0);
  textSize(20);
  //if (alphas < pow(2,(float)alphaFactories)
  text("You have ", 52+153+10, 250+33 + (rectY-250));
  fill(#66FFFF);
  text(nf(currency, 0, 0), 52+153+10+textWidth("You have "), 250+33 + (rectY-250));
  fill(0);
  text(" clots of α-energy", (52+153+3+10)+textWidth("You have ")+textWidth(nf(currency, 0, 0)), 250+33 + (rectY-250));

  strokeWeight(1);
  stroke(0);

  float timeToNextAlphaClot = ((int)pow(a, (int)alphaClots+1) - alphas) / alphaParticlesPerSecond;
  fill(255);
  if (alphaParticlesPerSecond == 0)
    text("Accumulation paused or not started", 100+153+240+390, 250+33 + (rectY-250));
  else
  {
    if (timeToNextAlphaClot > 0)
    {
      int minutes = (int)(timeToNextAlphaClot / 60); // Calculate full minutes
      float seconds = (timeToNextAlphaClot % 60); // Calculate remaining seconds
      text("You're gonna be able to buy next clot in " + minutes + " minutes " + nf(seconds, 0, 1) + " seconds", 100+153+240+390, 250+33 + (rectY-250));
    } else {
      text("You're gonna be able to buy next clot RIGHT NOW!", 100+153+240+390, 250+33 + (rectY-250));
    }
  }
}

void lowerButtons()
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
