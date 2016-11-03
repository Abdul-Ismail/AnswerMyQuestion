BufferedReader reader;
String line;
    HashMap<String, Integer> cardToNum = new HashMap<String, Integer>();
 
void setup() {
  reader = createReader("cards.tab");    //opens the file
}
 
void draw() {
  try {
    line = reader.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line == null) {
    // Stop reading because of an error or file is empty
    noLoop();  
  } else {
    String[] pieces = split(line, TAB);
      cardToNum.put(pieces[0], parseInt(pieces[1]));
  }
  



} 