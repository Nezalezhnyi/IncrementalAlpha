class Fountain
{
  int x, y, w, h, bg, inc, strW, buttonH;
  float filledMax, filled;
  int first, second, third, fourth, fifth;
  boolean filledBool;
  int firstBg, firstStroke, firstText, secondBg, secondStroke, secondText,
  thirdBg, thirdStroke, thirdText, fourthBg, fourthStroke, fourthText, 
  fifthBg, fifthStroke, fifthText;
  
  public Fountain(int xx, int yy, int ww, int hh)
  {
    x=xx;
    y=yy;
    h=hh;
    w=ww;
    filled=57;
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
    rect(x+strW-1, y+h-1, w-strW, -(filled/filledMax * h)+3); //the yellow rect

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
    println(filled/filledMax * h);
    println(h);
    println();
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
        filled = (int)(filledMax);
        filledBool = true;
      }
    } else
    {
      bg = 255;
    }
  }

  void tasks()
  {
    achieved2 = false;
    
    first = 250;
    float triangle1 = (y+h-1)-(first/filledMax * h)+3;
    second = 2000;
    float triangle2 = (y+h-1)-(second/filledMax * h)+3;
    
    firstBg = 0;
    firstStroke = #EFFF66;
    firstText = #EFFF66;
    secondBg = 0;
    secondStroke = #EFFF66;
    secondText = #EFFF66;
    
    if (filled >= 250)
    {
      firstBg = #EFFF66;
      firstStroke = #EFFF66;
      firstText = 0;
      alphaIncreaser1 = 3;
    }

    stroke(firstStroke);
    strokeWeight(2);
    fill(firstBg);
    triangle(x+w+strW, triangle1, x+w+strW+10, triangle1-5, x+w+strW+10, triangle1+5);
    rect(x+w+strW+10, triangle1-70/2, 300, 70, 15);
    textSize(22);
    fill(firstText);
    text("250 α: Triple the production", x+w+strW+10+15, triangle1-50/2+21);
    text("rate of α-particles", x+w+strW+10+15, triangle1-50/2+20+26);
    stroke(0);
    
    
    if (filled >= 2000)
    {
      secondBg = #EFFF66;
      secondStroke = #EFFF66;
      secondText = 0;
      achieved2 = true;
    }
    stroke(secondStroke);
    strokeWeight(2);
    fill(secondBg);
    triangle(x+w+strW, triangle2, x+w+strW+10, triangle2-5, x+w+strW+10, triangle2+5);
    rect(x+w+strW+10, triangle2-70/2, 300, 70, 15);
    textSize(22);
    fill(secondText);
    text("2000 α: Opens access to", x+w+strW+10+15, triangle2-50/2+21);
    text("the cave of emptiness", x+w+strW+10+15, triangle2-50/2+20+26);
    stroke(0);
  }
}
