class user_input{
  
int insertedWordCounter = 0; //keeps track of element user is inputing
  char firstLetter = ' ';
  String questionString = "Abdul please answer this question";   
  char input[]=new char[100]; //stores what user is typing
  int checker;
  int element1, element2 = 99;
  int cardPicked;
  PImage[] cards = new PImage[53];

void user_input()
{
    
}

int ask() {
    
    if (key == ENTER) {
      String str1 = new String(input);
      println(); println(cardPicked);
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
           
        input[insertedWordCounter] = key; //insert what the user is actually inputting 
     
      break;
      case '.':    //user entering question will press . to note that they are done writing the answer and rest characters shoulndt be recorded
       
          print(questionString.charAt(insertedWordCounter)); //will print the rest of the string from where the user pressed '.'
          firstLetter = '.';
        
    
      break;
      case ',':
          if (insertedWordCounter == 3){
             firstLetter = '.';  
         }
              print(questionString.charAt(insertedWordCounter));
                        
         if (insertedWordCounter != 0 && insertedWordCounter !=3 && key != '.'){ 
             if (insertedWordCounter == 1) {element1 = key-48; }else {element2 = key-48 ; } 
              }else if (key == '.') {firstLetter = '.';}
              if ( element2 != 99){ //enters this statement if a secodn interger was entered
                cardPicked = (element1*10) + element2; //adds the first integer to the second making a interger value such as 00
              }else cardPicked = element1; //if only one integer was entered then just copy that one without any math operations
     break;
     default:  //if user did not click the secret key then just print out whats being entered and stored that 
       print(key);
         input[insertedWordCounter] = key;
        
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

}//endclass