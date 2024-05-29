class Fountain
{
  int x, y, h, w, filled, bg, inc, strW, buttonH;

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
    rect(x, y, w, h);
    strokeWeight(0);
    fill(#EFFF66);
    rect(x+strW, y + h-filled, w, filled); 
    strokeWeight(1);
    fill(bg);
    
    fill(255);
    rect(x, y - buttonH - 20, w, buttonH); //this is the button
    fill(0);
    float textS = (textAscent() + textDescent())/2;
    textSize(25);
    text("Fill", x+(w-textWidth("Fill"))/2, (y - buttonH - 20) + buttonH/2 + textS);
  }
  void act()
  {
    inc = 5;
    if (mousePressed && mouseX>x && mouseX < x+(w+strW)
      && mouseY > y - buttonH - 20 && mouseY < y - buttonH - 20 + buttonH)
    {
      bg = 175;
      if (alphas - alphas/10 > 0 && filled <= (float)h-8)
      {
        filled += alphas/100;
        alphas -= alphas/100;
      } else if (filled > h-8)
        filled = h-3;
    } else
    {
      bg = 255;
    }
  }
}
