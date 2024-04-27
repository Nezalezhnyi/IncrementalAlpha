float alphas = 1;
float maxalphas = 2;
float alphaClots = 0;

int button_bg_alphaClots = 255;
boolean buttonPressed_alphaClots = false;

double thresholdUpgrades;
double pthresholdUpgrades = thresholdUpgrades;
double availablePurchases = 0;

float a = 2;
float newPrice = 0;

int page = 1;
int button_dialog_colour = 255;
boolean button_dialog_pressed = false;
boolean button_dialog_last_pressed = false;
boolean dialog = true;


void setup()
{

  size(1920, 1080);
}

void draw()
{
  /////DIALOG RECT/////////////////////////////////////////////////////////////////
  int rectXD = 120;
  int rectYD = height/2 + 80;
  int rectWidthD = width-2*rectXD;
  int rectHeightD = 250;
  /////DIALOG RECT/////////////////////////////////////////////////////////////////



  background(100);


  //int time = millis()/1000;
  //float speedAlphas = alphaFactories/1000;



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
    text("You have ", 140+490, 90);
    fill(#EFFF66);
    text(nf(alphas, 0, 1), 140+490 + textWidth("You have "), 90);
    fill(0);
    text(" α-particles", 140+490 + textWidth("You have ") + textWidth(nf(alphas, 0, 1)), 90);
  } else
  {
    float mantissa = alphas / pow(10, exponent);
    textSize(70);
    text("You have " + nf(mantissa, 0, 1) + "e" + exponent + " α-particles", 70, 70);
  }


  textSize(30);
  text(yourlocation, 140+150, 90+60);
  fill(#1D1264);
  text(voidUniverse, 140+150+textWidth(yourlocationN)+3, 90+60);


  /////CURRENT ALPHA/////////////////////////////////////////////////////////////////
  alphas += alphaClots/100;

  if (alphas > maxalphas) //variable maxalphas will contain the greatest value of alphas which has been reached during a simulation
    maxalphas = alphas;   //in order to save the value of the next threshold of alpha particles we will be able to buy next factory with

  thresholdUpgrades = (int)(log(maxalphas)/log(a))+1; //log₂(maxalphas)  // the power of a (initially 2) of the cost of the next factory

  if (thresholdUpgrades != pthresholdUpgrades) //if the current thresholdUpgrades doesn`t equal himself previous (it happens when we buy a new factory)
  {
    availablePurchases += 1; //then give us one availablePurchases (the hidden value which means how many factories it is possible to buy currently, considering current alpha-particles and factories we already have bought. It was made in order to control alpha-particals so that they don`t get below zero)

    pthresholdUpgrades = thresholdUpgrades; //now we don`t have previous thresholdUpgrades, they`re equal. Now we just wait for the next changing to repeat the loop
  }
  /////CURRENT ALPHA/////////////////////////////////////////////////////////////////


  currencyType(button_bg_alphaClots, 8, 250, alphaClots, "Unite α-particles");


  /////DIALOGS///////////////////////////////////////////////////////////////////////

  if (dialog == true)
  {
    fill(170);
    rect(rectXD, rectYD, rectWidthD, rectHeightD);
    textSize(50);

    float rectdialogbuttonX = rectXD+(rectWidthD-(textWidth(answerbutton)+50))/2;
    float rectdialogbuttonY = rectYD+rectHeightD-80;
    float rectdialogbuttonWidth = textWidth(answerbutton)+50;
    float textdialogbuttonHeight = textAscent() + textDescent();
    float rectdialogbuttonHeight = textdialogbuttonHeight + 20;

    fill(255);
    rect(rectdialogbuttonX, rectdialogbuttonY, rectdialogbuttonWidth, rectdialogbuttonHeight, 10);
    fill(0);
    text(answerbutton, rectdialogbuttonX + (rectdialogbuttonWidth - textWidth(answerbutton) )/2, rectdialogbuttonY+(rectdialogbuttonHeight+textdialogbuttonHeight)/2 - textDescent()/2); //textAscent()/2 - середина між baseline та серединою прямокутника
    //line(0,rectbuttonY+rectbuttonHeight/2,width,rectbuttonY+rectbuttonHeight/2);
    //line(0, rectbuttonY+(rectbuttonWidth-textWidth(answer_button) )/2 + buttontextHeight/2,width, rectbuttonY+(rectbuttonWidth-textWidth(answer_button) )/2 + buttontextHeight/2 );
    
    //line(0,rectbuttonY+rectbuttonHeight/2,width,rectbuttonY+rectbuttonHeight/2); //baseline
    //line(0, txtY-textAscent()+textbuttonHeight/2,width,txtY-textAscent()+textbuttonHeight/2); //buttonmiddle

    //Значення rectbuttonX + (rectbuttonWidth-textWidth(answer_button) )/2
    //було підраховано шляхом складних розрахунків у IMG buttondialogXlocation
  }

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
  /////DIALOGS//////////////////////////////////////////////////////////////////////


  /////THE CEMETRY OF printlnS/////

  //println("Available: " + availablePurchases);
  //println("Dep: " + (alphas - pow(a,(float)thresholdUpgrades-1)));
  //println("thresholdUpgrades: " + (int)thresholdUpgrades);
  //println("Speed: " + speedAlphas + " alpha/s");
  //println(page);
  //println(corrX);
  //println(button_dialog_last_pressed);
  //println(dialog);

  //textSize(40);
  //text("Next α-factory at " + nf(pow(a,(float)(thresholdUpgrades)),0,1) + " α-particles", 70, 70+50);
  //text("You can buy " + (int)(availablePurchases) + " α-factory", 70, 70+100);

  /////THE CEMETRY OF printlnS/////
}
