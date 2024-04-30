int page = 1;
String redbuttontext = ""; 
boolean gameIsStarted = false;

void mousePressed()
{
  textSize(50); //pro?
  rectdialogbuttonX = rectXD+(rectWidthD-(textWidth(answerbutton)+50))/2;
  rectdialogbuttonY = rectYD+rectHeightD-80;
  rectdialogbuttonWidth = textWidth(answerbutton)+50;
  rectdialogbuttonHeight = textdialogbuttonHeight + 20;


  if (mouseX >= 40 && mouseX <= 180 && mouseY >= 250 && mouseY <= 300)
  {

    if (availablePurchases > 0 && (alphas - pow(a, (float)alphaClots+1)) >= 0) //if we have enough possible purchases and purchasing of a factory (pow(a,(float)alphaClots+1)) - the cost of the next factory) won`t give us a negative number (we have enough money), then give a new factory, decrease the amount of alpha-particles (-money) and decrease available purchases
    {
      button_bg_alphaClots = 175;
      buttonPressed_alphaClots = true;
    }
  }


  if (mouseX >= rectdialogbuttonX && mouseX <= rectdialogbuttonX+rectdialogbuttonWidth && mouseY >= rectdialogbuttonY && mouseY <= rectdialogbuttonY+rectdialogbuttonHeight)
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


  if (button_dialog_pressed && page == 1)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Well, well, well! Who might you be, and how in the world did you end up in this grim predicament? Ah, forget it. Seems we're stuck here together, swallowed up by this dismal place, whether we like it or not.";
    answerbutton = "I don't understand, where am I?";
    page = 2;
  }
  
  if (button_dialog_pressed && page == 2)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Ah, you're wondering where you are? Well, friend, you've stumbled into the Void—a place of pure darkness, pain, and suffering. It's like the universe's ultimate bad neighborhood, where everything's just bleak and downright rough. Welcome to the grim side of existence, my dude.";
    answerbutton = "It still doesn't make much sense";
    page = 3;
    
    yourlocationST = "You are currently in ";
    yourlocation = "the Void";
  }

  if (button_dialog_pressed && page == 3)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Eh, don't worry if it doesn't all add up yet. You'll start piecing it together bit by bit. Now, you're probably itching to know how to get out of this mess, right? Well, lucky for you, I've got the answer.";
    answerbutton = "So tell me finally!";
    page = 4;
  }
  
  if (button_dialog_pressed && page == 4)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Whoa there, hold your horses! The solution's right under your nose, my friend. You've actually got what I've been searching for this whole time—the alpha-particle. It's right there in your hand, and you didn't even notice it!";
    answerbutton = "Oh, it... Shines";
    page = 5;
  }
  
  if (button_dialog_pressed && page == 5)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "It sure does shine! Now here's the kicker—you gotta merge that particle with mine to create more alpha-particles! That's the ticket to turning things around in this dark place.";
    answerbutton = "I still can't get how it's gonna help us leave this place";
    page = 6;
  }
  
  if (button_dialog_pressed && page == 6)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "No time to break it down now! Just take the particle and merge them together. I'll fill you in on the plan once we're done with this stage.";
    answerbutton = "Alright... (TAKE THE PARTICLE)";
    page = 7;
  }
  
  if (button_dialog_pressed && page == 7)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialog = false;
    alphas = 2;
    gameIsStarted = true;
  }
  
}
