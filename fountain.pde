class Fountain
{
  int x, y, w, h, bg, inc, strW, buttonH, colour, colourLast;
  float filledMax, filled;
  Resources resource;
  int first, second, third, fourth, fifth;
  boolean filledBool;
  int firstBg, firstStroke, firstText, secondBg, secondStroke, secondText,
    thirdBg, thirdStroke, thirdText, fourthBg, fourthStroke, fourthText,
    fifthBg, fifthStroke, fifthText;
  String name;

  public Fountain(int xx, int yy, int ww, int hh, int c, int cL, Resources r, String n)
  {
    x=xx;
    y=yy;
    h=hh;
    w=ww;
    filled=57;
    filledMax = 10000;
    colour = c;
    colourLast = cL;
    resource = r;
    name = n;
  }

  void drawIt()
  {
    strW = 3;
    buttonH = 40;
    fill(180);
    strokeWeight(strW);
    rect(x, y, w, h); //the normal rect

    strokeWeight(0);
    fill(colour);
    rect(x+strW-1, y+h-1, w-strW, -(filled/filledMax * h)+3); //the colour rect


    if (!filledBool)
    {
      fill(bg);
      rect(x, y - buttonH - 20, w, buttonH, 15); //this is the button
      fill(0);
      float textH = 30;
      textSize(25);
      text("Fill", x+(w-textWidth("Fill"))/2, (y - buttonH - 20) + textH);
    } else
    {
      fill(colour);
      rect(x, y - buttonH - 20, w, buttonH, 15); //this is the button
      fill(0);
      float textH = 30;
      textSize(25);
      text("Filled", x+(w-textWidth("Filled"))/2, (y - buttonH - 20) + textH);
    }

    float textfilledsize = textWidth(str(round(filled))) + textWidth(" " + name);
    text(round(filled) + " " + name, 80+100/2 - textfilledsize/2+x-w+20, (90+100 + 50) + 600 - 10);
    
  }

  void act()
  {
    inc = 5;
    if (mousePressed && mouseX>x && mouseX < x+(w+strW)
      && mouseY > (y - buttonH - 20) && mouseY < (y - buttonH - 20) + buttonH)
    {
      bg = 175;
      if (resource.getResource() - resource.getResource()/10 > 0 && filled < filledMax)
      {
        filled += resource.getResource()/100;
        resource.addResource(-resource.getResource()/100); //alphas -> resource (alphas does not decrease)
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

  void tasksAlpha()
  {
    achieved2 = false;

    first = 250;
    float triangle1 = (y+h-1)-(first/filledMax * h)+3;
    second = 2000;
    float triangle2 = (y+h-1)-(second/filledMax * h)+3;
    third = 5000;
    float triangle3 = (y+h-1)-(third/filledMax * h)+3;
    fourth = 10000;
    float triangle4 = (y+h-1)-(fourth/filledMax * h)+3;

    firstBg = secondBg = thirdBg = fourthBg = 0;
    firstStroke = firstText = secondStroke = secondText = thirdStroke = thirdText = colour;
    fourthStroke = fourthText = colourLast;



    if (filled >= 250)
    {
      firstBg = colour;
      firstStroke = colour;
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
      secondBg = colour;
      secondStroke = colour;
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


    if (filled >= 5000)
    {
      thirdBg = colour;
      thirdStroke = colour;
      thirdText = 0;
      achieved3 = true;
      a = 2 - (0.9/5000) * (filled-5000);
    }


    stroke(thirdStroke);
    strokeWeight(2);
    fill(thirdBg);
    triangle(x+w+strW, triangle3, x+w+strW+10, triangle3-5, x+w+strW+10, triangle3+5);
    rect(x+w+strW+10, triangle3-70/2, 300, 95, 15);
    textSize(22);
    fill(thirdText);
    text("5000 α: α-merging cost", x+w+strW+10+15, triangle3-50/2+21);
    text("decreases depending on", x+w+strW+10+15, triangle3-50/2+20+26);
    text("sacrificed α-particles", x+w+strW+10+15, triangle3-50/2+20*2+31);
    stroke(0);

    if (filled == 10000)
    {
      fourthBg = #A2CEFF;
      fourthStroke = #A2CEFF;
      fourthText = 0;
      achieved4 = true;
    }


    stroke(fourthStroke);
    strokeWeight(2);
    fill(fourthBg);
    triangle(x+w+strW, triangle4, x+w+strW+10, triangle4-5, x+w+strW+10, triangle4+5);
    rect(x+w+strW+10, triangle4-70/2, 300, 70, 15);
    textSize(22);
    fill(fourthText);
    text("10000 α: open β-particles ", x+w+strW+10+15, triangle4-50/2+21);
    text("and a new fountain", x+w+strW+10+15, triangle4-50/2+20+26);
    stroke(0);
  }
  
  void tasksBeta()
  {
    achieved2 = false;

    first = 250;
    float triangle1 = (y+h-1)-(first/filledMax * h)+3;
    second = 2000;
    float triangle2 = (y+h-1)-(second/filledMax * h)+3;
    third = 5000;
    float triangle3 = (y+h-1)-(third/filledMax * h)+3;
    fourth = 10000;
    float triangle4 = (y+h-1)-(fourth/filledMax * h)+3;

    firstBg = secondBg = thirdBg = fourthBg = 0;
    firstStroke = firstText = secondStroke = secondText = thirdStroke = thirdText = colour;
    fourthStroke = fourthText = colourLast;



    if (filled >= 250)
    {
      firstBg = colour;
      firstStroke = colour;
      firstText = 0;
      alphaIncreaser1 = 3;
    }

    stroke(colour);
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
      secondBg = colour;
      secondStroke = colour;
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


    if (filled >= 5000)
    {
      thirdBg = colour;
      thirdStroke = colour;
      thirdText = 0;
      achieved3 = true;
      a = 2 - (0.9/5000) * (filled-5000);
    }


    stroke(thirdStroke);
    strokeWeight(2);
    fill(thirdBg);
    triangle(x+w+strW, triangle3, x+w+strW+10, triangle3-5, x+w+strW+10, triangle3+5);
    rect(x+w+strW+10, triangle3-70/2, 300, 95, 15);
    textSize(22);
    fill(thirdText);
    text("5000 α: α-merging cost", x+w+strW+10+15, triangle3-50/2+21);
    text("decreases depending on", x+w+strW+10+15, triangle3-50/2+20+26);
    text("sacrificed α-particles", x+w+strW+10+15, triangle3-50/2+20*2+31);
    stroke(0);

    if (filled == 10000)
    {
      fourthBg = colourLast;
      fourthStroke = colourLast;
      fourthText = 0;
      achieved4 = true;
    }


    stroke(fourthStroke);
    strokeWeight(2);
    fill(fourthBg);
    triangle(x+w+strW, triangle4, x+w+strW+10, triangle4-5, x+w+strW+10, triangle4+5);
    rect(x+w+strW+10, triangle4-70/2, 300, 70, 15);
    textSize(22);
    fill(fourthText);
    text("10000 α: open β-particles ", x+w+strW+10+15, triangle4-50/2+21);
    text("and a new fountain", x+w+strW+10+15, triangle4-50/2+20+26);
    stroke(0);
  }
}
