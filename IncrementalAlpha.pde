float alphas =  12000;
float a;

float betas = 2;
float b = 10;

Resources r1 = new Resources(alphas, "α", 100, #EFFF66, false, 0, 255, 2);
Resources r2 = new Resources(betas, "β", 1050, #A2CEFF, false, 0, 255, 10);

Fountain f1 = new Fountain (80, 90+100 + 50, 100, 600, #EFFF66, #A2CEFF, r1, "α");
Fountain f2 = new Fountain (80+500, 90+100 + 50, 100, 600, #A2CEFF, 5, r2, "β");


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
  
  a = 2;
  b = 10;
}


void draw()
{

  background(120);
  if (InterfaceParticlesShowed)
  {
    r1.currencyType(8, 250);
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
    }
    f2.act();
  }
  
  
  ///(((
  if (InterfaceCaveShowed)
  {
    c1.barCircle();
    c1.resourceButtons(); //((90+100+50)+400 - the circle's center, 200 - the circle's radius, 40 - 1/2 of the rect's height
    c1.probabilityMenu();
  }
  c1.mainButton();
  //)))
  
  r1.currentAlphaParticles();
  r1.formatAlphaParticlesText();
  r1.alphaParticlesProductionSpeed();
  r1.mouseControl(40, 250, 140, 50);
  
  r2.currentBetaParticles();
  r2.formatAlphaParticlesText();
  r2.alphaParticlesProductionSpeed();
  r2.mouseControl(40, 250+100, 140, 50);
  
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
