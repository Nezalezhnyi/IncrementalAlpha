void currencyType (int bg, int textbuttonX, int rectY, float currency, String buyName)
{
  ///////THE RED-GREEN TEXT
  textSize(20);
  if (alphas < (int)pow(a,(int)alphaClots+1))
  {
    strokeWeight(3);
    stroke(#FF5B5B);
    fill(#FF5B5B);
    text("Make a clot of α-energy with " + (int)pow(a,(int)alphaClots+1) + " α-particles", 100+153+240, 250+33 + (rectY-250) );
  }
  else
  {
    strokeWeight(3);
    stroke(#3CFF63);
    fill(#3CFF63);
    text("Make a clot of α-energy with " + (int)pow(a,(int)alphaClots+1) + " α-particles", 100+153+240, 250+33 + (rectY-250) );
  }
  
  
  ///////THE BUTTON
  fill(bg);
  rect(40,rectY,152,50,10); //rectY is initially += 100
  fill(0);
  textSize(20);
  text(buyName, 40+textbuttonX, 250+33 + (rectY-250) );
  
  fill(0);
  textSize(20);
  //if (alphas < pow(2,(float)alphaFactories)
  text("You have ", 52+153+10, 250+33 + (rectY-250));
  fill(#66FFFF);
  text(nf(currency,0,0), 52+153+10+textWidth("You have "), 250+33 + (rectY-250));
  fill(0);
  text(" clots of α-energy", (52+153+3+10)+textWidth("You have ")+textWidth(nf(currency,0,0)) , 250+33 + (rectY-250));
  
  strokeWeight(1);
  stroke(0);

  
}
