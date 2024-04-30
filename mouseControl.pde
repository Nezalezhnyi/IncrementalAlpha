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

    if (alphas - pow(a, (float)alphaClots+1) >= 0) //if we have enough possible purchases and purchasing of a factory (pow(a,(float)alphaClots+1)) - the cost of the next factory) won`t give us a negative number (we have enough money), then give a new factory, decrease the amount of alpha-particles (-money) and decrease available purchases
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
    dialogbeginning = "No time to break it down now! Just take the particle and merge them together. I'll fill you in on the plan once we're done with this stage. I'll be right back in a minute!";
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
    page = 8;
  }

  if (button_dialog_pressed && page == 8)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Everything in this world is connected. Every atom, every particle of energy. To create the next clot of energy, you need twice as many alpha particles as you used for the previous one. Do not ask why and how this happens. No one understands the logic of this world.";
    answerbutton = "Do not ask \"Why it happens?\" ";
    page = 9;
  }

  if (button_dialog_pressed && page == 9)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "As for the Void, it's something like a dimension of our Universe, with which others are intertwined to some extent. But there's a Rift has been appeared in the Void that directly affects every point of the Universe. Perhaps this is what brings people and other creatures from different parts of the Universe here.";
    answerbutton = "Continue...";
    page = 10;
  }

  if (button_dialog_pressed && page == 10)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "I am not sure if the closure of the Rift will allow us to return to our dimension. But it should definitely stop bringing people here. I guess. In any case, we have no choice but to try to make it work.";
    answerbutton = "You're right. Continue...";
    page = 11;
  }

  if (button_dialog_pressed && page == 11)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "To close the Rift, we need 5 types of particles. The first one is α-particles, which you're already familiar with. The second is β-particles. We're gonna talk about them a bit later.";
    answerbutton = "Continue...";
    page = 12;
  }

  if (button_dialog_pressed && page == 12)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "The third one... Honestly, I don't remember anymore. Perhaps they're all named with Greek letters? Alpha, beta... Gamma? It makes sense a bit.";
    answerbutton = "Greek letters? Why are these particles called this way in another Universe?";
    page = 13;
  }

  if (button_dialog_pressed && page == 13)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Dimension.";
    answerbutton = "Huh?";
    page = 14;
  }

  if (button_dialog_pressed && page == 14)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Dimension. You said \"Universe\". The Void is not a Universe, it's the dimension of our Universe.";
    answerbutton = "Damn, you got what I meant! Continue!";
    page = 15;
  }

  if (button_dialog_pressed && page == 15)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Whoa, whoa, okay, calm down! It's hard to explain... Everything works in this Dimension... Not in the way our brains are used to understanding. When you interact with other beings, you will always hear α and β. While they will hear the names of their interpretation.";
    answerbutton = "Other beigns?";
    page = 16;
  }
  
  if (button_dialog_pressed && page == 16)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Other beings! Just imagine, it turned out that we are not alone in the Universe! These aliens are very similar to humans in terms of physiology. It seems that life develops in the same way everywhere.";
    answerbutton = "That's... Really impressive. But how do you understand them?";
    page = 17;
  }
  
  if (button_dialog_pressed && page == 17)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "As I said, things work differently in this world. We understand each other by speaking our own languages. It's like we're transmitting neural signals of what we're trying to say. It's hard to explain, you have to go through it yourself";
    answerbutton = "Alright. What about our particles?";
    page = 18;
  }
  
  if (button_dialog_pressed && page == 18)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "I don't remember the names of the other three particles, let alone how to get them. It's like a déjà vu that sometimes comes to my mind and then is instantly forgotten. So let's focus on β-particles.";
    answerbutton = "How can we get them?";
    page = 19;
  }
  
  if (button_dialog_pressed && page == 19)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    dialogbeginning = "Shortly before meeting you, I found a dark source that takes α-particles and... Let's just say it enhances them. Makes them stronger. When we fill it completely, it should give us β-particles.";
    answerbutton = "So what are we waiting for? Lead me!";
    page = 20;
  }
  
  if (button_dialog_pressed && page == 20)
  {
    button_dialog_colour = 255;
    button_dialog_pressed = false;
    page = 21;
  }
}
