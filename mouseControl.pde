void mousePressed()
{
  if (mouseX >= 40 && mouseX <= 180 && mouseY >= 250 && mouseY <= 300)
  {
    if (availablePurchases > 0 && (alphas - pow(a,(float)alphaFactories+1)) >= 0) //if we have enough possible purchases and purchasing of a factory (pow(a,(float)alphaFactories+1)) - the cost of the next factory) won`t give us a negative number (we have enough money), then give a new factory, decrease the amount of alpha-particles (-money) and decrease available purchases 
    {
      button_bg_alphaFactories = 175;
      buttonPressed_alphaFactories = true;
      alphaFactories += 1;
      alphas -= pow(a,(float)alphaFactories);
      availablePurchases -=1;
    }
  }
  
  
  if (mouseX >= 415 && mouseX <= 415+160 && mouseY >= height/2+275 && mouseY <= height/2+275+40 && page == 1)
  {
    button_dialog_colour = 175;
    button_dialog_pressed = true;
    
   
    page = 2;  
  }
  
  else if (mouseX >= 415 && mouseX <= 415+160 && mouseY >= height/2+275 && mouseY <= height/2+275+40 && page == 2)
  {
    button_dialog_colour = 175;
    button_dialog_pressed = true;
    
    
    yourlocation = yourlocationN;
    voidUniverse = voidUniverseN;
    textAdd1_3 = "VOID";
    page = 3;
  }
  
  else if (mouseX >= 415 && mouseX <= 415+160 && mouseY >= height/2+275 && mouseY <= height/2+275+40 && page == 3)
  {
    button_dialog_colour = 175;
    button_dialog_pressed = true;
    
    
    page = 4;
    textAdd1_3 = "";
  }
  
  else if (mouseX >= 415 && mouseX <= 415+160 && mouseY >= height/2+275 && mouseY <= height/2+275+40 && page == 4)
  {
    button_dialog_colour = 175;
    button_dialog_pressed = true;
    
  
    page = 5;
  }
  
  else if (mouseX >= 415 && mouseX <= 415+160 && mouseY >= height/2+275 && mouseY <= height/2+275+40 && page == 5)
  {
    button_dialog_colour = 175;
    button_dialog_pressed = true;
    
   
    textAdd1_6 = "(You got 1 α-particle)";
    page = 6;
    alphas = 2;
  }
  
   else if (mouseX >= 415 && mouseX <= 415+160 && mouseY >= height/2+275 && mouseY <= height/2+275+40 && page == 6)
   {
     button_dialog_colour = 175;
     button_dialog_last_pressed = true;
   }
}
  



void mouseReleased() {
  if (buttonPressed_alphaFactories) 
  {
    button_bg_alphaFactories = 255;
    buttonPressed_alphaFactories = false;
  }
  
  if (button_dialog_pressed)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
  }
  
  if (button_dialog_last_pressed)
  {
    button_dialog_last_pressed = false;
    dialog = false;
  }
  
}
