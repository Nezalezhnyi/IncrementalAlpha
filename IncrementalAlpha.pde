float alphas = 1;
float maxalphas = 2;
float alphaFactories = 0;

int button_bg_alphaFactories = 255;
boolean buttonPressed_alphaFactories = false;

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
int corrX = 0;

PFont font;


void setup() 
{
  size(1920, 700);
  
  font = createFont("Arial",32,true);
  

}


void draw()
{
  background(100);
  
  int time = millis()/1000;
  float speedAlphas = alphaFactories/1000; 

  
  int exponent;
  if (alphas != 0) 
  {
    exponent = (int)Math.log10(alphas);
  } 
  else 
  {
    exponent = 0;
  }
  
  if (alphas <= 100000)
  {
    
  fill(0);
  textSize(70);
  text("You have ", 140, 90);
  fill(#EFFF66);
  text(nf(alphas,0,1), 140 + textWidth("You have "), 90);
  fill(0);
  text(" α-particles", 140 + textWidth("You have ") + textWidth(nf(alphas,0,1)), 90);
  }
  else
  {
    float mantissa = alphas / pow(10, exponent);
    textSize(70);
    text("You have " + nf(mantissa,0,1) + "e" + exponent + " α-particles", 70, 70);
  }
  textSize(30);
  text(yourlocation, 140+150, 90+60);
  fill(#1D1264);
  text(voidUniverse, 140+150+textWidth(yourlocationN)+3, 90+60);
 
  
  alphas += alphaFactories/100;
  

  
  if (alphas > maxalphas) //variable maxalphas will contain the greatest value of alphas which has been reached during a simulation
    maxalphas = alphas;   //in order to save the value of the next threshold of alpha particles we will be able to buy next factory with
  
  currencyType(button_bg_alphaFactories, 8, 250, alphaFactories, "α-factory", "Unite α-particles");
  
  
  thresholdUpgrades = (int)(log(maxalphas)/log(a))+1; //log₂(maxalphas)  // the power of a (initially 2) of the cost of the next factory
  
  
  if (thresholdUpgrades != pthresholdUpgrades) //if the current thresholdUpgrades doesn`t equal himself previous (it happens when we buy a new factory) 
  {
    availablePurchases += 1; //then give us one availablePurchases (the hidden value which means how many factories it is possible to buy currently, considering current alpha-particles and factories we already have bought. It was made in order to control alpha-particals so that they don`t get below zero)
        
    pthresholdUpgrades = thresholdUpgrades; //now we don`t have previous thresholdUpgrades, they`re equal. Now we just wait for the next changing to repeat the loop
  }
  
  //DIALOGS///////////////////////////
  if(dialog == true)
  {
  fill(170);
  rect(120, height/2+80, width-280, 250);
  
  textSize(40);
  fill(0);
  text(dialbeginningP1, 140, height/2+140);
  fill(0);
  text(dialbeginningP2, 140, height/2+140+55);
  text(dialbeginningP3, 140, height/2+140+55*2);
  fill(#1D1264);
  text(textAdd1_3, 140+25 + textWidth("Yea, stick! Welco"), height/2+140+55*2); //blue VOID
  fill(#EFFF66);
  text(textAdd1_6, 140 + textWidth("energy") + 8, height/2+140+55*2);
  
  fill(button_dialog_colour);
  rect(400, height/2+275, 160, 40,   10);
  textSize(25); 
  fill(0);
  text(answer_button1, 400 + 35 + corrX, (height/2+288)+15);
  }
  //DIALOGS///////////////////////////
  
  
  //println("Available: " + availablePurchases);
  //println("Dep: " + (alphas - pow(a,(float)thresholdUpgrades-1)));
  //println("thresholdUpgrades: " + (int)thresholdUpgrades);
  //println("Speed: " + speedAlphas + " alpha/s");
  //println(page);
  //println(corrX);
  println(button_dialog_last_pressed);
  println(dialog);
  
  textSize(40);
  //text("Next α-factory at " + nf(pow(a,(float)(thresholdUpgrades)),0,1) + " α-particles", 70, 70+50);
  //text("You can buy " + (int)(availablePurchases) + " α-factory", 70, 70+100);
  
 
}

  
 
