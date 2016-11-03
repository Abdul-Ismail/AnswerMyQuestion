class user_input{
  
int insertedWordCounter = 0; //keeps track of element user is inputing
  char firstLetter = ' ';
  String questionString = "Abdul please answer this question";   
  String userInput; //array for input by the user
  int checker;
  int element1, element2 = 99;
  int cardPicked;
  PImage[] cards = new PImage[53];

void user_input()
{
    
}

int ask() {
    
    if (key == ENTER) {
      println(); 
      println(userInput);
    }
    
      if (insertedWordCounter == 0){
          firstLetter = key; //checks first letter entered
        }
    
    //if its only first letter it wont store it in the array
     switch (firstLetter){
     case '/':  //if first letter is / store whats being typed but display something else, this way they dont see you typign th answer
         if (insertedWordCounter < questionString.length())//display up until the end of string
           {
               print(questionString.charAt(insertedWordCounter));
           }else{print(key);} //print whats being written rather from string once end of string is reached, to avoid outofbound error
           
         userInput += key; //insert what the user is actually inputting 
     
      break;
      case '.':    //user entering question will press . to note that they are done writing the answer and rest characters shoulndt be recorded
       
          print(questionString.charAt(insertedWordCounter)); //will print the rest of the string from where the user pressed '.'
          firstLetter = '.';
          println("we in");
        
    
      break;
      case ',':
        print(questionString.charAt(insertedWordCounter));
          if (key == '.'){
             firstLetter = '.'; 
             break;
         }
            userInput += key;
                        
     break;
     default:  //if user did not click the secret key then just print out whats being entered and stored that 
       print(key);
         userInput += key;
        
     }
  
   
      insertedWordCounter+=1; 
 return cardPicked;
}//endfunction

//displays the answer
void display(){
   for ( int i = 0; i< 53; i++ )
{
  cards[i] = loadImage( i + ".png" );   
}
  image(cards[cardPicked], 25,25, cards[1].width/2, cards[1].height/2);
}

}//end class