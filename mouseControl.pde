void mousePressed()
{
  if (mouseX >= 40 && mouseX <= 180 && mouseY >= 250 && mouseY <= 300)
  {
    if (availablePurchases > 0 && (alphas - pow(a, (float)alphaClots+1)) >= 0) //if we have enough possible purchases and purchasing of a factory (pow(a,(float)alphaClots+1)) - the cost of the next factory) won`t give us a negative number (we have enough money), then give a new factory, decrease the amount of alpha-particles (-money) and decrease available purchases
    {
      button_bg_alphaClots = 175;
      buttonPressed_alphaClots = true;
    }
  }


  if (mouseX >= 415 && mouseX <= 415+160 && mouseY >= height/2+275 && mouseY <= height/2+275+40 && page == 1)
  {
    button_dialog_colour = 175;
    button_dialog_pressed = true;
  }
}




void mouseReleased() {
  if (buttonPressed_alphaClots)
  {
    button_bg_alphaClots = 255;
    buttonPressed_alphaClots = false;
    alphaClots += 1;
    alphas -= pow(a, (float)alphaClots);
    availablePurchases -=1;
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
