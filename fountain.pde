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
  boolean isSecondsDecremented = false;
  int mechanic;
  int stabiliser;

  public Fountain(int xx, int yy, int ww, int hh, int c, int cL, Resources r, String n, int max, int mech)
  {
    x=xx;
    y=yy;
    h=hh;
    w=ww;
    colour = c;
    colourLast = cL;
    resource = r;
    name = n;
    filledMax = max;
    mechanic = mech;

    filled=57;
  }

  void drawIt()
  {

    /*switch(mechanic)
     {
     case 0:
     stabiliser = 3;
     break;
     case 1:
     stabiliser = 3;
     break;
     case 2:
     stabiliser = 0;
     break;
     }*/

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

    int exponent;
    if (filled != 0)
    {
      exponent = (int)Math.log10(filled);
    } else
    {
      exponent = 0;
    }
    float mantissa = filled / pow(10, exponent);

    float textfilledsizeLess = textWidth(str(round(filled))) + textWidth(" " + name);
    float textfilledsizeGreater = textWidth(nf(mantissa, 0, 1) + "e" + exponent) + textWidth(" " + name);



    if (filled < 100000)
      text(round(filled) + " " + name, 80+100/2 - textfilledsizeLess/2+x-w+20, (90+100 + 50) + 600 - 10);
    else
      text(nf(mantissa, 0, 1) + "e" + exponent + " " + name, 80+100/2 - textfilledsizeGreater/2+x-w+20, (90+100 + 50) + 600 - 10);
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
        resource.addResource(-resource.getResource()/100);
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

    first = 500;
    float triangle1 = (y+h-1)-(first/filledMax * h)+3;
    second = 2500;
    float triangle2 = (y+h-1)-(second/filledMax * h)+3;
    third = 7500;
    float triangle3 = (y+h-1)-(third/filledMax * h)+3;
    fourth = 10000;
    float triangle4 = (y+h-1)-(fourth/filledMax * h)+3;

    firstBg = secondBg = thirdBg = fourthBg = 0;
    firstStroke = firstText = secondStroke = secondText = thirdStroke = thirdText = colour;
    fourthStroke = fourthText = colourLast;



    if (filled >= 500)
    {
      firstBg = colour;
      firstStroke = colour;
      firstText = 0;
      achievedBeta1 = true;
    }

    stroke(colour);
    strokeWeight(2);
    fill(firstBg);
    triangle(x+w+strW, triangle1, x+w+strW+10, triangle1-5, x+w+strW+10, triangle1+5);
    rect(x+w+strW+10, triangle1-70/2, 300, 70, 15);
    textSize(22);
    fill(firstText);
    text("500 β: β-clots increases\nproducing of α-particles", x+w+strW+10+15, triangle1-50/2+21);
    stroke(0);


    if (filled >= 2500)
    {
      secondBg = colour;
      secondStroke = colour;
      secondText = 0;
      achievedBeta2 = true;
      b = 5;
    }
    stroke(secondStroke);
    strokeWeight(2);
    fill(secondBg);
    triangle(x+w+strW, triangle2, x+w+strW+10, triangle2-5, x+w+strW+10, triangle2+5);
    rect(x+w+strW+10, triangle2-70/2, 300, 70, 15);
    textSize(22);
    fill(secondText);
    text("2500 β: Reduces the growth\nrate of merging costs ", x+w+strW+10+15, triangle2-50/2+21);
    stroke(0);


    if (filled >= 7500)
    {
      thirdBg = colour;
      thirdStroke = colour;
      thirdText = 0;
      achievedBeta3 = true;
    }


    stroke(thirdStroke);
    strokeWeight(2);
    fill(thirdBg);
    triangle(x+w+strW, triangle3, x+w+strW+10, triangle3-5, x+w+strW+10, triangle3+5);
    rect(x+w+strW+10, triangle3-70/2, 300, 70, 15);
    textSize(22);
    fill(thirdText);
    text("7500 β: reduces the sphere\ncharging time by 1 second ", x+w+strW+10+15, triangle3-50/2+21);
    stroke(0);

    if (filled == 10000)
    {
      fourthBg = colourLast;
      fourthStroke = colourLast;
      fourthText = 0;
      achievedBeta4 = true;
    }


    stroke(fourthStroke);
    strokeWeight(2);
    fill(fourthBg);
    triangle(x+w+strW, triangle4, x+w+strW+10, triangle4-5, x+w+strW+10, triangle4+5);
    rect(x+w+strW+10, triangle4-70/2, 300, 70, 15);
    textSize(22);
    fill(fourthText);
    text("10000 β: open γ-particles\nand a new fountain", x+w+strW+10+15, triangle4-50/2+21);
    stroke(0);
  }

  void tasksGamma()
  {


    first = 100000; //1e5
    float triangle1 = (y+h-1)-(first/filledMax * h)+3;
    second = 300000;
    float triangle2 = (y+h-1)-(second/filledMax * h)+3;
    third = 500000;
    float triangle3 = (y+h-1)-(third/filledMax * h)+3;
    fourth = 750000;
    float triangle4 = (y+h-1)-(fourth/filledMax * h)+3;
    fifth = 1000000;
    float triangle5 = (y+h-1)-(fifth/filledMax * h)+3;

    firstBg = secondBg = thirdBg = fourthBg = fifthBg = 0;
    firstStroke = firstText = secondStroke = secondText = thirdStroke = thirdText = fourthStroke = fourthText = colour;
    fifthStroke = fifthText = colourLast;



    if (filled >= 100000)
    {
      firstBg = colour;
      firstStroke = colour;
      firstText = 0;
      g = 5;
    }

    stroke(colour);
    strokeWeight(2);
    fill(firstBg);
    triangle(x+w+strW, triangle1, x+w+strW+10, triangle1-5, x+w+strW+10, triangle1+5);
    rect(x+w+strW+10, triangle1-70/2, 300, 70, 15);
    textSize(22);
    fill(firstText);
    text("1e5 γ: Reduces the growth\nrate of merging cost", x+w+strW+10+15, triangle1-50/2+21);
    stroke(0);


    if (filled >= 300000)
    {
      secondBg = colour;
      secondStroke = colour;
      secondText = 0;
      gammaImprover = 1.2;
    }

    stroke(secondStroke);
    strokeWeight(2);
    fill(secondBg);
    triangle(x+w+strW, triangle2, x+w+strW+10, triangle2-5, x+w+strW+10, triangle2+5);
    rect(x+w+strW+10, triangle2-70/2, 300, 70, 15);
    textSize(22);
    fill(secondText);
    text("3e5 γ: Makes γ-clots more\npowerful", x+w+strW+10+15, triangle2-50/2+21);
    stroke(0);


    if (filled >= 500000)
    {
      thirdBg = colour;
      thirdStroke = colour;
      thirdText = 0;
      reactionsTime = 3000;
    }


    stroke(thirdStroke);
    strokeWeight(2);
    fill(thirdBg);
    triangle(x+w+strW, triangle3, x+w+strW+10, triangle3-5, x+w+strW+10, triangle3+5);
    rect(x+w+strW+10, triangle3-70/2, 300, 70, 15);
    textSize(21);
    fill(thirdText);
    text("5e5 γ: Reduces the duration\nof alchemical reactions by 2s", x+w+strW+10+15, triangle3-50/2+21);
    stroke(0);

    if (filled >= 750000)
    {
      fourthBg = colour;
      fourthStroke = colour;
      fourthText = 0;
      g = 3;
    }

 
    stroke(fourthStroke);
    strokeWeight(2);
    fill(fourthBg);
    triangle(x+w+strW, triangle4, x+w+strW+10, triangle4-5, x+w+strW+10, triangle4+5);
    rect(x+w+strW+10, triangle4-70/2, 300, 95, 15);
    textSize(22);
    fill(fourthText);
    text("7,5e5 γ: Much more reduces\nthe growth rate of merging\ncost", x+w+strW+10+15, triangle4-50/2+21);
    stroke(0);


    if (filled == 1000000)
    {
      fifthBg = colourLast;
      fifthStroke = colourLast;
      fifthText = 0;
      gammaImprover = 1.5;
    }


    stroke(fifthStroke);
    strokeWeight(2);
    fill(fifthBg);
    triangle(x+w+strW, triangle5, x+w+strW+10, triangle5-5, x+w+strW+10, triangle5+5);
    rect(x+w+strW+10, triangle5-70/2, 300, 70, 15);
    textSize(22);
    fill(fifthText);
    text("1e6 γ: Makes γ-clots\nsignificantly more powerful", x+w+strW+10+15, triangle5-50/2+21);
    stroke(0);
  }
}
