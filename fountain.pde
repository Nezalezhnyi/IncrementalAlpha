class Fountain
{
  int x, y, h, w, filled, bg, inc, strW, buttonH;
  boolean filledBool;

  public Fountain(int xx, int yy, int ww, int hh)
  {
    x=xx;
    y=yy;
    h=hh;
    w=ww;
    filled=0;
  }

  void drawIt()
  {
    strW = 3;
    buttonH = 40;
    fill(180);
    strokeWeight(strW);
    rect(x, y, w, h); //the normal rect

    strokeWeight(0);
    fill(#EFFF66);
    rect(x+strW-1, y + h-filled-1, w-strW, filled); //the yellow rect

    strokeWeight(strW);


    if (!filledBool)
    {
      fill(bg);
      rect(x, y - buttonH - 20, w, buttonH, 15); //this is the button
      fill(0);
      float textH = (textAscent() + textDescent())/2;
      textSize(25);
      text("Fill", x+(w-textWidth("Fill"))/2, (y - buttonH - 20) + textH);
    }
    else
    {
      fill(#EFFF66);
      rect(x, y - buttonH - 20, w, buttonH, 15); //this is the button
      fill(0);
      float textH = (textAscent() + textDescent())/2;
      textSize(25);
      text("Filled", x+(w-textWidth("Filled"))/2, (y - buttonH - 20) + textH);
    }
  }

  void act()
  {
    inc = 5;
    if (mousePressed && mouseX>x && mouseX < x+(w+strW)
      && mouseY > (y - buttonH - 20) && mouseY < (y - buttonH - 20) + buttonH)
    {
      bg = 175;
      if (alphas - alphas/10 > 0 && filled <= (float)h-2*strW)
      {
        filled += alphas/100;
        alphas -= alphas/100;
      } else if (filled > h-2*strW)
      {
        filled = h-strW;
        filledBool = true;
      }
    } else
    {
      bg = 255;
    }
  }
}
