BufferedReader reader;
String line;
int stopLoop = 0;
    HashMap<String, Integer> cardToNum = new HashMap<String, Integer>();
 
void setup() {
  reader = createReader("cards.tab");    //opens the file
  while(stopLoop == 0)
  {
   try {
    line = reader.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line == null) {
    // Stop reading because of an error or file is empty
   stopLoop = 1;
  } else {
    String[] pieces = split(line, TAB);
      cardToNum.put(pieces[0], parseInt(pieces[1]));
      println(pieces[0], pieces[1]);
  }
  }
}
 
void draw() {

  



} 