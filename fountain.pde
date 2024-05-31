class Fountain
{
  int x, y, w, h, bg, inc, strW, buttonH;
  float filledMax, filled;
  boolean filledBool;

  public Fountain(int xx, int yy, int ww, int hh)
  {
    x=xx;
    y=yy;
    h=hh;
    w=ww;
    filled=0;
    filledMax = 10000;
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
    rect(x+strW-1, y + h-(filled/filledMax)*h-1, w-strW, filled/filledMax * h); //the yellow rect

    strokeWeight(strW);


    if (!filledBool)
    {
      fill(bg);
      rect(x, y - buttonH - 20, w, buttonH, 15); //this is the button
      fill(0);
      float textH = (textAscent() + textDescent())/2;
      textSize(25);
      text("Fill", x+(w-textWidth("Fill"))/2, (y - buttonH - 20) + textH);
    } else
    {
      fill(#EFFF66);
      rect(x, y - buttonH - 20, w, buttonH, 15); //this is the button
      fill(0);
      float textH = (textAscent() + textDescent())/2;
      textSize(25);
      text("Filled", x+(w-textWidth("Filled"))/2, (y - buttonH - 20) + textH);
    }

    float textfilledsize = textWidth(str(round(filled))) + textWidth(" α");
    text(round(filled) + " α", 80+100/2 - textfilledsize/2, (90+100 + 50) + 600 - 10);
    println(1000-alphas);
    println(filled);
  }

  void act()
  {
    inc = 5;
    if (mousePressed && mouseX>x && mouseX < x+(w+strW)
      && mouseY > (y - buttonH - 20) && mouseY < (y - buttonH - 20) + buttonH)
    {
      bg = 175;
      if (alphas - alphas/10 > 0 && filled < filledMax)
      {
        filled += alphas/100;
        alphas -= alphas/100;
      } else
      {
        filled = (int)filledMax;
        filledBool = true;
      }
    } else
    {
      bg = 255;
    }
  }
}
