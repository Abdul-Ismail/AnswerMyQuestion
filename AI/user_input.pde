class user_input {

  int insertedWordCounter = 0; //keeps track of element user is inputing
  char firstLetter = ' ';
  String questionString = "Jarvis please answer\n the following question\n ";   
  String userInput = ""; //array for input by the user 
  PImage[] cards = new PImage[52];
  int nextCall;
  int callOnce = 0; // get voice called once
  boolean flipCardSpeech = false; //speech once when flipping card
  int print = 0;
  String displayHidden = "";
  String realUserInput = "";
  int stringCounter =0; //counts length of string to skip to next line when displaying on screen
  boolean copyOnce = false;

  BufferedReader reader;
  String line;
  int stopLoop = 0;
  HashMap<String, Integer> cardToNum = new HashMap<String, Integer>();
  
  PImage backOfCard; //back of the card 
  float rotationPoint = 0.0; //start of rotation
  PGraphics flip; //used for rotatingCard function
  int cardPicked;

  user_input()
  {
        
      for ( int i = 0; i< 52; i++ )
    {
      cards[i] = loadImage( i + ".png" );
    }

    reader = createReader("cards.tab");    //opens the file
    while (stopLoop == 0)
    {
      try {
        line = reader.readLine();
      } 
      catch (IOException e) {
        e.printStackTrace();
        line = null;
      }
      if (line == null) {
        // Stop reading because of an error or file is empty
        stopLoop = 1;
      } else {
        String[] pieces = split(line, TAB);
        cardToNum.put(pieces[0], parseInt(pieces[1]));
      }
    }
    
    
  flip = createGraphics(1040, 520, P3D);
  backOfCard = loadImage("back.png" ); //to dispaly the back of the card 
  }

  int ask() {
    nextCall = 1;
    if (key == ENTER) {
      nextCall = 2;
      print = 2;
      realUserInput = "";
      displayHidden ="";
      copyOnce = false;
      println();
      key = ' ';//to remove key from having enter stored
      return nextCall;
    }

    if (insertedWordCounter == 0) {
      firstLetter = key; //checks first letter entered
    }

    //if its only first letter it wont store it in the array
    switch (firstLetter) {
    case '/':  //if first letter is / store whats being typed but display something else, this way they dont see you typign th answer
      if (insertedWordCounter < questionString.length())//display up until the end of string
      {
       displayHidden +=questionString.charAt(insertedWordCounter);
       print = 1;
      } else {
      if (copyOnce == false){
        realUserInput +=displayHidden;
        copyOnce = true;
      }
      realUserInput += key;
      print = 2;
      } //print whats being written rather from string once end of string is reached, to avoid outofbound error

      if (key == '.') { 
        firstLetter = '.'; 
        break;
      }
      if (insertedWordCounter !=0)userInput += key; //insert what the user is actually inputting 

      break;
    case '.':    //user entering question will press . to note that they are done writing the answer and rest characters shoulndt be recorded

        displayHidden +=questionString.charAt(insertedWordCounter); //will print the rest of the string from where the user pressed '.'
        print = 1;
      firstLetter = '.';

      break;
    case ',':

    default:  //if user did not click the secret key then just print out whats being entered and store that 
      realUserInput += key;
      print = 2;
    }

    insertedWordCounter+=1; 

    return nextCall;
  }//endfunction
  
    int question() {
    if (callOnce == 0) {
      speech("what is your question ?"); 
      callOnce++;
    } //need this to be displayed only once
     print = 2;
     realUserInput += key;
    if (key == ENTER) {
      nextCall = 4 ;
      callOnce = 0; //to enter that loop again if another question is asked
      print = 0;
      realUserInput = "";
    }
    return nextCall;
  }

  //displays the answer
  int answer() {

    if (cardToNum.containsKey(userInput)) {
      cardPicked = cardToNum.get(userInput);
      insertedWordCounter = 0;
      userInput = "";
      flipCardSpeech = true;
      return nextCall = 5;
    } else if(userInput != ""){ 
      speech(userInput); //if userinput is not null then it will text to speech the answer
    }else{
      speech("I only answer to abdul sorry"); //will display this if the user does not enter the answer before hand, e.g if input is empty
      return nextCall = 0;
    } 
    insertedWordCounter = 0;
    userInput = "";
    return nextCall = 0;
  }


  void speech(String text) {
    try {
      Runtime.getRuntime().exec(new String[] {"say", "-v", "Victoria", "[[rate " + Integer.toString(200) + "]]" + text});
    }
    catch (IOException e) {
      //do nothing
    }
  }
  
  
  void rotateCard(){
   /*reason for using phrapihcs is that we need the background to constanlty refresh 
   but putting it in draw refreshed background and gets rid of the card*/
   flip.beginDraw();
   flip.noFill();
    flip.background(0);
     flip.translate(550, 150);  
    flip.rotateY(rotationPoint);
println(rotationPoint);
 if (rotationPoint < 1.5810179)
 {
     flip.image(backOfCard, 20,20, 100, 145.2);
 }else   flip.image(cards[cardPicked], 20,20, 100, 145.2);
 
 if (rotationPoint <= 3.1699975){
     rotationPoint += 0.01;
 }
  

  flip.rotateY(rotationPoint * 2.0);
  flip.endDraw();
  image(flip, 0, 0); 
   //play speech once when this function is being called continouslly in draw
      if (flipCardSpeech == true) {  
        speech("Is this the ard you picked ?");
        flipCardSpeech = false;
      }
  
}

void printText(){
  fill(28, 236,76);
   textSize(10);
  if (print ==1)
  {
  text(displayHidden, 75, 220);
   if (key == BACKSPACE && displayHidden.length() > 0) {
    displayHidden = displayHidden.substring(0, displayHidden.length()-1);
     key = ' '; //remove backspace from being stored in buffer
     insertedWordCounter -=1; //goes back one in order to be at right position of string 
  } 
  }
  
  if (print ==2){
    text(realUserInput, 85, 220);
    if (key != ']'){
      stringCounter += 1;
      key = ']';
    }
      if (stringCounter >25 )
       {
         println(stringCounter);
        realUserInput+= "\n";
          stringCounter = 0;
       }  
    if (key == BACKSPACE && realUserInput.length() > 0) {
    realUserInput = realUserInput.substring(0, realUserInput.length()-1);
     key = ' '; //remove backspace from being stored in buffer
  }
  }
  noFill();
}
  
  
}//end class